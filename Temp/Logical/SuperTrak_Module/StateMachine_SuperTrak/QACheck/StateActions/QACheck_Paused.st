
ACTION QACheck_Paused: 
	
	IF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.resume THEN
		gSuperTrak.skill.QACheck.state.stateMachine.operationalState := RUNNING;
		
	END_IF;
	
END_ACTION
