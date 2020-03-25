
ACTION goHome_Idle: 	
		
	IF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.start THEN 
			gAssemblyModule.skill.goHome.state.stateMachine.operationalState := STARTING;
	
	END_IF
	
END_ACTION