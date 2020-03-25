
ACTION Suspended: 
	IF gAssemblyModule.state.stateMachine.stateTransition.unsuspend THEN
		gAssemblyModule.state.stateMachine.operationalState := UNSUSPENDING;
	
	END_IF;
	
END_ACTION
