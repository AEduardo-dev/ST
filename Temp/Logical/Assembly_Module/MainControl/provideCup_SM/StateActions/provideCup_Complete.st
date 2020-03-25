
ACTION provideCup_Complete: 
	
	Checked := FALSE;
	IF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.reset THEN
		gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := RESETTING;
	END_IF;
	
END_ACTION
