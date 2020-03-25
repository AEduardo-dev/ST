
ACTION checkParking_Suspended: 
	
	IF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.unsuspend THEN
		gSuperTrak.skill.checkParking.state.stateMachine.operationalState := UNSUSPENDING;
	END_IF;
	
END_ACTION
