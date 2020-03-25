
ACTION provideCup_Clearing: 
	
	gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.clear := FALSE;
	
	gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := STOPPED;		

END_ACTION
