
ACTION Outfeed_Stopped:	
	
	IF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.reset 
	(*AND	NOT gbMessageSumAlarm*) THEN
		
		gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := RESETTING;
	END_IF;
	
END_ACTION
