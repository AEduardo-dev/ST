
PROGRAM _INIT
	
	// Configure the internal communication structure to/from SuperTrak
	SuperTrakControlParameters.NrOfCommands       := SUPERTRAK_MAX_COMMANDS;
	SuperTrakControlParameters.NrOfPallets        := SUPERTRAK_MAX_SHUTTLES;
	SuperTrakControlParameters.NrOfSections       := SUPERTRAK_MAX_SECTIONS;
	SuperTrakControlParameters.NrOfTargets        := SUPERTRAK_MAX_TARGETS;
 
	// Configure a simple pallet routing
	TargetControlParameters[1].AdvancedReleaseConfig.DestinationTarget  := 2;
	TargetControlParameters[1].AdvancedReleaseConfig.Direction     := stCOM_DIR_RIGHT;
 
	TargetControlParameters[2].AdvancedReleaseConfig.DestinationTarget  := 3;
	TargetControlParameters[2].AdvancedReleaseConfig.Direction     := stCOM_DIR_RIGHT;
 
	TargetControlParameters[3].AdvancedReleaseConfig.DestinationTarget  := 4;
	TargetControlParameters[3].AdvancedReleaseConfig.Direction     := stCOM_DIR_RIGHT;
	
	TargetControlParameters[4].AdvancedReleaseConfig.DestinationTarget  := 5;
	TargetControlParameters[4].AdvancedReleaseConfig.Direction     := stCOM_DIR_RIGHT;
	
	TargetControlParameters[5].AdvancedReleaseConfig.DestinationTarget  := 6;
	TargetControlParameters[5].AdvancedReleaseConfig.Direction     := stCOM_DIR_RIGHT;
	
	TargetControlParameters[6].AdvancedReleaseConfig.DestinationTarget  := 7;
	TargetControlParameters[6].AdvancedReleaseConfig.Direction     := stCOM_DIR_RIGHT;
 
	TargetControlParameters[7].AdvancedReleaseConfig.DestinationTarget  := 8;
	TargetControlParameters[7].AdvancedReleaseConfig.Direction     := stCOM_DIR_RIGHT;

	TargetControlParameters[8].AdvancedReleaseConfig.DestinationTarget  := 1;
	TargetControlParameters[8].AdvancedReleaseConfig.Direction     := stCOM_DIR_RIGHT;
 
	(*************************************************************************************************)
	(*************************************************************************************************)
	(* FUNCTION BLOCK INITIALIZATION *)

	// Initialize the function block, handling the communication to/from SuperTrak
	StControl_0.StLink           := ADR(gStLink);
	StControl_0.Enable           := TRUE;
	StControl_0.Parameters         := ADR(SuperTrakControlParameters);
	StControl_0.StCtrlData         := ADR(gStCyclicControlData);
	StControl_0.StCtrlDataSize        := SIZEOF(gStCyclicControlData);
	StControl_0.StStatData         := ADR(gStCyclicStatusData);
	StControl_0.StStatDataSize        := SIZEOF(gStCyclicStatusData);
	StControl_0.StServChRequestData     := ADR(gStServiceChannelReqData);
	StControl_0.StServChRequestDataSize   := SIZEOF(gStServiceChannelReqData);
	StControl_0.StServChResponseData    := ADR(gStServiceChannelResData);
	StControl_0.StServChResponseDataSize  := SIZEOF(gStServiceChannelResData);
 
	// Initialize the fucntion blocks, controlling a single section
	FOR Index := 1 TO SUPERTRAK_SECTIONS DO
		StSection_[Index].StLink      := ADR(gStLink);
		StSection_[Index].Parameters     := ADR(SuperTrakSectionParameters);
		StSection_[Index].Section      := Index;
	END_FOR;

	// Initialize the fucntion blocks, controlling a single section
	FOR Index := 1 TO SUPERTRAK_TARGETS DO
		StTargetExt_[Index].StLink      := ADR(gStLink);
		StTargetExt_[Index].Parameters   := ADR(TargetControlParameters[Index]);
		StTargetExt_[Index].Target      := Index;
	END_FOR;
	
	//Give unique name to each move shuttle skill
	FOR j := 1 TO SUPERTRAK_SHUTTLES DO
		Identifier := USINT_TO_STRING(j);
		gSuperTrak.skill.moveShuttle[Index].name := CONCAT('MoveShuttle', Identifier);
	END_FOR;
	
	//Check if all the variables are in the range available
	IF SUPERTRAK_SECTIONS > SUPERTRAK_MAX_SECTIONS THEN
		Event_Code := 8;
		EventLog.Commands.WriteUserEvent := TRUE;
	END_IF;	
		
	IF SUPERTRAK_SHUTTLES > SUPERTRAK_MAX_SHUTTLES THEN
		Event_Code := 9;
		EventLog.Commands.WriteUserEvent := TRUE;
	END_IF;

	IF SUPERTRAK_TARGETS > SUPERTRAK_MAX_TARGETS THEN
		Event_Code := 10;
		EventLog.Commands.WriteUserEvent := TRUE;
	END_IF;
	
	Skills_Aborted := SUPERTRAK_SHUTTLES + 2;
	TON_SuperTrakLifeBit(IN := FALSE, PT := LIFEBIT_TIMEOUT);
	
