
ACTION QACheck_Clearing: 
	
	gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.clear := FALSE;
	
	gSuperTrak.skill.QACheck.state.stateMachine.operationalState := STOPPED;		

END_ACTION
