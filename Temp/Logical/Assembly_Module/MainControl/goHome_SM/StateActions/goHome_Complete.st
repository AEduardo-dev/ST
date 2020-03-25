
ACTION goHome_Complete: 
	
	IF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.reset THEN
		gAssemblyModule.skill.goHome.state.stateMachine.operationalState := RESETTING;
	END_IF;
	
END_ACTION
