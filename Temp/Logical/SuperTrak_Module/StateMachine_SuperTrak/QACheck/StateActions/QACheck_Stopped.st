
ACTION QACheck_Stopped:	
	
	IF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.reset 
	(*AND	NOT gbMessageSumAlarm*) THEN
		
		gSuperTrak.skill.QACheck.state.stateMachine.operationalState := RESETTING;
	END_IF;
	
END_ACTION
