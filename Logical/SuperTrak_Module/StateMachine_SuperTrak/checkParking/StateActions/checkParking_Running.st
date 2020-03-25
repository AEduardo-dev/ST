
ACTION checkParking_Running: 
	
//	FOR j := 1 TO 6 DO
//		
//		IF gSuperTrak.skill.moveShuttle[j].outputParameters.currentTarget = 1 AND 
//			 gSuperTrak.skill.moveShuttle[j].inputParameters.finalTarget = 8 THEN
//			
//			
//			shuttleCounter := shuttleCounter + 1;
//			
//		END_IF;
//		
//		IF shuttleCounter = 1 THEN
//			
//			Last_Shuttle := -1;	
//			
//		END_IF;
//		
//	END_FOR;
//	
//	shuttleCounter := 0;
	
	(* If there is a Shuttle at parking position the supertrak reads and returns the ID to the MES,
	if there is no shuttle the returned value is -1 *)


	IF StTargetExt_[1].PalletPresent AND Last_Shuttle <> StTargetExt_[1].PalletID THEN
		gSuperTrak.skill.checkParking.outputParameters.shuttleId := StTargetExt_[1].PalletID;
		Last_Shuttle := StTargetExt_[1].PalletID;
		//		check_Parking_Timeout(IN := FALSE, PT:= T#5s);
	ELSE
		gSuperTrak.skill.checkParking.outputParameters.shuttleId  := -1;
//		check_Parking_Timeout(IN := TRUE, PT:= T#5s);

	END_IF;
	
	(* If we timeout then the las shuttle is forgotten *)
//	IF check_Parking_Timeout.Q THEN
//		Last_Shuttle := 0;
//	END_IF;
	
	(* After that Skill goes into completing state *)
	gSuperTrak.skill.checkParking.state.stateMachine.operationalState := COMPLETING;
	
END_ACTION
