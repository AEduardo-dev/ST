
ACTION goHome_Clearing: 
	
	gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.clear := FALSE;
	
	gAssemblyModule.skill.goHome.state.stateMachine.operationalState := STOPPED;		

END_ACTION