END_PROGRAM

PROGRAM _CYCLIC	
	
	
(*************************************************************************************************)	
(*Lifebit*) 
(*************************************************************************************************)
	(* Only Check if the flag is not set for simulation *)
	(* If the flag is set the code can be simulated without the lifebit taken into account *)
	IF NOT Life_Bit_Ignore THEN
		
		IF gSuperTrak.lifeBit.lifeBitAck THEN
			
			gSuperTrak.lifeBit.lifeBitAck := FALSE;
			TON_SuperTrakLifeBit(IN := FALSE);
			TON_SuperTrakLifeBit(IN := TRUE, PT := LIFEBIT_TIMEOUT);
			
		ELSIF NOT gSuperTrak.lifeBit.lifeBitAck AND		
			TON_SuperTrakLifeBit.ET >= LIFEBIT_TIMEOUT THEN
			
			Event_Code := 4;
			EventLog.Commands.WriteUserEvent := TRUE;		
			TON_SuperTrakLifeBit(IN := FALSE);
			
		END_IF;
		
		TON_SuperTrakLifeBit();
		
	END_IF;
	
	

(*************************************************************************************************)
(*************************************************************************************************)
	
	(*************************************************************************************************)
	(*************************************************************************************************)
	(* State Machine *)
	CASE gSuperTrak.state.stateMachine.operationalState OF
		(*************************************************************************************************)
		(* RESETTING *)
		RESETTING:
			//			gSuperTrak.state.stateMachine.stateTransition.reset := FALSE;

			IF gSuperTrak.state.stateMachine.stateTransition.abort THEN
				
				gSuperTrak.state.stateMachine.operationalState := ABORTING;
				
				
			ELSIF gSuperTrak.state.stateMachine.stateTransition.stop THEN
				
				gSuperTrak.state.stateMachine.operationalState := STOPPING;
				
			ELSE		
				Resetting;
				
			END_IF;

			(*************************************************************************************************)
			(* IDLE *)
		IDLE: 
			gSuperTrak.state.stateMachine.stateTransition.reset := FALSE;
			
			
			IF gSuperTrak.state.stateMachine.stateTransition.abort THEN
				
				gSuperTrak.state.stateMachine.operationalState := ABORTING;
		
				
			ELSIF gSuperTrak.state.stateMachine.stateTransition.stop THEN
				
				gSuperTrak.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				Idle;
				
			END_IF;
		
			(*************************************************************************************************)
			(* STARTING *)
		STARTING: 
//			gSuperTrak.state.stateMachine.stateTransition.start := FALSE;			
			
			IF gSuperTrak.state.stateMachine.stateTransition.abort THEN
				
				gSuperTrak.state.stateMachine.operationalState := ABORTING;
					
			ELSIF gSuperTrak.state.stateMachine.stateTransition.stop THEN
				
				gSuperTrak.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				Starting;
				
			END_IF;
		
		
			(*************************************************************************************************)
			(* RUNNING *)
		RUNNING:
			
			gSuperTrak.state.stateMachine.stateTransition.start := FALSE;	
			
			IF gSuperTrak.state.stateMachine.stateTransition.abort THEN
				
				gSuperTrak.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.state.stateMachine.stateTransition.stop THEN
				
				gSuperTrak.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gSuperTrak.state.stateMachine.stateTransition.hold THEN
				gSuperTrak.state.stateMachine.operationalState := HOLDING;
				
				gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.hold := TRUE;
				
				FOR iShuttle := 1 TO SUPERTRAK_SHUTTLES DO				
					gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.hold := TRUE;
				END_FOR;
				
			ELSIF gSuperTrak.state.stateMachine.stateTransition.suspend THEN
				gSuperTrak.state.stateMachine.operationalState := SUSPENDING;
				
				gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.suspend := TRUE;
				
				FOR iShuttle := 1 TO SUPERTRAK_SHUTTLES DO				
					gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.suspend := TRUE;
				END_FOR;
				

			ELSIF gSuperTrak.state.stateMachine.stateTransition.pause THEN
				gSuperTrak.state.stateMachine.operationalState := PAUSING;
				
				gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.pause := TRUE;
				
				FOR iShuttle := 1 TO SUPERTRAK_SHUTTLES DO				
					gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.pause := TRUE;
				END_FOR;
			
			ELSE
				Running;
				
			END_IF;
		
			(*************************************************************************************************)
			(* PAUSING *)
		PAUSING: 
