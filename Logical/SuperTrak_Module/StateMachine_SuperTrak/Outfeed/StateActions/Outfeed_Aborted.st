
ACTION Outfeed_Aborted: 
	
	IF gSuperTrak.state.stateMachine.operationalState = ABORTED THEN
		Outfeed_LED_Blue := FALSE;
		Outfeed_LED_Green := FALSE;
		Outfeed_LED_Red := TRUE;
		
	ELSE
		Outfeed_LED_Blue := TRUE;
		Outfeed_LED_Green := FALSE;
		Outfeed_LED_Red := FALSE;
	END_IF;
	
		
	IF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.reset THEN
		gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := RESETTING;
				
		
	ELSIF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.clear THEN
		gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := CLEARING;
		
	END_IF;
	
	
	
	
END_ACTION
