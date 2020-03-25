
ACTION provideCup_Paused: 
	
	IF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.resume THEN
		gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := RUNNING;
		
	END_IF;
	
END_ACTION
