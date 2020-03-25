
ACTION moveShuttle_Running: 
(* SuperTrak searchs for Shuttles at each target, and if it has arrived to the destination then we update the current target and
	the skill jumps	into completing *)
	
	FOR i[iShuttle] := 1 TO SUPERTRAK_TARGETS DO
		
		//In case there was an error and the release to target parameter is not set we set it and retry
//		IF StTargetExt_[i[iShuttle]].PalletPresent AND
//			StTargetExt_[i[iShuttle]].PalletID = iShuttle AND
//			gSuperTrak.skill.moveShuttle[iShuttle].outputParameters.currentTarget = i[iShuttle] THEN
//
//			IF NOT StTargetExt_[i[iShuttle]].ReleaseToTarget THEN
//				StTargetExt_[i[iShuttle]].ReleaseToTarget := TRUE;
//			END_IF;
//				
//		END_IF;
		
		//If the shuttle reaches destination
		IF StTargetExt_[i[iShuttle]].PalletPresent AND
			StTargetExt_[i[iShuttle]].PalletID = iShuttle AND
			gSuperTrak.skill.moveShuttle[iShuttle].inputParameters.finalTarget = USINT_TO_UDINT(i[iShuttle]) THEN
			
			IF gSuperTrak.skill.moveShuttle[iShuttle].inputParameters.finalTarget = 8
				AND gSuperTrak.skill.moveShuttle[iShuttle].outputParameters.currentTarget = 7 
				AND Set_Info_Messages THEN

				Event_Code := 41 + iShuttle;
				EventLog.Commands.WriteUserEvent := TRUE;
				
			END_IF;
			
			gSuperTrak.skill.moveShuttle[iShuttle].outputParameters.currentTarget := i[iShuttle];					
			gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := COMPLETING;
								
		END_IF;
		
	END_FOR;
END_ACTION
