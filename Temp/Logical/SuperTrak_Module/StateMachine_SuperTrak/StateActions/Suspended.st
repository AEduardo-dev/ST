
ACTION Suspended: 

	IF gSuperTrak.state.stateMachine.stateTransition.unsuspend THEN
		gSuperTrak.state.stateMachine.operationalState := UNSUSPENDING;	
	END_IF;

END_ACTION
