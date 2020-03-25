
ACTION Outfeed_Idle: 	
	
	Outfeed_Actuator_UP := FALSE;
	Outfeed_Actuator_DOWN := FALSE;
	Outfeed_Actuator_FRONT := FALSE;
	Outfeed_Actuator_BACK := FALSE;

	
	IF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.start THEN
		
		gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := STARTING;
	
	END_IF
	
	
END_ACTION
