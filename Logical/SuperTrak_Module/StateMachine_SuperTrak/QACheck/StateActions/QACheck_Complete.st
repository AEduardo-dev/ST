
ACTION QACheck_Complete: 
	(* Skill stays in complete until trigger from MES *)
	IF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.reset THEN
		gSuperTrak.skill.QACheck.state.stateMachine.operationalState := RESETTING;
	END_IF;
	
	Timer_Enable_Barrier(IN := FALSE);
	QA_Actuator_UP := FALSE;
	QA_Actuator_DOWN := FALSE;
	
END_ACTION
