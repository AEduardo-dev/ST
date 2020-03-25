
ACTION provideCup_Aborted: 
	
	IF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.reset THEN
		gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := RESETTING;
				
	ELSIF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.clear THEN
		gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := CLEARING;
				
	END_IF;
	
	
END_ACTION
