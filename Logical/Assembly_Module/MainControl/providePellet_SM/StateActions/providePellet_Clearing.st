
ACTION providePellet_Clearing: 
	
	gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.clear := FALSE;
	
	gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := STOPPED;		

END_ACTION
