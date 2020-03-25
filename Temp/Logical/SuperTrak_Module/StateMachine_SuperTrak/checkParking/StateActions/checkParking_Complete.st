
ACTION checkParking_Complete: 
	(* Skill stays in complete until trigger from MES *)
	IF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.reset THEN
		gSuperTrak.skill.checkParking.state.stateMachine.operationalState := RESETTING;
	END_IF;
	
END_ACTION
