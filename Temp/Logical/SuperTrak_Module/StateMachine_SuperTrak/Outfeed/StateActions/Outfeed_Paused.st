
ACTION Outfeed_Paused: 
	
	IF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.resume THEN
		gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := RUNNING;
		
	END_IF;
	
END_ACTION
