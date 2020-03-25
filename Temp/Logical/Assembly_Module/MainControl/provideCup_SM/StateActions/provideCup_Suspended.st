
ACTION provideCup_Suspended: 
	
	IF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.unsuspend THEN
		gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := UNSUSPENDING;
	END_IF;
	
END_ACTION
