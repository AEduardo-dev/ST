
ACTION checkParking_Aborted: 
	
	IF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.reset THEN
		gSuperTrak.skill.checkParking.state.stateMachine.operationalState := RESETTING;
				
	ELSIF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.clear THEN
		gSuperTrak.skill.checkParking.state.stateMachine.operationalState := CLEARING;
				
	END_IF;
	
	
END_ACTION
