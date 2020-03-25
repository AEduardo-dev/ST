
ACTION providePellet_Aborting:
//	IF NOT TransitionFromStopped THEN
//		Event_Code := 109;
//		EventLog.Commands.WriteUserEvent := TRUE;
//	END_IF;
	
	
	gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.abort 	 := FALSE;
	gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.clear 	 := FALSE;
	gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.hold 	 := FALSE;
	gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.pause 	 := FALSE;
	gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.reset 	 := FALSE;
	gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.resume 	 := FALSE;
	gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.start 	 := FALSE;
	gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.stop 	 := FALSE;
	gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.suspend 	 := FALSE;
	gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.unhold 	 := FALSE;
	gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.unsuspend := FALSE;
	
	gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := ABORTED;
	
END_ACTION
