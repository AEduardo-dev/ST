
ACTION QACheck_Suspended: 
	
	IF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.unsuspend THEN
		gSuperTrak.skill.QACheck.state.stateMachine.operationalState := UNSUSPENDING;
	END_IF;
	
END_ACTION
