
ACTION checkParking_Aborting:

//	IF NOT Transition_From_Stopped AND gSuperTrak.state.stateMachine.operationalState <> ABORTING THEN
//		Event_Code := 77;
//		EventLog.Commands.WriteUserEvent := TRUE;
//	END_IF;
//	
	

	//Not knowing if any trigger was set to true before the abort we make sure every one of them is false before going to aborted	
	gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.abort 		:= FALSE;
	gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.clear 		:= FALSE;
	gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.hold 		:= FALSE;
	gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.pause 		:= FALSE;
	gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.reset 		:= FALSE;
	gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.resume 	:= FALSE;
	gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.start 		:= FALSE;
	gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.stop 		:= FALSE;
	gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.suspend 	:= FALSE;
	gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.unhold 	:= FALSE;
	gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.unsuspend 	:= FALSE;
	
	Skills_Aborted := Skills_Aborted + 1;
	gSuperTrak.skill.checkParking.state.stateMachine.operationalState := ABORTED;

END_ACTION
