
ACTION provideCup_Idle: 	
		
	IF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.start THEN 
			gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := STARTING;
	
	END_IF
	
END_ACTION