
ACTION goHome_StateErrorReset: 
	
	gAssemblyModule.skill.goHome.state.stateMachine.operationalStateError := '';
	gaMessagesModule[57].bMessage_Active := FALSE;
	
END_ACTION
