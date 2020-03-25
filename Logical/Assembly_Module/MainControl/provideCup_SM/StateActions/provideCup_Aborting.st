
ACTION provideCup_Aborting: 
	
	gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.abort 	  := FALSE;
	gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.clear 	  := FALSE;
	gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.hold 	  := FALSE;
	gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.pause 	  := FALSE;
	gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.reset 	  := FALSE;
	gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.resume 	  := FALSE;
	gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.start 	  := FALSE;
	gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.stop 	  := FALSE;
	gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.suspend   := FALSE;
	gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.unhold 	  := FALSE;
	gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.unsuspend := FALSE;
	

	//jump one cup in case General SM goes to stopped or aborted
	IF  gAssemblyModule.skill.provideCup.inputParameters.cupType = 1 THEN	// 1 = Paper
			x_counter_paper := x_counter_paper +1;
			Assem_PaperRemaining := Assem_PaperRemaining -1;
	ELSIF gAssemblyModule.skill.provideCup.inputParameters.cupType = 2 THEN	// 2 = Plastic
			x_counter_plastic := x_counter_plastic +1;
			Assem_PlasticRemaining := Assem_PlasticRemaining -1;
	END_IF
	
	gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := ABORTED;
	
END_ACTION
