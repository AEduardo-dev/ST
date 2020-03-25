
ACTION moveShuttle_Aborted: 
	
	IF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.reset THEN
		gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := RESETTING;
				
	ELSIF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.clear THEN
		gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := CLEARING;
				
	END_IF;
	
	
END_ACTION
