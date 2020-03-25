
ACTION providePellet_Held: 
	
	IF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.unhold THEN
		gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := UNHOLDING;
	END_IF;
	
END_ACTION
