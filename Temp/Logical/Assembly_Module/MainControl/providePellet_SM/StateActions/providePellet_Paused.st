
ACTION providePellet_Paused: 
	
	IF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.resume THEN
		gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := RUNNING;
		
	END_IF;
	
END_ACTION
