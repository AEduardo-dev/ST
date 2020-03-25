
ACTION moveShuttle_Suspended: 
	
	IF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.unsuspend THEN
		gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := UNSUSPENDING;
	END_IF;
	
END_ACTION
