
ACTION goHome_Suspended: 
	
	IF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.unsuspend THEN
		gAssemblyModule.skill.goHome.state.stateMachine.operationalState := UNSUSPENDING;
	END_IF;
	
END_ACTION
