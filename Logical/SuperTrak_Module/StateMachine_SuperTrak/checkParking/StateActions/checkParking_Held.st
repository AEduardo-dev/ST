
ACTION checkParking_Held: 
	
	IF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.unhold THEN
		gSuperTrak.skill.checkParking.state.stateMachine.operationalState := UNHOLDING;
	END_IF;
	
END_ACTION
