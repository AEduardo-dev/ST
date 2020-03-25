
ACTION goHome_Held: 
	
	IF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.unhold THEN
		gAssemblyModule.skill.goHome.state.stateMachine.operationalState := UNHOLDING;
	END_IF;
	
END_ACTION
