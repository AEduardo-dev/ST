
ACTION Outfeed_Starting: 
			
	(* ************************************************************************** *)
	(* starting Outfeed skill *)
	IF NOT Outfeed_Full THEN
		gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.start := FALSE;
		gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := RUNNING;	
	END_IF;

END_ACTION
