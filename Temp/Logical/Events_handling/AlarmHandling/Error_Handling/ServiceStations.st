
ACTION ServiceStations : 

	
	(* Check Door of QA Service Station *)
//	IF Last_Event_Written <> 200 AND 
//		NOT StTargetExt_[4].PalletPresent AND 
//		gSuperTrak.state.stateMachine.operationalState <> ABORTED AND
//		gSuperTrak.state.stateMachine.operationalState <> ABORTING) THEN
//		Event_Code := 200;
//		EventLog.Commands.WriteUserEvent := TRUE;
//	END_IF;
	
	
		
	(*Check Door of Lid Service Station *)
	
	
	//Check if the light barrier detects something
	
	IF (NOT ST_LightBarrier_SecurityOut1_R OR NOT ST_LightBarrier_SecurityOut2_R) AND (Last_Event_Written <> 78 AND
		gSuperTrak.state.stateMachine.operationalState <> ABORTED AND
		gSuperTrak.state.stateMachine.operationalState <> ABORTING) AND NOT Disable_Light_Barrier THEN
		Event_Code := 78;
		EventLog.Commands.WriteUserEvent := TRUE;
	END_IF;
	


END_ACTION
