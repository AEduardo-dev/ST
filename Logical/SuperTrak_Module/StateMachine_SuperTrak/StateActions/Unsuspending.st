
ACTION Unsuspending:
	
	IF gSuperTrak.state.stateMachine.stateTransition.suspend THEN
		gSuperTrak.state.stateMachine.operationalState := SUSPENDING;
	ELSE
		gSuperTrak.state.stateMachine.operationalState := RUNNING;
	END_IF;
	
END_ACTION
