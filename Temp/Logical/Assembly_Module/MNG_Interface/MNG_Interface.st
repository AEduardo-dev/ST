(********************************************************************
 * COPYRIGHT 2014 machineering GmbH & Co. KG 
 ********************************************************************
 * Programm: MNG_Interface
 * Datei: MNG_Interface.st
 * Autor: machineering GmbH & Co. KG
 * Erstellt: 22. Februar 2014
 ********************************************************************
 * Implementierung des Programms MNG_Interface
 ********************************************************************)

PROGRAM _INIT

	state := 0;
        // sendTON(IN := FALSE, PT := SimSendCycleTime);

END_PROGRAM


PROGRAM _CYCLIC

	CASE state OF
		0:						// Init
			options := tcpOPT_REUSEADDR;
			
			tcpIOCtl.enable := FALSE;
			tcpIOCtl();
			tcpOpen.enable := FALSE;
			tcpOpen();
			tcpClient.enable := FALSE;
			tcpClient();
			tcpSend.enable := FALSE;
			tcpSend();
			tcpRecv.enable := FALSE;
			tcpRecv();
			tcpClose.enable := FALSE;
			tcpClose();
			
//			logCreate(enable := TRUE, pName := ADR(MNG_ModuleName), len := 20000, memType := arlogDRAM);
//			logWrite.enable := TRUE;
//			logWrite.ident := logCreate.ident;
//			
//		    logWrite(logLevel := arlogLEVEL_INFO, asciiString := ADR('Starting simulation interface'));
			
			connectionTON.IN := FALSE;
			connectionTON.PT := T#3s;
			
			state := 10;
			
		10:						// prepare socket
			
			// create a socket
			tcpOpen.pIfAddr := 0;  // All interfaces
			tcpOpen.port := port;
			tcpOpen.options := options;
			tcpOpen.enable := FALSE;
			tcpOpen();
			
			// general initializations
			Recv_offset := 0;
			
			IF Connect THEN
				state := 11;
				connectionTON.IN := FALSE;
			END_IF
			
		11:						// open the socket		
			tcpOpen.enable := Connect;
			tcpOpen();
			IF tcpOpen.status = 0 THEN
				// logWrite(logLevel := arlogLEVEL_INFO, asciiString := ADR('Socket opened.'));
				
				state := 20;
				tcpIOCtl(enable := FALSE);
				
				connectionTON.IN := FALSE;
			END_IF
			
		20:						// set the parameters on the socket
			tcpIOCtl.enable := TRUE;
			tcpIOCtl.pData := ADR(one);
			tcpIOCtl.datalen := 4;
			tcpIOCtl.ident := tcpOpen.ident;
			tcpIOCtl.ioctl := tcpTCP_NODELAY_SET;
			tcpIOCtl();
			
			IF tcpIOCtl.status = 0 THEN
				// logWrite(logLevel := arlogLEVEL_INFO, asciiString := ADR('IOCTL set.'));
				
				state := 30;
				tcpClient(enable := FALSE);
				connectionTON.IN := FALSE;
			END_IF
			
		30:						// Connect to remote adr : port
			tcpClient.enable := TRUE;
			tcpClient.ident := tcpOpen.ident;
			tcpClient.portserv := SimServerPort;
			tcpClient.pServer := ADR(SimServerAddress);
			tcpClient();
			IF tcpClient.status = ERR_FUB_BUSY THEN
				state := state;
			ELSIF tcpClient.status = 0 THEN
				// logWrite(logLevel := arlogLEVEL_INFO,  asciiString := ADR('Connection established.'));
				
				state := 40;
				connectionTON.IN := FALSE;
				sendDone := TRUE;
			END_IF
			
		40:						// Connected: recv and send
			tcpRecv.enable := TRUE;
			tcpRecv.ident := tcpOpen.ident;
			tcpRecv.datamax := SIZEOF(RecvBuffer) - Recv_offset;
			tcpRecv.pData := ADR(RecvBuffer) + Recv_offset;
			
			tcpRecv();
			
			IF tcpRecv.status = 0 THEN
				
				
				connectionTON.IN := FALSE;
				
				recvLen := tcpRecv.recvlen;
				potMsgLen := N_TO_HUDINT(RecvBuffer[4]) + 16;
				totalRecvLen := Recv_offset + recvLen;
				// if smaller than empty datagram or datagram integrity broken
				IF totalRecvLen < 16 OR totalRecvLen < potMsgLen THEN
					// wait for more data
					Recv_offset := Recv_offset + recvLen;
				ELSE 
					
					WHILE potMsgLen > 0 AND potMsgLen <= totalRecvLen DO
							
						// misconfigured message sizes
						IF potMsgLen > SIZEOF(RecvMessage) THEN
							// logWrite(logLevel := arlogLEVEL_INFO, asciiString := ADR('Misconfigured message size, please increase MNG_MaxPaxload.'));
							state := 101;
							RETURN;
						END_IF
					
						// Currently: copy the first message
						brsmemcpy(ADR(RecvMessage), ADR(RecvBuffer), potMsgLen);  
						totalRecvLen := totalRecvLen - potMsgLen;
						// move the remaining buffer
						brsmemmove(ADR(RecvBuffer), ADR(RecvBuffer)+potMsgLen, totalRecvLen);  
						
						// call the copy callback
						copyInputs(fromServer := RecvMessage, inputs := SimInputs);
						IF NOT copyInputs.Success THEN
							// logWrite(logLevel := arlogLEVEL_INFO, asciiString := ADR('Message could not be read, skipping.'));
							state := state;
						END_IF
						
						Counter := copyInputs.Counter;
						Recv_offset := totalRecvLen;
						
						IF totalRecvLen > 16 THEN
							potMsgLen := N_TO_HUDINT(RecvBuffer[4]) + 16;
						ELSE 
							potMsgLen := 0;
						END_IF
						
					END_WHILE
						
				END_IF
			END_IF
			
                        sendTON(IN := sendDone, PT := SimSendCycleTime);
				
			IF sendTON.Q OR tcpSend.enable THEN
				IF sendDone THEN
					sendDone := FALSE;
					copyOutputs(toServer := SendMessage, outputs := SimOutputs, Counter := Counter);
					tcpSend.enable := TRUE;
					tcpSend.ident := tcpOpen.ident;
					tcpSend.datalen := 16 + (SimOutputs.NumSignals + 1) * 4;  // calc
					tcpSend.pData := ADR(SendMessage);
					tcpSend.flags := 0;
				END_IF
				
				tcpSend();
				
				IF tcpSend.status = 0 THEN
					IF tcpSend.sentlen <> tcpSend.datalen THEN
						// logWrite(logLevel := arlogLEVEL_INFO, asciiString := ADR('Could not send complete msg.'));
						state := state;
						//RETURN;
					END_IF	
					tcpSend.enable := FALSE;
					sendDone := TRUE;
				END_IF
			END_IF
			
		100: 					// Error, disconnect
			// logWrite(logLevel := arlogLEVEL_INFO, asciiString := ADR('Closing connection.'));
			tcpClose.enable := TRUE;
			tcpClose.ident := tcpOpen.ident;
			tcpClose.how := 0;
			tcpClose();
			
			IF tcpClose.status = 0 THEN
				state := 0;
			END_IF
		
		ELSE
			// 101: message too long please change message max configuration
		
			state := 100;
			
	END_CASE;
	
	connectionTON();
	connectionTON.IN := TRUE;
	IF connectionTON.Q THEN
//		IF logCreate.ident > 0 THEN
//			logWrite(logLevel := arlogLEVEL_INFO, asciiString := ADR('Timeout exceeded.'));
//		END_IF
		
		state := 100;
		connectionTON.IN := FALSE;
	END_IF
			
END_PROGRAM

PROGRAM _EXIT

		

(* TODO : Code hier einfügen *)


END_PROGRAM
