
ACTION Outfeed_Complete:
	
	Outfeed_Checked := FALSE;
	Outfeed_Actuator_UP := FALSE;
	Outfeed_Actuator_DOWN := FALSE;
	Outfeed_Actuator_FRONT := FALSE;
	Outfeed_Actuator_BACK := FALSE;
	
	(* Skill stays in complete until trigger from MES *)
	IF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.reset THEN
		gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := RESETTING;
	END_IF;
	
	
END_ACTION
