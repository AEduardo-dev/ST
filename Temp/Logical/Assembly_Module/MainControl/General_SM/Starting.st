
ACTION Starting: 
			
	IF gAssemblyModule.skill.provideCup.state.stateMachine.operationalState = ABORTED THEN
		gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.reset := TRUE;		
	END_IF;
	
	IF gAssemblyModule.skill.goHome.state.stateMachine.operationalState = ABORTED THEN
		gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.reset := TRUE;		
	END_IF;
	
	IF gAssemblyModule.skill.providePellet.state.stateMachine.operationalState = ABORTED THEN
		gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.reset := TRUE;		
	END_IF;
	
	gAssemblyModule.skill.provideCup.OutputParameters.SecondOutputParam := Assem_PlasticRemaining;
	gAssemblyModule.skill.provideCup.OutputParameters.FirstOutputParam := Assem_PaperRemaining;
	
	gAssemblyModule.state.stateMachine.operationalState := RUNNING;
			
END_ACTION
