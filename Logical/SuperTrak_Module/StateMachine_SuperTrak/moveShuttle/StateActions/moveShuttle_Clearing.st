
ACTION moveShuttle_Clearing: 
	
	gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.clear := FALSE;
	
	gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := STOPPED;		

END_ACTION
