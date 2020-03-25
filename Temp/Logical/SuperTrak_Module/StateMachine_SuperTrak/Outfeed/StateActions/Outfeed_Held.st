
ACTION Outfeed_Held: 
	
	IF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.unhold THEN
		gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := UNHOLDING;
	END_IF;
	
END_ACTION
