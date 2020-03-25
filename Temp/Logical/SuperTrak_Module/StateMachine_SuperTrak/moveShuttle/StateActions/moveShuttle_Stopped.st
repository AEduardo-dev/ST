
ACTION moveShuttle_Stopped:	
	
	IF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.reset THEN
		
		gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := RESETTING;
	END_IF;
	
END_ACTION
