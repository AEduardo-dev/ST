
ACTION provideCup_Held: 
	
	IF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.unhold THEN
		gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := UNHOLDING;
	END_IF;
	
END_ACTION
