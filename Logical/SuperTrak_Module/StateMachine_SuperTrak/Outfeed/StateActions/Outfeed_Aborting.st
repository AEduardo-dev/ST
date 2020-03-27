
ACTION Outfeed_Aborting:

//	IF NOT Transition_From_Stopped AND gSuperTrak.state.stateMachine.operationalState <> ABORTING THEN
//		Event_Code := 77;
//		EventLog.Commands.WriteUserEvent := TRUE;
//	END_IF;
//	
	

	//Not knowing if any trigger was set to true before the abort we make sure every one of them is false before going to aborted	
	gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.abort 		:= FALSE;
	gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.clear 		:= FALSE;
	gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.hold 		:= FALSE;
	gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.pause 		:= FALSE;
	gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.reset 		:= FALSE;
	gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.resume 		:= FALSE;
	gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.start 		:= FALSE;
	gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.stop 		:= FALSE;
	gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.suspend 	:= FALSE;
	gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.unhold 		:= FALSE;
	gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.unsuspend 	:= FALSE;
	
	//TODO: Insert Outfeed LED Light control
	Outfeed_LED_Blue := FALSE;
	Outfeed_LED_Green := FALSE;
	Outfeed_LED_Red := TRUE;
	
	Outfeed_Actuator_UP := FALSE;	
	Outfeed_Actuator_DOWN := FALSE;
	Outfeed_Actuator_FRONT := FALSE;	
	Outfeed_Actuator_BACK := FALSE;
	
	Skills_Aborted := Skills_Aborted + 1;
	gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := ABORTED;

END_ACTION
