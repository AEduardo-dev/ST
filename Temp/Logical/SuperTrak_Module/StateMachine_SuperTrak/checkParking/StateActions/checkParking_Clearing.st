
ACTION checkParking_Clearing: 
	
	gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.clear := FALSE;
	
	gSuperTrak.skill.checkParking.state.stateMachine.operationalState := STOPPED;		

END_ACTION
