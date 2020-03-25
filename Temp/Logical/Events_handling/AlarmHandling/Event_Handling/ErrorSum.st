
ACTION ErrorSum: 
		
	IF Events[Event_Code].Severity_Code = arEVENTLOG_SEVERITY_ERROR THEN
		SumCritical := TRUE;
		Set_Info_Messages := FALSE;
		
		gSuperTrak.state.stateMachine.stateTransition.abort := TRUE;
		gAssemblyModule.state.stateMachine.stateTransition.abort := TRUE;
					
	END_IF;

	
END_ACTION
