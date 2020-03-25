
ACTION ErrorAcknowledgement: 
	(* Error Reset *)
	IF gSuperTrak.state.errorAcknowledge AND SumCritical THEN
		
		Event_Code := 249;
		EventLog.Commands.WriteUserEvent := TRUE;
		
		gSuperTrak.state.errorAcknowledge := FALSE;
		SumCritical := FALSE;

	END_IF;
	
	
	IF gAssemblyModule.state.errorAcknowledge AND SumCritical THEN
		
		Event_Code := 249;
		EventLog.Commands.WriteUserEvent := TRUE;
		
		gAssemblyModule.state.errorAcknowledge := FALSE;
		SumCritical := FALSE;
	END_IF;
	
END_ACTION
