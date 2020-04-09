
ACTION Stopped: 
	
	QA_Actuator_DOWN := FALSE;
	Timer_Actuator_DOWN (IN := FALSE);
	Outfeed_Actuator_DOWN := FALSE;
	Timer_Outfeed_DOWN (IN := FALSE);
	Outfeed_Actuator_BACK := FALSE;
	
	IF	gSuperTrak.state.stateMachine.stateTransition.reset THEN
		gSuperTrak.state.stateMachine.operationalState := RESETTING;
	END_IF;
	
END_ACTION
