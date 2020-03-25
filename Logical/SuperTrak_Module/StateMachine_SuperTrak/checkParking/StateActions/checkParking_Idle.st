
ACTION checkParking_Idle: 	
	
	IF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.start THEN
		
		gSuperTrak.skill.checkParking.state.stateMachine.operationalState := STARTING;
	
	END_IF
	
END_ACTION
