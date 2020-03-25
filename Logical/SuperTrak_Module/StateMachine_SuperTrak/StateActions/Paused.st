
ACTION Paused: 
	
	IF gSuperTrak.state.stateMachine.stateTransition.resume THEN
		gSuperTrak.state.stateMachine.operationalState := RUNNING;

	END_IF;
	
END_ACTION
