
ACTION moveShuttle_Starting: 
		
	(* ************************************************************************** *)
	(* starting move skill if pallet is in queueing infront of Target_8 *)
	
	IF	(gSuperTrak.skill.moveShuttle[iShuttle].outputParameters.currentTarget = Target_8 AND
		gSuperTrak.skill.moveShuttle[iShuttle].inputParameters.finalTarget = Target_1) THEN
			
		gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.start := FALSE;
		gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := RUNNING;
		
	END_IF;
			
	// Set Destination Target and direction of the Shuttle, Release shuttle to Target  
			
FOR i[iShuttle] := 1 TO SUPERTRAK_TARGETS DO
			(* If there is a shuttle present at the target, which ID is the one MES wants to release,
		 and it's final target is not the target it is at, then we configure the movement and execute the release of the shuttle from the target *)
		IF StTargetExt_[i[iShuttle]].PalletPresent AND
			StTargetExt_[i[iShuttle]].PalletID = iShuttle AND
			gSuperTrak.skill.moveShuttle[iShuttle].inputParameters.finalTarget <> USINT_TO_UDINT(i[iShuttle]) THEN
										
			TargetControlParameters[i[iShuttle]].AdvancedReleaseConfig.DestinationTarget		:= UDINT_TO_USINT(gSuperTrak.skill.moveShuttle[iShuttle].inputParameters.finalTarget);
			TargetControlParameters[i[iShuttle]].AdvancedReleaseConfig.Direction				:= stCOM_DIR_RIGHT;
			
			(* If the final target is virtual target 8 or parking, the movement is set to be fast
			otherwise the movement will be slower because of the loaded shuttle *)
			IF TargetControlParameters[i[iShuttle]].AdvancedReleaseConfig.DestinationTarget = 1 OR
				TargetControlParameters[i[iShuttle]].AdvancedReleaseConfig.DestinationTarget = 8 THEN
				
				//Fast movement (See movement profiles in TrakMaster)
				TargetControlParameters[i[iShuttle]].AdvancedReleaseConfig.MoveConfigIdx := 2;
	 
			ELSE
				//Slow movement (See movement profiles in TrakMaster)
				TargetControlParameters[i[iShuttle]].AdvancedReleaseConfig.MoveConfigIdx := 1;

			END_IF;
			
			
			IF StTargetExt_[i[iShuttle]].ReleaseToTarget  AND StTargetExt_[i[iShuttle]].CommandDone THEN
				StTargetExt_[i[iShuttle]].ReleaseToTarget := FALSE;
				
			ELSE
				StTargetExt_[i[iShuttle]].ReleaseToTarget := TRUE;
				(* After release skill goes into running state *)
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := RUNNING;
			END_IF;
			
		END_IF;
			
END_FOR;

END_ACTION
