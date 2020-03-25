
ACTION Outfeed_Suspended: 
	
	IF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.unsuspend THEN
		gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := UNSUSPENDING;
	END_IF;
	
END_ACTION
