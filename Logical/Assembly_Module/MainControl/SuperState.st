
ACTION SuperState: 
	
	
(*************************************************************************************************)	
(*Lifebit*) 
(*************************************************************************************************)
	(* If the flag is set the code can be simulated wothout the lifebit taken into account *)
	IF NOT Life_Bit_Ignore THEN
		
		IF gAssemblyModule.lifeBit.lifeBitAck THEN
			
			gAssemblyModule.lifeBit.lifeBitAck := FALSE;
			TON_AssemblyLifeBit(IN := FALSE);
			TON_AssemblyLifeBit(IN := TRUE, PT := LIFEBIT_TIMEOUT);
			
		ELSIF NOT gAssemblyModule.lifeBit.lifeBitAck AND
					
			TON_AssemblyLifeBit.ET >= LIFEBIT_TIMEOUT THEN
			Event_Code := 104;
			EventLog.Commands.WriteUserEvent := TRUE;		
			TON_AssemblyLifeBit(IN := FALSE);
			
		END_IF;
		
		TON_AssemblyLifeBit();
		
	END_IF;
	
	(*************************************************************************************************)
	
	//call axis and comau configuration FBs
	FOR i:=0 TO 5 DO
		Mp_Joint[i]();
	END_FOR	
	
	Mp_Comau();

	//Push Emergency Button Case (only way to know if its pressed)
	IF NOT Mp_Comau.Info.ReadyToPowerOn THEN
		Event_Code := 200; 
		EventLog.Commands.WriteUserEvent := TRUE;
	END_IF

	//MAINTENANCE REQUESTED		
	//First it will finish the completing and then it will enter in this mode
	IF (gAssemblyModule.skill.goHome.state.stateMachine.operationalState = COMPLETING OR
		gAssemblyModule.skill.provideCup.state.stateMachine.operationalState = COMPLETING OR 
		gAssemblyModule.skill.providePellet.state.stateMachine.operationalState = COMPLETING) AND
		Maintenance_Requested THEN
		
		Stopped_Case := MAINTENANCE_STOPPED;
		Maintenance_Requested := FALSE;
		gAssemblyModule.state.stateMachine.stateTransition.stop := TRUE;
		
		//generate warning message
		Event_Code := 200; 
		EventLog.Commands.WriteUserEvent := TRUE;
		
	END_IF
	
	//Illegal position in the cup tray, should be AND (still to find out the error code)
	IF (Mp_Comau.Error OR Mp_Comau.StatusID = 1111111) 
		AND (gAssemblyModule.skill.provideCup.state.stateMachine.operationalState = RUNNING) THEN
		Event_Code := 101; 
		EventLog.Commands.WriteUserEvent := TRUE;
	END_IF
	
	//Error in Homing Procedure
	IF (Mp_Comau.Error OR Mp_Comau.StatusID = -1067211008) THEN
		Event_Code := 131; 
		EventLog.Commands.WriteUserEvent := TRUE;
	END_IF
	
	//Errors of illegally opening doors or drawers 
	IF gAssemblyModule.state.stateMachine.operationalState <> ABORTED AND
		NOT Assem_IgnoreSafetySensors THEN
		
		IF NOT Assem_LeftDoorSensor OR NOT Assem_RightDoorSensor THEN
			Event_Code := 140; 
			EventLog.Commands.WriteUserEvent := TRUE;
		END_IF
		
		IF gAssemblyModule.state.stateMachine.operationalState <> HELD OR 
			gAssemblyModule.state.stateMachine.operationalState <> UNHOLDING THEN
			
			IF TON_DrawerAlarm.Q AND NOT Assem_PlasticCupsDrawer THEN
				Event_Code := 144; 
				EventLog.Commands.WriteUserEvent := TRUE;
			END_IF;
		
			IF TON_DrawerAlarm.Q AND NOT Assem_PaperCupsDrawer THEN
				Event_Code := 145; 
				EventLog.Commands.WriteUserEvent := TRUE;
			END_IF;
		END_IF;
		
		
	END_IF
	
	
	TON_DrawerAlarm(IN := Assem_PlasticCupsDrawer OR Assem_PaperCupsDrawer, PT := T#1s);
	
END_ACTION
