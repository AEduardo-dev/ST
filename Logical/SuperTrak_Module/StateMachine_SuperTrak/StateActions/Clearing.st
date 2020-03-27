
ACTION Clearing: 
	
	
		(*************************************************************************************************)
		(*************************************************************************************************)
		(* FUNCTION BLOCK CONFIGURATION *)
	
	Counter_Clearing_Timeout(IN := TRUE, PT := T#40s);
	
	(* Timer is connected to sensor variable and also to Target 4 so only hen a shuttle is at target 4 the time will start *)
		

	//If the clearing takes more time than expected the supertrak goes into aborted
	IF Counter_Clearing_Timeout.Q THEN
		Event_Code := 7;
		EventLog.Commands.WriteUserEvent := TRUE;
		gSuperTrak.state.stateMachine.stateTransition.abort := TRUE;
	END_IF;
	
	QA_Actuator_DOWN := TRUE;
	Timer_Actuator_DOWN (IN := TRUE, PT := T#8s);
	Outfeed_Actuator_DOWN := TRUE;
	Timer_Outfeed_DOWN (IN := TRUE, PT := T#10s);
	Outfeed_Actuator_BACK := TRUE;
		
	IF Timer_Actuator_DOWN.Q AND Timer_Outfeed_DOWN.Q THEN			
		IF StControl_0.Active AND 
			ST_LightBarrier_SecurityOut1_R AND ST_LightBarrier_SecurityOut2_R THEN
		
			(* Enable all sections for the calibration to begin *)
			CASE Calibration_State OF
				ENABLE_SYSTEM:
					//Assign to extarnal input for power enable
					StControl_0.EnableAllSections := TRUE;
			
					IF StControl_0.SectionsEnabled THEN
						FOR Index := 1 TO SUPERTRAK_TARGETS DO
							// Enable StTargetExt
							StTargetExt_[Index].Enable     := TRUE; 
						END_FOR;
				
						Event_Code := 0;
						EventLog.Commands.WriteUserEvent := TRUE;
					
						(* Check if the calibration has been already done for the first time *)
						
						IF Last_ID = 0 THEN
							Counter_Clearing_Timeout(IN := FALSE);
							Calibration_State := ID_SETTING;
						ELSE
							Counter_Clearing_Timeout(IN := FALSE);
							Calibration_State := ABORTED_RESET_POSITIONS;
						END_IF;					
					
						(* Variables initialization *)
						Calibration_Finished := FALSE;
						Shuttle := 0;
						Shuttle_sent := 0;
						New_ID := 0;
						First_ID := 0;
						first_shuttle := TRUE;
						Time_For_Stop(IN := FALSE, PT := T#3s);
					END_IF;
			
				
				
					(* Set id for each shuttle *)
				ID_SETTING:
					QA_Actuator_DOWN := FALSE;
					Outfeed_Actuator_DOWN := FALSE;
					Outfeed_Actuator_BACK := FALSE;
				
					(* If there is a shuttle at target 1 which id is 0 => No id given to that shuttle *)
					IF StTargetExt_[1].PalletPresent THEN
						(* Then the shuttle is given an id and sent to QA *)
						IF StTargetExt_[1].PalletID = 0 THEN
							New_ID := New_ID + 1;
							TargetControlParameters[1].PalletConfig.ID := New_ID;
							StTargetExt_[1].SetPalletID:= TRUE;
							Last_ID := New_ID;
							Calibration_State := SEND_TO_QA;
					
							(* When there are no more shuttles left and calibration has gone as it should *)	
						ELSIF NOT StTargetExt_[4].PalletPresent AND Calibration_Finished THEN
							Calibration_State := CALIBRATION_END;
						END_IF;
					END_IF;
				
			
					(* If there is a shuttle at target 4 we take the ID and store the value in a variable, then release it to the parking *)
					IF StTargetExt_[4].PalletPresent THEN
						TargetControlParameters[1].AdvancedReleaseConfig.DestinationTarget  := 4;
						TargetControlParameters[4].AdvancedReleaseConfig.DestinationTarget  := 1;				
					
						//If the shuttle at target 4 does not need to be checked it has to wait a certain time at target 4
						IF EDGEPOS(QA_finished) THEN
							//Set timer to false each time we do something so the timer is not triggered
							Counter_Clearing_Timeout(IN := FALSE);
						
							StTargetExt_[4].ReleaseToTarget := TRUE;
						
							(* When we reach the last id at QA then we go to the last state of calibration *)
							IF StTargetExt_[4].PalletID = Last_ID THEN
								Calibration_Finished := TRUE;
							END_IF;
						
						END_IF;
					
					END_IF;
				
					(* When the shuttle leaves the target -> reset the ReleaseToTarget parameter*)
					IF EDGENEG(StTargetExt_[1].PalletPresent) THEN	
						StTargetExt_[1].ReleaseToTarget := FALSE;
					END_IF;
				
				
					IF EDGENEG(StTargetExt_[4].PalletPresent) THEN	
						StTargetExt_[4].ReleaseToTarget:= FALSE;
					END_IF;
				
				
					
					(* State for movement of shuttle when configured *)
				SEND_TO_QA:
			
					IF StTargetExt_[1].PalletID = 0 THEN
						TargetControlParameters[1].AdvancedReleaseConfig.MoveConfigIdx := 1;
						//Reset of SetPalletID so we can set the next one in ID_SETTING at Target 1
						StTargetExt_[1].SetPalletID:= FALSE;
					
					ELSE
						TargetControlParameters[1].AdvancedReleaseConfig.MoveConfigIdx := 1;
						TargetControlParameters[1].AdvancedReleaseConfig.DestinationTarget := 4;
						StTargetExt_[1].ReleaseToTarget := TRUE;
				
						Calibration_State := ID_SETTING;						
					END_IF;			
				
			
					(*************************************************)
					(* States for calibration from abort mid process*)				
					(*************************************************)	
				
					(* Send shuttles to target one after aborted *)
				ABORTED_RESET_POSITIONS:
					QA_Actuator_DOWN := FALSE;
					Outfeed_Actuator_BACK := FALSE;
					Outfeed_Actuator_DOWN := FALSE;
					
					(* In case there is a transition from aborted but calibration was already done we need to recalibrate and send the shuttle to QA *)
					IF transitionFromAborted AND (StTargetExt_[1].PalletID <> 0 OR (NOT StTargetExt_[1].PalletPresent AND Last_ID = SUPERTRAK_SHUTTLES)) THEN
					
						Time_For_AbortClearing_Start (IN := TRUE, PT := T#3s);
					
						(* Wait until we are sure every shuttle is not moving and near a target *)
						IF Time_For_AbortClearing_Start.Q THEN
						
							(* Timer long enough to be sure all shuttles are going to target 1*)
							Time_For_AbortClearing_End (IN := TRUE, PT := T#7s);
						
							(* Sending all shuttles to target one *)
							FOR j:= 1 TO SUPERTRAK_TARGETS DO
								//If there is a pallet present at a target
								IF StTargetExt_[j].PalletPresent THEN		
									//Make sure the movement is the slow one
									TargetControlParameters[j].AdvancedReleaseConfig.MoveConfigIdx := 1;						
								
									//If it is target eight
									IF j = 8 THEN		
										IF first_shuttle THEN
											//Store the Id of first shuttle going to target one so we do not send it twice 
											first_shuttle := FALSE;
											First_ID := StTargetExt_[j].PalletID;
										END_IF;
										//Final target is target 1 and the shuttle is released
										TargetControlParameters[j].AdvancedReleaseConfig.DestinationTarget := 1;
										gSuperTrak.skill.moveShuttle[StTargetExt_[j].PalletID].inputParameters.finalTarget := Target_1;
										//Setting the current target because the skills are in aborted so we need to set it beforehand
										gSuperTrak.skill.moveShuttle[StTargetExt_[j].PalletID].outputParameters.currentTarget := Target_1;
										StTargetExt_[8].ReleaseToTarget := TRUE;
									
										//Any other target releases it's shuttle to target 8 
									ELSE
										TargetControlParameters[j].AdvancedReleaseConfig.DestinationTarget := 8;
									END_IF;
									
									(* Only release the shuttles one time *)
									IF j <> 1 OR StTargetExt_[1].PalletID <> First_ID THEN
										StTargetExt_[j].ReleaseToTarget := TRUE;
									END_IF;								
								END_IF;	
							
								//After the release has been done the parameter is reset
								IF StTargetExt_[j].CommandDone THEN
									StTargetExt_[j].ReleaseToTarget := FALSE;
								END_IF;
							
							END_FOR;
						END_IF;
					END_IF;
				
				
					IF Time_For_AbortClearing_End.Q THEN
						Counter_Clearing_Timeout(IN := FALSE);
						Counter_Check_Shuttle (IN := FALSE);
						Calibration_State := ABORTED_CALIBRATION;
					END_IF;
				

					(* Manual calibration and setup for the shuttles *)	
				ABORTED_CALIBRATION:
					Time_For_AbortClearing_Start (IN := FALSE, PT := T#3s);
					Time_For_AbortClearing_End (IN := FALSE, PT := T#7s);
					
					(*In case some shuttles did not make it to target one we check the position 8 for them and release them to target 1*)
					IF StTargetExt_[8].PalletPresent AND NOT StTargetExt_[8].ReleaseToTarget THEN
						StTargetExt_[8].ReleaseToTarget := TRUE;
					END_IF;
				
					IF StTargetExt_[8].CommandDone THEN
						StTargetExt_[8].ReleaseToTarget := FALSE;
					END_IF;
				

					(* Set an ID to the Shuttle. If done for one of them should be done for all in order to avoid doubled IDs *)
					//This is not necessary to do
					//				IF SetID THEN
					//					
					//					Counter_Clearing_Timeout(IN := FALSE);
					//					
					//					New_ID := New_ID + 1;
					//					TargetControlParameters[1].PalletConfig.ID := New_ID;
					//					StTargetExt_[1].SetPalletID := TRUE;
					//					SetID := FALSE;
				
				
					(* Send shuttle to QA station *)
					IF StTargetExt_[1].PalletPresent AND Shuttle_sent < SUPERTRAK_SHUTTLES THEN
						Counter_Clearing_Timeout(IN := FALSE);
						Shuttle_sent := Shuttle_sent + 1;
						Calibration_State := ABORTED_SEND_TO_QA;
						//StTargetExt_[1].SetPalletID := FALSE;
					END_IF;
					
					(* Send shuttle to parking station *)
					IF EDGEPOS(QA_finished) AND NOT StTargetExt_[4].ReleaseToTarget (*AND StTargetExt_[4].PalletPresent*) THEN
					
						TargetControlParameters[4].AdvancedReleaseConfig.MoveConfigIdx := 1;
						TargetControlParameters[4].AdvancedReleaseConfig.DestinationTarget  := 1;
						TargetControlParameters[4].AdvancedReleaseConfig.Direction     := stCOM_DIR_RIGHT;
					
						Shuttle := Shuttle + 1;
						
						Counter_Check_Shuttle(IN := FALSE);
						StTargetExt_[4].ReleaseToTarget := TRUE;
						
						IF Shuttle_sent = Last_ID AND Shuttle = Last_ID THEN
							Calibration_Finished := TRUE;
						END_IF;

					END_IF;	
					
					//				IF MES_Test THEN
					//					Calibration_State := CALIBRATION_END;					
					//				END_IF;	
					//				
				
					
					IF EDGENEG(StTargetExt_[1].PalletPresent) THEN	
						StTargetExt_[1].ReleaseToTarget:= FALSE;
					END_IF;
					
					
					IF EDGENEG(StTargetExt_[4].PalletPresent) THEN	
						StTargetExt_[4].ReleaseToTarget:= FALSE;
					END_IF;
				
					IF Calibration_Finished THEN
						Calibration_State := CALIBRATION_END;	
					END_IF;
				
				
				ABORTED_SEND_TO_QA:
				
					(* Sending shuttle to QA *)
					TargetControlParameters[1].AdvancedReleaseConfig.MoveConfigIdx := 1;
					TargetControlParameters[1].AdvancedReleaseConfig.DestinationTarget  := 4;
					TargetControlParameters[1].AdvancedReleaseConfig.Direction     := stCOM_DIR_RIGHT;
				
				
					StTargetExt_[1].ReleaseToTarget := TRUE;
				
					IF EDGENEG(StTargetExt_[1].PalletPresent) THEN
						StTargetExt_[1].SetPalletID := FALSE;
						Calibration_State := ABORTED_CALIBRATION;
					END_IF;				
						
				
					(* Reconfiguration of process *)
				CALIBRATION_END:
						
					(* Activate the timer for the state machine to go in stop mode being sure the shuttle are not moving *)
					Time_For_Stop(IN := TRUE);
						
					(* Reconfigure the process routing and flow direction in case something was changed during calibration *)
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
						

					IF Time_For_Stop.Q THEN
						//Disable the timer until we get to clearing again
						Counter_Clearing_Timeout(IN := FALSE);
						gSuperTrak.state.stateMachine.operationalState := STOPPED;
					END_IF;
			END_CASE;
		END_IF;
	END_IF;
END_ACTION
