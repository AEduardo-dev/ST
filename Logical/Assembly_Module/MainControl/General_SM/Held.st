
ACTION Held:
	
	//Unlock the doors for the refill process
	IF Assem_PaperLock OR Assem_PlasticLock AND NOT Refill_Done THEN
		Assem_PlasticLock := FALSE;
		Assem_PaperLock := FALSE;
	END_IF;
	
	IF  TON_PlasticDrawer.Q THEN
		Assem_PlasticRemaining := Assem_PlasticTraySize;
		Plastic_RefillDone := TRUE;
	END_IF;

	IF TON_PaperDrawer.Q THEN
		Assem_PaperRemaining := Assem_PaperTraySize;	
		Paper_RefillDone := TRUE;
	END_IF;
		
	IF Refill_Done THEN
		Assem_PlasticLock := TRUE;
		Assem_PaperLock := TRUE;
	END_IF;
	
	//If everything is closed
	IF Assem_LeftDoorSensor AND Assem_RightDoorSensor AND Assem_PlasticCupsDrawer AND Assem_PaperCupsDrawer 
		AND TON_LocksSensor.Q THEN
		
		Event_Code := 133;
		EventLog.Commands.WriteUserEvent := TRUE;
		//Reset variables to original state
		Refill_Done := FALSE;
		gAssemblyModule.state.stateMachine.operationalState := UNHOLDING;
	END_IF;
	
	TON_PlasticDrawer(IN := NOT Assem_PlasticCupsDrawer, PT := T#3s);
	TON_PaperDrawer(IN := NOT Assem_PaperCupsDrawer, PT := T#3s);
	TON_LocksSensor(IN := Assem_PaperLock AND Assem_PlasticLock, PT := T#2s);
	

	
END_ACTION
