
ACTION Complete: 

	IF gSuperTrak.state.stateMachine.stateTransition.reset THEN
		gSuperTrak.state.stateMachine.operationalState := RESETTING;	
	
	END_IF;
	
END_ACTION
