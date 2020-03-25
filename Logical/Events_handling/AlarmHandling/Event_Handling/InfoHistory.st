
ACTION InfoHistory: 
	
	EventLog.Commands.ReadLatestEvent := TRUE;
	
	IF EventLog.FunctionBlocks.ArEventLogReadObjectID_0.Done THEN	
		
		IF Info_Event THEN
			
			IF EventLog.Event.Code < 100 THEN
				ST_Last_Info_Written := EventLog.Event.Code;
				
			ELSIF EventLog.Event.Code < 200 THEN
				Assembly_Last_Info_Written := EventLog.Event.Code;
				
			ELSE
				General_Last_Info_Written := EventLog.Event.Code;
			END_IF;
			
		ELSE
			
			Last_Event_Written := EventLog.Event.Code;
			
		END_IF;
		
		New_Event := FALSE;

	END_IF;
	
	
END_ACTION
