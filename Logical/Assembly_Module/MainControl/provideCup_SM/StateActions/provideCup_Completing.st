
ACTION provideCup_Completing: 
	
	provideCup_Case := CUP_SUPPLY_DECISION_CASE;
	
	gAssemblyModule.skill.provideCup.OutputParameters.SecondOutputParam := Assem_PlasticRemaining;
	gAssemblyModule.skill.provideCup.OutputParameters.FirstOutputParam := Assem_PaperRemaining;
	
	gAssemblyModule.skill.provideCup.inputParameters.cupType := 0;
	
	gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := COMPLETE;	

END_ACTION
