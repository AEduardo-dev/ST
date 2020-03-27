
ACTION QACheck_Completing: 
	
	(* Alarms Handling?? *)
		
	(*Actuator go down and then we get complete*)
	QA_Actuator_UP := FALSE;
	LED_Green := FALSE;
	LED_Red := FALSE;
	LED_Blue := TRUE;
	Timer_Enable_Barrier(IN := LED_Blue, PT := T#0.5s);
	
	IF Timer_Enable_Barrier.Q THEN
		Disable_Light_Barrier := FALSE;
	END_IF;
			
	IF NOT QA_Actuator_UP THEN
		QA_Actuator_DOWN := TRUE;
	END_IF;
	
	Timer_Actuator_DOWN(IN := QA_Actuator_DOWN, PT := T#8s);
	
	IF Timer_Actuator_DOWN.Q AND NOT Disable_Light_Barrier THEN
		gSuperTrak.skill.QACheck.state.stateMachine.operationalState := COMPLETE;
		Timer_Actuator_DOWN(IN := FALSE);
	END_IF;
	
				

END_ACTION
