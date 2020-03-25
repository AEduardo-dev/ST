
ACTION STerrorHandler: 
		
	IF StControl_0.Error THEN
		Event_Code := 1;
		EventLog.Commands.WriteUserEvent := TRUE;
	END_IF;
	
END_ACTION
