
ACTION Complete: 
	IF gAssemblyModule.state.stateMachine.stateTransition.reset THEN
		gAssemblyModule.state.stateMachine.operationalState := RESETTING;
	
	END_IF;
END_ACTION
