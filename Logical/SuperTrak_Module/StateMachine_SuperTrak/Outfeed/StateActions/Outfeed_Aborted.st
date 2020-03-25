
ACTION Outfeed_Aborted: 
	
	IF gSuperTrak.state.stateMachine.operationalState = ABORTED THEN
		//TODO: Insert Outfeed LED Light control
		
	ELSE
		//TODO: Insert Outfeed LED Light control
	END_IF;
	
		
	IF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.reset THEN
		gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := RESETTING;
				
		
	ELSIF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.clear THEN
		gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := CLEARING;
		
	END_IF;
	
	
	
	
END_ACTION
