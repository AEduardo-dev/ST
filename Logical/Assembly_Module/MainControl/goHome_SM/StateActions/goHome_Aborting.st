
ACTION goHome_Aborting: 
//	IF NOT TransitionFromStopped THEN
//		Event_Code := 107;
//		EventLog.Commands.WriteUserEvent := TRUE;
//	END_IF;
	
	gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.abort 	  := FALSE;
	gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.clear 	  := FALSE;
	gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.hold 	  := FALSE;
	gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.pause 	  := FALSE;
	gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.reset 	  := FALSE;
	gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.resume 	  := FALSE;
	gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.start 	  := FALSE;
	gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.stop 	  := FALSE;
	gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.suspend   := FALSE;
	gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.unhold 	  := FALSE;
	gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.unsuspend := FALSE;
	
	gAssemblyModule.skill.goHome.state.stateMachine.operationalState := ABORTED;
	
END_ACTION
