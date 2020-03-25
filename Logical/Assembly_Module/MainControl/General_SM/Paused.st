
ACTION Paused: 
				
	IF gAssemblyModule.state.stateMachine.stateTransition.resume THEN
		gAssemblyModule.state.stateMachine.operationalState := RUNNING;
	END_IF;
	
END_ACTION
