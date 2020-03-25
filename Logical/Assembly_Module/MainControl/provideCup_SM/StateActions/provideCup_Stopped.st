
ACTION provideCup_Stopped:	
	
	IF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.reset THEN
		gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := RESETTING;
	END_IF;
	
END_ACTION
