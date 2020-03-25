
ACTION provideCup_Resetting: 
	
	gAssemblyModule.skill.provideCup.inputParameters.cupType := 0;
	provideCup_Case := CUP_SUPPLY_DECISION_CASE;
	gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := IDLE;
	
END_ACTION
