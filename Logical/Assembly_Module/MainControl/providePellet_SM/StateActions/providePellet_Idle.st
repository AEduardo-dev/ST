
ACTION providePellet_Idle: 	
	
	IF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.start THEN 
			gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := STARTING;
	
	END_IF
	
END_ACTION