
ACTION checkParking_Starting: 
			
	(* ************************************************************************** *)
	(* starting CheckParking skill *)
	gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.start := FALSE;
	gSuperTrak.skill.checkParking.state.stateMachine.operationalState := RUNNING;


END_ACTION
