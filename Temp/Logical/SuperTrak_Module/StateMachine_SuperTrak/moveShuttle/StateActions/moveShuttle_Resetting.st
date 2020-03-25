
ACTION moveShuttle_Resetting: 
(*	IF gSuperTrak.skill.moveShuttle[iShuttle].outputParameters.currentTarget = 12 THEN
		gaMessagesModule[52 + iShuttle].bMessage_Active := FALSE;
	END_IF
	
	IF NOT gaMessagesModule[52 + iShuttle].bMessage_Active AND
		(*PalletWasAtServiceStation[iPallet] AND*)
(*		NOT PalletAtServiceStation THEN
		
		gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := IDLE;
	END_IF*)
	
	gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := IDLE;
END_ACTION