//			gSuperTrak.state.stateMachine.stateTransition.pause := FALSE;
			
			
			IF gSuperTrak.state.stateMachine.stateTransition.abort THEN
				
				gSuperTrak.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.state.stateMachine.stateTransition.stop THEN
				
				gSuperTrak.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gSuperTrak.state.stateMachine.stateTransition.hold THEN
				gSuperTrak.state.stateMachine.operationalState := HOLDING;
				
				gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.hold := TRUE;
				
				FOR iShuttle := 1 TO SUPERTRAK_SHUTTLES DO				
					gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.hold := TRUE;
				END_FOR;
				
				
			ELSIF gSuperTrak.state.stateMachine.stateTransition.suspend THEN
				gSuperTrak.state.stateMachine.operationalState := SUSPENDING;
				
				gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.suspend := TRUE;
				
				FOR iShuttle := 1 TO SUPERTRAK_SHUTTLES DO				
					gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.suspend := TRUE;
				END_FOR;
				
			ELSE
				
			END_IF;
		
			(*************************************************************************************************)
			(* PAUSED *)		
		PAUSED: 
			
			gSuperTrak.state.stateMachine.stateTransition.pause := FALSE;
			
			IF gSuperTrak.state.stateMachine.stateTransition.abort THEN
				
				gSuperTrak.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.state.stateMachine.stateTransition.stop THEN
				
				gSuperTrak.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gSuperTrak.state.stateMachine.stateTransition.hold THEN
				gSuperTrak.state.stateMachine.operationalState := HOLDING;
				
				gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.hold := TRUE;
				
				FOR iShuttle := 1 TO SUPERTRAK_SHUTTLES DO				
					gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.hold := TRUE;
				END_FOR;
				
				
			ELSIF gSuperTrak.state.stateMachine.stateTransition.suspend THEN
				gSuperTrak.state.stateMachine.operationalState := SUSPENDING;
				
				gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.suspend := TRUE;
				
				FOR iShuttle := 1 TO SUPERTRAK_SHUTTLES DO				
					gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.suspend := TRUE;
				END_FOR;
				
			ELSE
				
				Paused;

			END_IF;
		
			(*************************************************************************************************)
			(* SUSPENDING *)		
		SUSPENDING:
			
			(*gSuperTrak.state.stateMachine.stateTransition.suspend := FALSE;*)
	
			IF gSuperTrak.state.stateMachine.stateTransition.abort THEN
				
				gSuperTrak.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.state.stateMachine.stateTransition.stop THEN
				
				gSuperTrak.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gSuperTrak.state.stateMachine.stateTransition.hold THEN
				gSuperTrak.state.stateMachine.operationalState := HOLDING;
				
				gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.hold := TRUE;
				
				FOR iShuttle := 1 TO SUPERTRAK_SHUTTLES DO				
					gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.hold := TRUE;
				END_FOR;
				
				
			ELSE
				Suspending;
				
			END_IF;

			(*************************************************************************************************)
			(* SUSPENDED *)
		SUSPENDED: 
			
			gSuperTrak.state.stateMachine.stateTransition.suspend := FALSE;

			IF gSuperTrak.state.stateMachine.stateTransition.abort THEN
				
				gSuperTrak.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.state.stateMachine.stateTransition.stop THEN
				
				gSuperTrak.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gSuperTrak.state.stateMachine.stateTransition.hold THEN
				gSuperTrak.state.stateMachine.operationalState := HOLDING;
				
				gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.hold := TRUE;
				
				FOR iShuttle := 1 TO SUPERTRAK_SHUTTLES DO				
					gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.hold := TRUE;
				END_FOR;
				

			ELSE				
				Suspended;
				
			END_IF;
		
			(*************************************************************************************************)
			(* UNSUSPENDING *)		
		UNSUSPENDING: 
			gSuperTrak.state.stateMachine.stateTransition.unsuspend := FALSE;

			IF gSuperTrak.state.stateMachine.stateTransition.abort THEN
				
				gSuperTrak.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.state.stateMachine.stateTransition.stop THEN
				
				gSuperTrak.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gSuperTrak.state.stateMachine.stateTransition.hold THEN
				gSuperTrak.state.stateMachine.operationalState := HOLDING;
				
				gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.hold := TRUE;
				
				FOR iShuttle := 1 TO SUPERTRAK_SHUTTLES DO				
					gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.hold := TRUE;
				END_FOR;
				
				
			ELSE				
				Unsuspending;
				
			END_IF;

			(*************************************************************************************************)
			(* HOLDING *)
		HOLDING: 
			(*gSuperTrak.state.stateMachine.stateTransition.hold := FALSE;*)

			IF gSuperTrak.state.stateMachine.stateTransition.abort THEN
				
				gSuperTrak.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.state.stateMachine.stateTransition.stop THEN
				
				gSuperTrak.state.stateMachine.operationalState := STOPPING;
			
			ELSE				
				Holding;
				
			END_IF;

			(*************************************************************************************************)
			(* HELD *)		
		HELD: 
			
			gSuperTrak.state.stateMachine.stateTransition.hold := FALSE;
			
			IF gSuperTrak.state.stateMachine.stateTransition.abort THEN
				
				gSuperTrak.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.state.stateMachine.stateTransition.stop THEN
				
				gSuperTrak.state.stateMachine.operationalState := STOPPING;
			
			ELSE
				Held;
			
			END_IF;

			(*************************************************************************************************)
			(* UNHOLDING *)
		UNHOLDING: 
			gSuperTrak.state.stateMachine.stateTransition.unhold := FALSE;

			IF gSuperTrak.state.stateMachine.stateTransition.abort THEN
				
				gSuperTrak.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.state.stateMachine.stateTransition.stop THEN
				
				gSuperTrak.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				Unholding;
			
			END_IF;

			(*************************************************************************************************)
			(* COMPLETING *)
		COMPLETING: 
						
			IF gSuperTrak.state.stateMachine.stateTransition.abort THEN
				
				gSuperTrak.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.state.stateMachine.stateTransition.stop THEN
				
				gSuperTrak.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				Completing;
			
			END_IF;

			(*************************************************************************************************)
			(* COMPLETE *)
		COMPLETE: 

			IF gSuperTrak.state.stateMachine.stateTransition.abort THEN
				
				gSuperTrak.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.state.stateMachine.stateTransition.stop THEN
				
				gSuperTrak.state.stateMachine.operationalState := STOPPING;
					
			ELSE				
				Complete;
			
			END_IF;

			(*************************************************************************************************)
			(* STOPPING *)
		STOPPING:
			(*gSuperTrak.state.stateMachine.stateTransition.stop := FALSE;*)
			
			IF gSuperTrak.state.stateMachine.stateTransition.abort THEN
				
				gSuperTrak.state.stateMachine.operationalState := ABORTING;
				
			ELSE
				Stopping;
				
			END_IF;

			(*************************************************************************************************)
			(* STOPPED *)
		STOPPED: 

			gSuperTrak.state.stateMachine.stateTransition.stop := FALSE;
			
			IF gSuperTrak.state.stateMachine.stateTransition.abort THEN
				
				gSuperTrak.state.stateMachine.operationalState := ABORTING;
			ELSE
				Stopped;
				
			END_IF;

			(*************************************************************************************************)
			(* ABORTING *)
		ABORTING: 
			(*gSuperTrak.state.stateMachine.stateTransition.abort := FALSE;*)
			
			Aborting;

			(*************************************************************************************************)
			(* ABORTED *)
		ABORTED: 
			gSuperTrak.state.stateMachine.stateTransition.abort := FALSE;
			Aborted;

			(*************************************************************************************************)
			(* CLEARING *)
		CLEARING:
			
			gSuperTrak.state.stateMachine.stateTransition.clear := FALSE;

			IF gSuperTrak.state.stateMachine.stateTransition.abort THEN
				
				gSuperTrak.state.stateMachine.operationalState := ABORTING;

			ELSE
				Clearing;
				
			END_IF;
			
			(*************************************************************************************************)
			(* ELSE *)
		ELSE;
	
	END_CASE;

	
	(* Function blocks calls *)
	// Call StControl
	StControl_0();
	// Loop thru all StTargetExt function blocks
	FOR Index := 1 TO SUPERTRAK_SECTIONS DO
		// Call StSection
		StSection_[Index]();
	END_FOR;
 
	// Loop thru all StSection function blocks
	FOR Index := 1 TO SUPERTRAK_TARGETS DO
		// Call StTargetExt
		StTargetExt_[Index]();
	END_FOR;
	
	//Skill calls
	FOR iShuttle := 1 TO SUPERTRAK_SHUTTLES DO
		moveShuttle;		
	END_FOR;
	
	TON_SuperTrakLifeBit();
	
	checkParking;
	
	QACheck;
	
	Outfeed;
	
	IF NOT Mp_Comau.Info.ReadyToPowerOn THEN
		gSuperTrak.state.stateMachine.stateTransition.abort := TRUE;
	END_IF;
	
END_PROGRAM





PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

