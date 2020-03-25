
ACTION checkParking_Stopped:	
	
	IF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.reset 
	(*AND	NOT gbMessageSumAlarm*) THEN
		
		gSuperTrak.skill.checkParking.state.stateMachine.operationalState := RESETTING;
	END_IF;
	
END_ACTION
