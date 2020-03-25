
ACTION Idle: 

	IF gAssemblyModule.state.stateMachine.stateTransition.start THEN
		gAssemblyModule.state.stateMachine.operationalState := STARTING;
				
	END_IF;
	
END_ACTION
