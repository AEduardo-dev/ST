
ACTION goHome_Aborted: 
	
	IF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.reset THEN
		gAssemblyModule.skill.goHome.state.stateMachine.operationalState := RESETTING;
				
	ELSIF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.clear THEN
		gAssemblyModule.skill.goHome.state.stateMachine.operationalState := CLEARING;
				
	END_IF;
	
	
END_ACTION
