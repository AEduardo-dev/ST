(********************************************************************
 * COPYRIGHT 2014 machineering GmbH & Co. KG
 ********************************************************************
 * Programm: MNG_Interface
 * Datei: MNG_Interface.fun
 * Autor: machineering GmbH & Co. KG
 * Erstellt: 24. Februar 2014
 ********************************************************************
 * Funktionen und Funktionsblöcke des Programmes MNG_Interface
 ********************************************************************)

FUNCTION_BLOCK MNG_COPY_MSG_TO_INPUTS
	VAR_OUTPUT
		Counter : UDINT;
		Success : BOOL;
	END_VAR
	VAR_IN_OUT
		fromServer : MNG_RawDatagram;
		inputs : MNG_APPLICATION_INPUTS_32BIT;
	END_VAR
	VAR
		datagramType : MNG_DatagramType;
		DWordBuffer : UDINT; (* convert DWORD data *)
		DIntBuffer : DINT; (* convert DINT data *)
		byteCount : UDINT;
		numSignalsInMessage : UDINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MNG_COPY_OUTPUTS_INTO_MSG (*TODO: Bitte Kommentar hier einfügen*) (*$GROUP=Anwender*)
	VAR_INPUT
		Counter : UDINT;
	END_VAR
	VAR_IN_OUT
		toServer : MNG_RawDatagram;
		outputs : MNG_APPLICATION_OUTPUTS_32BIT;
	END_VAR
	VAR
		DWordBuffer : UDINT; (* convert DWORD data *)
		DIntBuffer : DINT; (* convert DINT data *)
	END_VAR
END_FUNCTION_BLOCK
