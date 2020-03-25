
ACTION Completing: 
	
	QA_Actuator_DOWN := TRUE;
	Timer_Actuator_DOWN(IN := QA_Actuator_DOWN, PT := T#8s);
	
	IF Timer_Actuator_DOWN.Q THEN
		gSuperTrak.state.stateMachine.operationalState := COMPLETE;
	END_IF;
	
	
	
	
END_ACTION
