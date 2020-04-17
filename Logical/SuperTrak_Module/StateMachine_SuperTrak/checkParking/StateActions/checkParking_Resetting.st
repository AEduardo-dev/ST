
ACTION checkParking_Resetting: 
	(* Alarm message?? *)
	
	gSuperTrak.skill.checkParking.state.stateMachine.operationalState := IDLE;
	
END_ACTION
