
ACTION Demo_Mode: 
//Mode where the whole process can be simulated wothout needing an MES execution. 
//Only SuperTrak is controlled and the modules interaction is faked using timers for a realistic execution.

	IF gSuperTrak.state.stateMachine.operationalState = ABORTED 
		AND SumCritical = FALSE THEN
	
		gSuperTrak.state.stateMachine.stateTransition.clear := TRUE;
		
	END_IF;
	
	IF gSuperTrak.state.stateMachine.operationalState = STOPPED THEN
	
		gSuperTrak.state.stateMachine.stateTransition.reset := TRUE;
		
	END_IF;		
	
	
	IF gSuperTrak.state.stateMachine.operationalState = IDLE THEN
	
		gSuperTrak.state.stateMachine.stateTransition.start := TRUE;
		
	END_IF;
	
	
	
	
	IF  gSuperTrak.state.stateMachine.operationalState = RUNNING AND
		Place_Order AND (ID = 0 OR ID = -1) THEN
		
		//Call skill checkParking to retrieve shuttleID
		
		gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.start := TRUE;
		
		//When skill is finished store the ID in a variable
		IF gSuperTrak.skill.checkParking.state.stateMachine.operationalState = COMPLETE THEN
		
			ID := gSuperTrak.skill.checkParking.outputParameters.shuttleId;
			gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.reset := TRUE;
			
		END_IF;
		
	END_IF;
	
	//checkParking returns -1 if there is no shuttle there at the station
	IF ID <> -1 AND ID <> 0 AND StTargetExt_[1].PalletPresent THEN 
		
		Place_Order := FALSE;	
		ID := 0;
		TargetControlParameters[1].AdvancedReleaseConfig.DestinationTarget := 2;
		StTargetExt_[1].ReleaseToTarget := TRUE;
		
		IF EDGENEG(StTargetExt_[1].PalletPresent) THEN
			
			StTargetExt_[1].ReleaseToTarget := FALSE;
			
		END_IF;		
		
	END_IF;
	
	
	
	//Assembly Module
	IF StTargetExt_[2].PalletPresent THEN
			
		TON_Release_Target_2 (IN := TRUE, PT := T#5s);
			
		IF TON_Release_Target_2.Q THEN
				
			StTargetExt_[2].ReleaseToTarget := TRUE;
			
		END_IF;
			
	END_IF;

	IF EDGENEG(StTargetExt_[2].PalletPresent) THEN
			
		StTargetExt_[2].ReleaseToTarget := FALSE;
		TON_Release_Target_2 (IN := FALSE);
			
	END_IF;
	
	
	
	
	//SeedSupply Module
	IF StTargetExt_[3].PalletPresent THEN
			
		TON_Release_Target_3 (IN := TRUE, PT := T#12s);	
		
		IF TON_Release_Target_3.Q THEN
			
			IF StTargetExt_[1].PalletPresent THEN
				Get_away := TRUE;
			END_IF;
			
			StTargetExt_[3].ReleaseToTarget := TRUE;
			TON_Check_Parking (IN := TRUE, PT := T#3.5s);
			
		END_IF;
			
	END_IF;

	IF EDGENEG(StTargetExt_[3].PalletPresent) THEN
			
		StTargetExt_[3].ReleaseToTarget := FALSE;
		TON_Release_Target_3 (IN := FALSE);
			
	END_IF;
	
	
	
	IF StTargetExt_[1].PalletPresent AND NOT StTargetExt_[1].ReleaseToTarget
		AND NOT TON_Check_Parking.Q AND Get_away THEN
			
		TargetControlParameters[1].AdvancedReleaseConfig.DestinationTarget := 8;
		TargetControlParameters[1].AdvancedReleaseConfig.MoveConfigIdx := 2;
		StTargetExt_[1].ReleaseToTarget := TRUE;	
				
	END_IF;
			
	IF TON_Check_Parking.Q THEN
			
		Get_away := FALSE;
		TON_Check_Parking (IN := FALSE);
		TargetControlParameters[1].AdvancedReleaseConfig.DestinationTarget := 2;
		TargetControlParameters[1].AdvancedReleaseConfig.MoveConfigIdx := 1;
				
	END_IF;
			
			
	IF EDGENEG(StTargetExt_[1].PalletPresent) THEN
				
		StTargetExt_[1].ReleaseToTarget := FALSE;
			
	END_IF;
			
	
	
	
	//QA Station
	IF StTargetExt_[4].PalletPresent THEN
			
		IF gSuperTrak.skill.QACheck.state.stateMachine.operationalState = IDLE THEN
			
			gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.start := TRUE;
			
		ELSE
			
			gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.start := FALSE;

		END_IF;
			
		IF gSuperTrak.skill.QACheck.state.stateMachine.operationalState = COMPLETE THEN
				
			gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.reset := TRUE;
			StTargetExt_[4].ReleaseToTarget := TRUE;
			
		END_IF;
			
	END_IF;

	IF EDGENEG(StTargetExt_[4].PalletPresent) THEN
			
		StTargetExt_[4].ReleaseToTarget := FALSE;
			
	END_IF;
	
	
	
	
	//Sealing Module
	IF StTargetExt_[5].PalletPresent THEN
			
		TON_Release_Target_5 (IN := TRUE, PT := T#15s);
			
		IF TON_Release_Target_5.Q THEN
				
			StTargetExt_[5].ReleaseToTarget := TRUE;
			
		END_IF;
			
	END_IF;

	IF EDGENEG(StTargetExt_[5].PalletPresent) THEN
			
		StTargetExt_[5].ReleaseToTarget := FALSE;
		TON_Release_Target_5 (IN := FALSE);
			
	END_IF;
	
	
	
	
	//Labeling Module
	IF StTargetExt_[6].PalletPresent THEN
			
		TON_Release_Target_6 (IN := TRUE, PT := T#1s);
			
		IF TON_Release_Target_6.Q THEN
				
			StTargetExt_[6].ReleaseToTarget := TRUE;
			
		END_IF;
			
	END_IF;

	IF EDGENEG(StTargetExt_[6].PalletPresent) THEN
			
		StTargetExt_[6].ReleaseToTarget := FALSE;
		TON_Release_Target_6 (IN := FALSE);
			
	END_IF;
	
	
	
	
	//Outfeed Station
	IF StTargetExt_[7].PalletPresent THEN
			
		
		IF gSuperTrak.skill.Outfeed.state.stateMachine.operationalState = IDLE THEN
			
			gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.start := TRUE;
			
		ELSE
			
			gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.start := FALSE;

		END_IF;
		
			
		IF gSuperTrak.skill.Outfeed.state.stateMachine.operationalState = COMPLETE THEN
			
			gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.reset := TRUE;
			StTargetExt_[7].ReleaseToTarget := TRUE;
			
		END_IF;
			
	END_IF;

	IF EDGENEG(StTargetExt_[7].PalletPresent) THEN
			
		StTargetExt_[7].ReleaseToTarget := FALSE;
			
	END_IF;
	
	
	//Virtual Target
	IF StTargetExt_[8].PalletPresent THEN
	
		StTargetExt_[8].ReleaseToTarget := TRUE;
		
	END_IF;

	IF EDGENEG(StTargetExt_[8].PalletPresent) THEN
			
		StTargetExt_[8].ReleaseToTarget := FALSE;
			
	END_IF;
	
	
	TON_Check_Parking ();
	
END_ACTION
