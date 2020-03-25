
ACTION providePellet_Stopped:	
	
	IF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.reset THEN
		gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := RESETTING;
	END_IF;
	
END_ACTION
