
ACTION providePellet_Aborted: 
	
	IF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.reset THEN
		gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := RESETTING;
				
	ELSIF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.clear THEN
		gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := CLEARING;
				
	END_IF;
	
	
END_ACTION
