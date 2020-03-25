
ACTION Aborting: 
	
	Counter_Clearing_Timeout(IN:= FALSE);
	Last_Shuttle := -1;
	
	IF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.abort THEN
		Aborting_Init := TRUE;
	END_IF;
	
	gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.abort := FALSE;
	//gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.abort := FALSE;
	gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.abort := FALSE;
	
	//Disable all sections
	StControl_0.EnableAllSections := FALSE;
	
	Calibration_State := ENABLE_SYSTEM;
	
	//First iteration in aborting
	IF Aborting_Init THEN
		
		Skills_Aborted := 0;			
		
		Aborting_Init := FALSE;
	END_IF;
		
	//Send abort transition to the skills 
	gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.abort := TRUE;
	//gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.abort := TRUE;
	gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.abort := TRUE;
	
				
	FOR iShuttle := 1 TO SUPERTRAK_SHUTTLES DO				
		gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.abort := TRUE;
	END_FOR;

	
	//Wait for the sections to be disabled and skills to be aborted and then go into aborted state
	IF NOT StControl_0.SectionsEnabled AND Skills_Aborted = (SUPERTRAK_SHUTTLES + 2) THEN

		gSuperTrak.state.stateMachine.operationalState := ABORTED;
		
	END_IF;

	
END_ACTION
