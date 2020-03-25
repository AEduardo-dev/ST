
ACTION Outfeed_Clearing: 
	
	gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.clear := FALSE;
	
	gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := STOPPED;		

END_ACTION
