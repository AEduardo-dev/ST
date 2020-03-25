
ACTION Idle: 

	IF gSuperTrak.state.stateMachine.stateTransition.start THEN
		gSuperTrak.state.stateMachine.operationalState := STARTING;
	END_IF;
	
END_ACTION
