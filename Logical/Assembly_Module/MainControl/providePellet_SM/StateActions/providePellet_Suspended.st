
ACTION providePellet_Suspended: 
	
	IF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.unsuspend THEN
		gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := UNSUSPENDING;
	END_IF;
	
END_ACTION
