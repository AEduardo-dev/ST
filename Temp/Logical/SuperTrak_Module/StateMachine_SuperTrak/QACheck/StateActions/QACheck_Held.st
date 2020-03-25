
ACTION QACheck_Held: 
	
	IF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.unhold THEN
		gSuperTrak.skill.QACheck.state.stateMachine.operationalState := UNHOLDING;
	END_IF;
	
END_ACTION
