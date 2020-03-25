(********************************************************************
 * COPYRIGHT machineering GmbH & Co. KG
 ********************************************************************
 * Programm: MNG_Interface
 * Datei: MNG_Interface.typ
 * Autor: machineering GmbH & Co. KG
 * Erstellt: 22. Februar 2014
 ********************************************************************
 * Lokale Datentypen des Programms MNG_Interface
 ********************************************************************)

TYPE
	MNG_DatagramType : 
		( (*Dead man datagram signalizing peer is alive *)
		MNG_DeadManDatagram := 0, (*Time tick synchonisation *)
		MNG_TimeTick, (*Time tick synchonisation *)
		MNG_TimeTickRequest, (*Initialization of the connection *)
		MNG_InitConnection, (*Reset simulation *)
		MNG_ResetSimulation, (*Rewind simulation *)
		MNG_RewindSimulation, (*Start simulation *)
		MNG_StartSimulation, (*Stop simulation *)
		MNG_StopSimulation, (*IO Config datagram *)
		MNG_IOConfig, (*Complete Raw IO Image *)
		MNG_RawIOImage, (*Complete Raw 32 Bit IO Image *)
		MNG_Raw32BitImage, (*Delta IO, only ios that have changed *) (* IODelta, *) (*Text datagram *)
		MNG_TextDatagram, (*Unknown Datagram (future updates of peer, not supported by this side) *)
		MNG_UnknownDatagram
		);
	MNG_DatagramHeader : 	STRUCT 
		Counter : UDINT; (* Time when datagram has been created *)
		SentTime : UDINT; (* Time when datagram has been sent *)
		DatagramType : UDINT := 0; (* Type of the datagram *)
		ByteCount : UDINT := 0; (* Byte count in the payload *)
	END_STRUCT;
	MNG_DataArray :ARRAY[1..1400]OF UDINT;  (* user data of max. length *) (* binary TCP/IP datagram (4 byte aligned) *)
	MNG_RawDatagram : 	STRUCT 
		Header : MNG_DatagramHeader; (* datagram header *)
		Payload : MNG_DataArray;
	END_STRUCT;
END_TYPE
