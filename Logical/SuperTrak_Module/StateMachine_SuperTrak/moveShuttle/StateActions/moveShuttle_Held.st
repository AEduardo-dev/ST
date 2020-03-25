
ACTION moveShuttle_Held: 
	
	IF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.unhold THEN
		gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := UNHOLDING;
	END_IF;
	
END_ACTION
