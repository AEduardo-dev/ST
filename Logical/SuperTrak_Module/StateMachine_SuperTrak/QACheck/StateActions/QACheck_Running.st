
ACTION QACheck_Running: 
	(*Activate actuator movement up and wait until fully extended*)
		
	Timer_Actuator_UP(IN := QA_Actuator_UP, PT := T#8s);
	QA_Actuator_UP := TRUE;
	
	IF Timer_Actuator_UP.Q THEN 
		LED_Green := TRUE;
		LED_Red := FALSE;
		LED_Blue := FALSE;
		Disable_Light_Barrier := TRUE;
	END_IF;
	
	IF QA_finished THEN
		QA_finished := FALSE;
		QA_Actuator_UP := FALSE;
		Timer_Actuator_UP(IN := FALSE);
		gSuperTrak.skill.QACheck.state.stateMachine.operationalState := COMPLETING;
	END_IF;
	
END_ACTION
