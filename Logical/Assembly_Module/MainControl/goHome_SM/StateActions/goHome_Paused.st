
ACTION goHome_Paused: 
	
	IF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.resume THEN
		gAssemblyModule.skill.goHome.state.stateMachine.operationalState := RUNNING;
		
	END_IF;
	
END_ACTION
