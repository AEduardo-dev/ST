
ACTION Stopped: 
	
	QA_Actuator_DOWN := FALSE;
	Timer_Actuator_DOWN (IN:= FALSE);
	
	IF	gSuperTrak.state.stateMachine.stateTransition.reset THEN
		gSuperTrak.state.stateMachine.operationalState := RESETTING;
	END_IF;
	
	
	
END_ACTION
