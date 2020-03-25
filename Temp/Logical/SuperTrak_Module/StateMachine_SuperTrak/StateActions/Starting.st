
ACTION Starting: 
	
	IF StControl_0.Active THEN
		// Loop thru all StSection function blocks
		FOR j := 1 TO SUPERTRAK_SECTIONS DO
			// Enable StSection
			StSectionCtrl_[j].Enable					:= TRUE; 
		END_FOR;
			
		// Loop thru all StTargetExt function blocks
		FOR j := 1 TO SUPERTRAK_TARGETS DO
			// Enable StTargetExt
			StTargetExt_[j].Enable						:= TRUE; 
		END_FOR;
				
		// Loop thru all StSection function blocks
		FOR j := 1 TO SUPERTRAK_SECTIONS DO
			// Check if section is ready to be enalbed
			IF StSectionCtrl_[j].MotorPowerOn AND NOT StSectionCtrl_[j].Error THEN
				// Enable section
				StSectionCtrl_[j].EnableSection			:= TRUE;
			END_IF;
		END_FOR;
	END_IF;
	
		
	(*Skill state machine aborted then make the skill transition state reset*)
//	gSuperTrak.skill.moveShuttle[0].state.stateMachine.stateTransition.reset := TRUE;
//	gSuperTrak.state.stateMachine.operationalState := RUNNING;
	//	
	
	IF StControl_0.SectionsEnabled THEN
		(* Reset all Skills from Stopped to Idle *)
		
		FOR iShuttle := 1 TO Last_ID DO
			
			IF gSuperTrak.skill.moveShuttle[1].state.stateMachine.operationalState = ABORTED THEN
				
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.reset := TRUE;
				gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.reset := TRUE;
				gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.reset := TRUE;
				gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.reset := TRUE;
			//	transitionFromAborted := TRUE;
				
				
			ELSIF gSuperTrak.skill.moveShuttle[1].inputParameters.finalTarget = Target_1 AND
				gSuperTrak.skill.moveShuttle[1].outputParameters.currentTarget = Target_8 THEN

				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.start := TRUE;
				gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.start := TRUE;
				
			ELSE 
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.reset := TRUE;
				gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.reset := TRUE;
			
			END_IF;
				
		END_FOR
		(*Before going into running state first check if we come from aborted to reset the variable*)
		//???
		IF transitionFromAborted THEN
			//Condition?
//			IF gSuperTrak.skill.moveShuttle[SUPERTRACK_SHUTTLES].state.stateMachine.operationalState = IDLE AND
//				gSuperTrak.skill.moveShuttle[1].state.stateMachine.operationalState = RUNNING THEN
				
				transitionFromAborted := FALSE;
				gSuperTrak.state.stateMachine.operationalState 		:= RUNNING;
				
			//			END_IF;
		ELSIF Transition_From_Stopped THEN
			
			Transition_From_Stopped := FALSE;
		ELSE
			gSuperTrak.state.stateMachine.operationalState 		:= RUNNING;	
		END_IF;
	END_IF;
	
	
	

	
	
END_ACTION
