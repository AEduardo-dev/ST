
ACTION QACheck_Aborted: 
	
	IF gSuperTrak.state.stateMachine.operationalState = ABORTED THEN
		LED_Blue := TRUE;
		LED_Green := FALSE;
		LED_Red := FALSE;
		
	ELSE
		LED_Blue := FALSE;
		LED_Green := FALSE;
		LED_Red := TRUE;
	END_IF;
	
		
	IF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.reset THEN
		gSuperTrak.skill.QACheck.state.stateMachine.operationalState := RESETTING;
				
		
	ELSIF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.clear THEN
		gSuperTrak.skill.QACheck.state.stateMachine.operationalState := CLEARING;
		
	END_IF;
	
	
	
	
END_ACTION
