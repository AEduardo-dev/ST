
ACTION checkParking_Paused: 
	
	IF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.resume THEN
		gSuperTrak.skill.checkParking.state.stateMachine.operationalState := RUNNING;
		
	END_IF;
	
END_ACTION
