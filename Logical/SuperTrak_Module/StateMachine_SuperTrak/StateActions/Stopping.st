
ACTION Stopping: 
	
	// Loop thru all StTargetExt function blocks
	FOR j := 1 TO SUPERTRAK_TARGETS DO
		// Enable StTargetExt
		StTargetExt_[j].ReleaseToTarget		:= FALSE; 
	END_FOR;
	
	Transition_From_Stopped := TRUE;
	

	Skills_Aborted := 0;
	

	//Send abort transition to the skills 
	gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.abort := TRUE;
				
	FOR iShuttle := 1 TO SUPERTRAK_SHUTTLES DO				
		gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.abort := TRUE;
	END_FOR;

	gSuperTrak.state.stateMachine.operationalState := STOPPED;

	
END_ACTION
