 (*******************************************************************
 * Implementation of program EventLog
 ********************************************************************)

PROGRAM _INIT
	strcpy(ADR(EventLog.Event.AdditionalData),ADR('This is an information entry from the user, which could contain anything up to the length being written in this message.'));
	EventLog.Event.AdditionalDataSize := strlen(ADR(EventLog.Event.AdditionalData)) + 1;
	EventLog.Event.AdditionalDataFormat := arEVENTLOG_ADDFORMAT_TEXT;
	(*See ArEventLog help for the description of the event id, facilities 0-15 are reserved for customer use.*)
	
	(* We first try to delete the logger, then create it again, and if the creation works correctly we will receive a successs message through the logger *)
	ST_Last_Info_Written := 0;
	Assembly_Last_Info_Written := 0;
	General_Last_Info_Written := 0;
	EventLog.Commands.CreateUserLog := TRUE;
	Event_Code := 250;
	EventLog.Commands.WriteUserEvent := TRUE;
END_PROGRAM

PROGRAM _CYCLIC	
	
	CASE EventLog.Data.Step OF		
		(*Waits for user input (command).*)
		STEP_WAIT_FOR_INPUT:
			
			IF EventLog.Commands.DeleteUserLog THEN
				EventLog.Commands.DeleteUserLog := FALSE;
				EventLog.Data.Step := STEP_GET_LOGBOOK_IDENT;
				EventLog.Data.GetIdentFailNextStep := STEP_ERROR;
				EventLog.Data.GetIdentOkNextStep := STEP_DELETE_LOGBOOK;
			ELSIF EventLog.Commands.CreateUserLog THEN
				EventLog.Commands.CreateUserLog := FALSE;
				EventLog.Data.Step := STEP_GET_LOGBOOK_IDENT;
				EventLog.Data.GetIdentFailNextStep := STEP_CREATE_LOGBOOK;
				EventLog.Data.GetIdentOkNextStep := STEP_WAIT_FOR_INPUT;
			ELSIF EventLog.Commands.ReadLatestEvent THEN
				EventLog.Commands.ReadLatestEvent := FALSE;
				EventLog.Data.Step := STEP_GET_LOGBOOK_IDENT;
				EventLog.Data.GetIdentFailNextStep := STEP_ERROR;
				EventLog.Data.GetIdentOkNextStep := STEP_GET_LATEST_RECORD_ID;
			ELSIF EventLog.Commands.WriteUserEvent THEN
								
				(*Definition of the message before writting it to be sure a knew event_ID will not overwrite it*)
				EventLog.FunctionBlocks.ArEventLogWrite_0.EventID := Events[Event_Code].ID;
				EventLog.FunctionBlocks.ArEventLogWrite_0.AddData := ADR(Events[Event_Code].Event_Message);
				
				(*Detection of info messages*)
				IF Events[Event_Code].Severity_Code = arEVENTLOG_SEVERITY_INFO THEN
					Info_Event := TRUE;
				ELSE
					Info_Event := FALSE;
				END_IF;
				
				(*We only write in the logger if the message we are about to write is not the last one written or if the las info message written in the logger is not the one we are trying to write now*)
				IF (Event_Code <> Last_Event_Written AND NOT Info_Event) OR 
					(Info_Event AND (Event_Code <> ST_Last_Info_Written AND Event_Code <> Assembly_Last_Info_Written AND General_Last_Info_Written <> Event_Code))
					THEN		
					EventLog.Commands.WriteUserEvent := FALSE;
					EventLog.Data.Step := STEP_GET_LOGBOOK_IDENT;
					EventLog.Data.GetIdentFailNextStep := STEP_ERROR;
					EventLog.Data.GetIdentOkNextStep := STEP_WRITE_EVENT;						
				ELSE
					EventLog.Commands.WriteUserEvent := FALSE;
					EventLog.Data.Step := STEP_WAIT_FOR_INPUT;
				END_IF;
				
			ELSIF EventLog.Commands.ReadPreviousEvent THEN
				EventLog.Commands.ReadPreviousEvent := FALSE;
				EventLog.Data.Step := STEP_GET_LOGBOOK_IDENT;
				EventLog.Data.GetIdentFailNextStep := STEP_ERROR;
				EventLog.Data.GetIdentOkNextStep := STEP_GET_PREVIOUS_RECORD_ID;
			END_IF
        
			(*Gets the ident of the user logbook "STEvents".*)
		STEP_GET_LOGBOOK_IDENT:
						
			IF EventLog.FunctionBlocks.ArEventLogGetIdent_0.Done THEN
				EventLog.FunctionBlocks.ArEventLogGetIdent_0.Execute := FALSE;
				EventLog.Data.Ident := EventLog.FunctionBlocks.ArEventLogGetIdent_0.Ident;
				EventLog.Data.StatusID := ERR_OK;
				EventLog.Data.Step := EventLog.Data.GetIdentOkNextStep;
			ELSIF EventLog.FunctionBlocks.ArEventLogGetIdent_0.Error THEN
				EventLog.FunctionBlocks.ArEventLogGetIdent_0.Execute := FALSE;
				EventLog.Data.StatusID := EventLog.FunctionBlocks.ArEventLogGetIdent_0.StatusID;
				EventLog.Data.Step := EventLog.Data.GetIdentFailNextStep;
			ELSE
				(*Execute the FB only if the ident isn't already set.*)
				IF EventLog.Data.Ident = 0 THEN
					EventLog.FunctionBlocks.ArEventLogGetIdent_0.Name := 'UsrEvLog';
					EventLog.FunctionBlocks.ArEventLogGetIdent_0.Execute := TRUE;
				ELSE
					EventLog.Data.StatusID := ERR_OK;
					EventLog.Data.Step := EventLog.Data.GetIdentOkNextStep;    
				END_IF
			END_IF
        
			(*Creates the user logbook "UsrEvLog".*)
		STEP_CREATE_LOGBOOK:
			IF EventLog.FunctionBlocks.ArEventLogCreate_0.Done THEN
				EventLog.FunctionBlocks.ArEventLogCreate_0.Execute := FALSE;
				EventLog.Data.Ident := EventLog.FunctionBlocks.ArEventLogCreate_0.Ident;
				EventLog.Data.StatusID := ERR_OK;
				EventLog.Data.Step := STEP_WAIT_FOR_INPUT;
			ELSIF EventLog.FunctionBlocks.ArEventLogCreate_0.Error THEN
				EventLog.FunctionBlocks.ArEventLogCreate_0.Execute := FALSE;
				EventLog.Data.StatusID := EventLog.FunctionBlocks.ArEventLogCreate_0.StatusID;
				EventLog.Data.Step := STEP_ERROR;
			ELSE
				EventLog.FunctionBlocks.ArEventLogCreate_0.Name := 'UsrEvLog';
				EventLog.FunctionBlocks.ArEventLogCreate_0.Size := 10000;
				EventLog.FunctionBlocks.ArEventLogCreate_0.Persistence := arEVENTLOG_PERSISTENCE_VOLATILE;
				EventLog.FunctionBlocks.ArEventLogCreate_0.Info := 0;
				EventLog.FunctionBlocks.ArEventLogCreate_0.Execute := TRUE;
			END_IF

    
			(*Deletes the user logbook "UsrEvLog".*)
		STEP_DELETE_LOGBOOK:
			IF EventLog.FunctionBlocks.ArEventLogDelete_0.Done THEN
				EventLog.FunctionBlocks.ArEventLogDelete_0.Execute := FALSE;
				EventLog.Data.Ident := 0;
				EventLog.Data.StatusID := ERR_OK;
				EventLog.Data.Step := STEP_WAIT_FOR_INPUT;
			ELSIF EventLog.FunctionBlocks.ArEventLogDelete_0.Error THEN
				EventLog.FunctionBlocks.ArEventLogDelete_0.Execute := FALSE;
				EventLog.Data.StatusID := EventLog.FunctionBlocks.ArEventLogDelete_0.StatusID;
				EventLog.Data.Step := STEP_ERROR;
			ELSE
				EventLog.FunctionBlocks.ArEventLogDelete_0.Ident := EventLog.Data.Ident;
				EventLog.FunctionBlocks.ArEventLogDelete_0.Execute := TRUE;
			END_IF
        
			(*Writes the event set in EventLog.Event to the user logbook "UsrEvLog".*)
		STEP_WRITE_EVENT:
			IF EventLog.FunctionBlocks.ArEventLogWrite_0.Done THEN
				EventLog.FunctionBlocks.ArEventLogWrite_0.Execute := FALSE;
				EventLog.Data.StatusID := ERR_OK;
				
				New_Event := TRUE;
				EventLog.Data.Step := STEP_WAIT_FOR_INPUT;
			ELSIF EventLog.FunctionBlocks.ArEventLogWrite_0.Error THEN
				EventLog.FunctionBlocks.ArEventLogWrite_0.Execute := FALSE;
				EventLog.Data.StatusID := EventLog.FunctionBlocks.ArEventLogWrite_0.StatusID;
				EventLog.Data.Step := STEP_ERROR;
			ELSE
				
				(* Identification of the module generating the new entry *)
				IF Event_Code < 100 THEN
					EventLog.Event.EnteredBy := 'SuperTrak';
				ELSIF Event_Code < 200 THEN
					EventLog.Event.EnteredBy := 'Assembly';
				ELSE
					EventLog.Event.EnteredBy := 'General Msg';	
				END_IF;
								
				(* Then the defintion for the rest of the message parameters is made *)
				EventLog.FunctionBlocks.ArEventLogWrite_0.Ident := EventLog.Data.Ident;
				EventLog.Event.Customer							  := TRUE;
				EventLog.FunctionBlocks.ArEventLogWrite_0.TimeStamp := 0; (*System timestamp.*)
				EventLog.FunctionBlocks.ArEventLogWrite_0.ObjectID := EventLog.Event.EnteredBy;
				EventLog.FunctionBlocks.ArEventLogWrite_0.OriginRecordID := EventLog.Event.OriginID;
				EventLog.FunctionBlocks.ArEventLogWrite_0.AddDataFormat := EventLog.Event.AdditionalDataFormat;
				EventLog.FunctionBlocks.ArEventLogWrite_0.AddDataSize := EventLog.Event.AdditionalDataSize;		
				(* The writing is executed *)
				EventLog.FunctionBlocks.ArEventLogWrite_0.Execute := TRUE;		
				
			END_IF;
				
			
			
        
			(*Gets the id of the latest record in the user logbook "UsrEvLog".*)
		STEP_GET_LATEST_RECORD_ID:
			IF EventLog.FunctionBlocks.ArEventLogGetLatestRecordID_0.Done THEN
				EventLog.FunctionBlocks.ArEventLogGetLatestRecordID_0.Execute := FALSE;
				EventLog.Event.RecordID := EventLog.FunctionBlocks.ArEventLogGetLatestRecordID_0.RecordID;
				EventLog.Data.StatusID := ERR_OK;
				EventLog.Data.Step := STEP_READ_EVENT;
			ELSIF EventLog.FunctionBlocks.ArEventLogGetLatestRecordID_0.Error THEN
				EventLog.FunctionBlocks.ArEventLogGetLatestRecordID_0.Execute := FALSE;
				EventLog.Data.StatusID := EventLog.FunctionBlocks.ArEventLogGetLatestRecordID_0.StatusID;
				EventLog.Data.Step := STEP_ERROR;
			ELSE
				EventLog.FunctionBlocks.ArEventLogGetLatestRecordID_0.Ident := EventLog.Data.Ident;
				EventLog.FunctionBlocks.ArEventLogGetLatestRecordID_0.Execute := TRUE;
			END_IF
        
			(*Gets the id of the previous record of the given record id (EventLog.Event.RecordID).*)
		STEP_GET_PREVIOUS_RECORD_ID:
			IF EventLog.FunctionBlocks.ArEventLogGetPreviousRecordID_0.Done THEN
				EventLog.FunctionBlocks.ArEventLogGetPreviousRecordID_0.Execute := FALSE;
				EventLog.Event.RecordID := EventLog.FunctionBlocks.ArEventLogGetPreviousRecordID_0.PrevRecordID;
				EventLog.Data.StatusID := ERR_OK;
				EventLog.Data.Step := STEP_READ_EVENT;
			ELSIF EventLog.FunctionBlocks.ArEventLogGetPreviousRecordID_0.Error THEN
				EventLog.FunctionBlocks.ArEventLogGetPreviousRecordID_0.Execute := FALSE;
				EventLog.Data.StatusID := EventLog.FunctionBlocks.ArEventLogGetPreviousRecordID_0.StatusID;
				EventLog.Data.Step := STEP_ERROR;
			ELSE
				EventLog.FunctionBlocks.ArEventLogGetPreviousRecordID_0.Ident := EventLog.Data.Ident;
				EventLog.FunctionBlocks.ArEventLogGetPreviousRecordID_0.RecordID := EventLog.Event.RecordID;
				EventLog.FunctionBlocks.ArEventLogGetPreviousRecordID_0.Execute := TRUE;
			END_IF
    
			(*Reads the event with the given record id from the to user logbook "UsrEvLog".*)
		STEP_READ_EVENT:
			IF EventLog.FunctionBlocks.ArEventLogRead_0.Done THEN
				EventLog.FunctionBlocks.ArEventLogRead_0.Execute := FALSE;
				EventLog.Event.AdditionalDataFormat := EventLog.FunctionBlocks.ArEventLogRead_0.AddDataFormat;
				EventLog.Event.AdditionalDataSize := EventLog.FunctionBlocks.ArEventLogRead_0.AddDataSize;
				EventLog.Event.TimeStamp := EventLog.FunctionBlocks.ArEventLogRead_0.TimeStamp;
				EventLog.Event.OriginID := EventLog.FunctionBlocks.ArEventLogRead_0.OriginRecordID;
				EventLog.Data.StatusID := ERR_OK;
				EventLog.Event.ErrorNumber := 0;
				EventLog.Event.Customer := ArEventLogIsCustomerArea(EventID := EventLog.FunctionBlocks.ArEventLogRead_0.EventID);
				EventLog.Event.Severity := GetSeverity(EventID := EventLog.FunctionBlocks.ArEventLogRead_0.EventID);
				EventLog.Event.Code := GetCode(EventID := EventLog.FunctionBlocks.ArEventLogRead_0.EventID);
				EventLog.Event.Facility := GetFacility(EventID := EventLog.FunctionBlocks.ArEventLogRead_0.EventID);    
				IF EventLog.FunctionBlocks.ArEventLogRead_0.StatusID = arEVENTLOG_WRN_NO_EVENTID THEN
					(*The given record id is not an event id record. Invoke ArEventLogReadErrorNumber to read the error number and the severity.*)
					EventLog.Data.Step := STEP_READ_ERROR_NUMBER;
				ELSIF EventLog.Event.AdditionalDataSize > 0 THEN
					EventLog.Data.Step := STEP_READ_ADDITIONAL_DATA;
				ELSE
					EventLog.Data.Step := STEP_READ_OBJECT_ID;
				END_IF          
			ELSIF EventLog.FunctionBlocks.ArEventLogRead_0.Error THEN
				EventLog.FunctionBlocks.ArEventLogRead_0.Execute := FALSE;
				EventLog.Data.StatusID := EventLog.FunctionBlocks.ArEventLogRead_0.StatusID;
				EventLog.Data.Step := STEP_ERROR;
			ELSE
				EventLog.FunctionBlocks.ArEventLogRead_0.Ident := EventLog.Data.Ident;
				EventLog.FunctionBlocks.ArEventLogRead_0.RecordID := EventLog.Event.RecordID;
				EventLog.FunctionBlocks.ArEventLogRead_0.Execute := TRUE;
			END_IF
        
			(*Reads the error number event with the given record id from the user logbook "UsrEvLog".*)
		STEP_READ_ERROR_NUMBER:
			IF EventLog.FunctionBlocks.ArEventLogReadErrorNumber_0.Done THEN
				EventLog.FunctionBlocks.ArEventLogReadErrorNumber_0.Execute := FALSE;
				EventLog.Event.ErrorNumber := EventLog.FunctionBlocks.ArEventLogReadErrorNumber_0.ErrorNumber;
				EventLog.Event.Severity := EventLog.FunctionBlocks.ArEventLogReadErrorNumber_0.Severity;
				EventLog.Data.StatusID := ERR_OK;
				IF EventLog.Event.AdditionalDataSize > 0 THEN
					EventLog.Data.Step := STEP_READ_ADDITIONAL_DATA;
				ELSE
					EventLog.Data.Step := STEP_READ_OBJECT_ID;
				END_IF
			ELSIF EventLog.FunctionBlocks.ArEventLogReadErrorNumber_0.Error THEN
				EventLog.FunctionBlocks.ArEventLogReadErrorNumber_0.Execute := FALSE;
				EventLog.Data.StatusID := EventLog.FunctionBlocks.ArEventLogReadErrorNumber_0.StatusID;
				EventLog.Data.Step := STEP_ERROR;
			ELSE
				EventLog.FunctionBlocks.ArEventLogReadErrorNumber_0.Ident := EventLog.Data.Ident;
				EventLog.FunctionBlocks.ArEventLogReadErrorNumber_0.RecordID := EventLog.Event.RecordID;
				EventLog.FunctionBlocks.ArEventLogReadErrorNumber_0.Execute := TRUE;
			END_IF

			(*Reads the additional data of the event with the given record id from the user logbook "UsrEvLog".*)
		STEP_READ_ADDITIONAL_DATA:
			IF EventLog.FunctionBlocks.ArEventLogReadAddData_0.Done THEN
				EventLog.FunctionBlocks.ArEventLogReadAddData_0.Execute := FALSE;
				EventLog.Event.AdditionalDataSize := EventLog.FunctionBlocks.ArEventLogReadAddData_0.AddDataSize;
				EventLog.Data.StatusID := ERR_OK;
				EventLog.Data.Step := STEP_READ_OBJECT_ID;
			ELSIF EventLog.FunctionBlocks.ArEventLogReadAddData_0.Error THEN
				EventLog.FunctionBlocks.ArEventLogReadAddData_0.Execute := FALSE;
				EventLog.Data.StatusID := EventLog.FunctionBlocks.ArEventLogReadAddData_0.StatusID;
				EventLog.Data.Step := STEP_ERROR;
			ELSE
				EventLog.FunctionBlocks.ArEventLogReadAddData_0.Ident := EventLog.Data.Ident;
				EventLog.FunctionBlocks.ArEventLogReadAddData_0.RecordID := EventLog.Event.RecordID;
				EventLog.FunctionBlocks.ArEventLogReadAddData_0.BytesToRead := SIZEOF(EventLog.Event.AdditionalData);
				EventLog.FunctionBlocks.ArEventLogReadAddData_0.AddData := ADR(EventLog.Event.AdditionalData);
				EventLog.FunctionBlocks.ArEventLogReadAddData_0.Execute := TRUE;
			END_IF

			(*Reads the object id of the event with the given record id from the user logbook "UsrEvLog".*)
		STEP_READ_OBJECT_ID:
			IF EventLog.FunctionBlocks.ArEventLogReadObjectID_0.Done THEN
				EventLog.FunctionBlocks.ArEventLogReadObjectID_0.Execute := FALSE;
				EventLog.Event.EnteredBy := EventLog.FunctionBlocks.ArEventLogReadObjectID_0.ObjectID;
				EventLog.Data.StatusID := ERR_OK;
				EventLog.Data.Step := STEP_WAIT_FOR_INPUT;
			ELSIF EventLog.FunctionBlocks.ArEventLogReadObjectID_0.Error THEN
				EventLog.FunctionBlocks.ArEventLogReadObjectID_0.Execute := FALSE;
				EventLog.Data.StatusID := EventLog.FunctionBlocks.ArEventLogReadObjectID_0.StatusID;
				EventLog.Data.Step := STEP_ERROR;
			ELSE
				EventLog.FunctionBlocks.ArEventLogReadObjectID_0.Ident := EventLog.Data.Ident;
				EventLog.FunctionBlocks.ArEventLogReadObjectID_0.RecordID := EventLog.Event.RecordID;
				EventLog.FunctionBlocks.ArEventLogReadObjectID_0.Execute := TRUE;
			END_IF
        
		STEP_ERROR:        (*Do some error handling here.*)
		
			(* In case we try to delete a logger that is not there we will continue the execution from there,
			for other error ID's please see ArEventLog help *)
			IF EventLog.Data.StatusID = -1070586087 THEN
				EventLog.Data.StatusID := ERR_OK;
				EventLog.Data.Step := STEP_WAIT_FOR_INPUT;
			ELSE

			END_IF;
	END_CASE
    
    EventLog.FunctionBlocks.ArEventLogCreate_0;    EventLog.FunctionBlocks.ArEventLogDelete_0;    EventLog.FunctionBlocks.ArEventLogWrite_0;    EventLog.FunctionBlocks.ArEventLogGetIdent_0;    EventLog.FunctionBlocks.ArEventLogGetLatestRecordID_0;    EventLog.FunctionBlocks.ArEventLogGetPreviousRecordID_0;    EventLog.FunctionBlocks.ArEventLogReadAddData_0;    EventLog.FunctionBlocks.ArEventLogReadErrorNumber_0;    EventLog.FunctionBlocks.ArEventLogReadObjectID_0;    EventLog.FunctionBlocks.ArEventLogRead_0;END_PROGRAM

(*See ArEventLog help for the description of the event id format!*)

(*Gets severity from EventId (bits 31-30).*)
FUNCTION GetSeverity
	IF ArEventLogIsError(EventID := EventID) THEN
		GetSeverity := arEVENTLOG_SEVERITY_ERROR;
	ELSIF ArEventLogIsWarning(EventID := EventID) THEN
		GetSeverity := arEVENTLOG_SEVERITY_WARNING;
	ELSIF ArEventLogIsInformation(EventID := EventID) THEN
		GetSeverity := arEVENTLOG_SEVERITY_INFO;
	ELSIF ArEventLogIsSuccess(EventID := EventID) THEN
		GetSeverity := arEVENTLOG_SEVERITY_SUCCESS;
	END_IF
END_FUNCTION
(*Gets code from EventId (bits 15-0).*)
FUNCTION GetCode
	GetCode := DINT_TO_UINT(EventID);
END_FUNCTION

(*Gets facility from EventId (bits 27-16).*)
FUNCTION GetFacility
	GetFacility := DINT_TO_UINT(SHR(EventID, 16) AND 16#0FFF);
END_FUNCTION


PROGRAM _EXIT
	
	EventLog.FunctionBlocks.ArEventLogRead_0.Execute := FALSE;
	EventLog.FunctionBlocks.ArEventLogWrite_0.Execute := FALSE;
	EventLog.FunctionBlocks.ArEventLogGetLatestRecordID_0.Execute := FALSE;
	EventLog.FunctionBlocks.ArEventLogGetIdent_0.Execute := FALSE;
	
	EventLog.FunctionBlocks.ArEventLogRead_0();
	EventLog.FunctionBlocks.ArEventLogWrite_0();
	EventLog.FunctionBlocks.ArEventLogGetLatestRecordID_0();
	EventLog.FunctionBlocks.ArEventLogGetIdent_0();

END_PROGRAM
