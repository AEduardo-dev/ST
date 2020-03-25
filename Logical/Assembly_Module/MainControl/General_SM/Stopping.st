
ACTION Stopping: 
	
	
	gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.abort := TRUE;
	gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.abort := TRUE;
	gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.abort := TRUE;
	
	Mp_Comau.Stop := TRUE;
	
	IF (gAssemblyModule.skill.goHome.state.stateMachine.operationalState = ABORTED) AND 
		(gAssemblyModule.skill.provideCup.state.stateMachine.operationalState = ABORTED) AND
		(gAssemblyModule.skill.providePellet.state.stateMachine.operationalState = ABORTED)	AND
		(Mp_Comau.Stopped) THEN
		
				
		gAssemblyModule.state.stateMachine.stateTransition.stop := FALSE;
		Mp_Comau.Stop := FALSE;	
		gAssemblyModule.state.stateMachine.operationalState := STOPPED;
		
	END_IF;

END_ACTION