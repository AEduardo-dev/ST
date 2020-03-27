
ACTION Outfeed_Starting: 
			
	(* ************************************************************************** *)
	(* starting Outfeed skill *)
	
	gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.start := FALSE;
	gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := RUNNING;	

END_ACTION
