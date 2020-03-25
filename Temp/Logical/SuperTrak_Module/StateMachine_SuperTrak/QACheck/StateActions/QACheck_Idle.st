
ACTION QACheck_Idle: 	
	
	LED_Green := FALSE;
	LED_Red := TRUE;
	LED_Blue := FALSE;

	
	IF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.start THEN
		
		gSuperTrak.skill.QACheck.state.stateMachine.operationalState := STARTING;
	
	END_IF
	
	QA_Actuator_UP := FALSE;
	QA_Actuator_DOWN := FALSE;
	
END_ACTION
