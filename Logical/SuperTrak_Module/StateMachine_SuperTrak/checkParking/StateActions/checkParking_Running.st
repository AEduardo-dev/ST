
ACTION checkParking_Running: 

	IF StTargetExt_[1].PalletPresent AND Last_Shuttle <> StTargetExt_[1].PalletID THEN
		gSuperTrak.skill.checkParking.outputParameters.shuttleId := StTargetExt_[1].PalletID;
		Last_Shuttle := StTargetExt_[1].PalletID;
		
	ELSE
		gSuperTrak.skill.checkParking.outputParameters.shuttleId  := -1;

	END_IF;
	
	
	(* After that Skill goes into completing state *)
	gSuperTrak.skill.checkParking.state.stateMachine.operationalState := COMPLETING;
	
END_ACTION
