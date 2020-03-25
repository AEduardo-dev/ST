
ACTION Held: 
	
	IF gSuperTrak.state.stateMachine.stateTransition.unhold THEN
		gSuperTrak.state.stateMachine.operationalState := UNHOLDING;
		
	END_IF;

END_ACTION
