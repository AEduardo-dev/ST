
ACTION moveShuttle_Paused: 
	
	IF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.resume THEN
		gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := RUNNING;
		
	END_IF;
	
END_ACTION
