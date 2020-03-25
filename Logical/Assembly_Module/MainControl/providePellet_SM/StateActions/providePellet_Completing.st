
ACTION providePellet_Completing: 
	
	providePellet_Case := PELLET_SUPPLY_DECISION_CASE;
	gAssemblyModule.skill.providePellet.inputParameters.pelletType :=0;
	gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := COMPLETE;			

END_ACTION
