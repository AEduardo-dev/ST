
ACTION RefillEvent: 
		
	//If a refill event is reached the module will be held, as well as the skill that detected the empty storage
	IF Event_Code = 130 THEN
		
		Assem_IgnoreSafetySensors := TRUE;
		
		IF Assem_PaperRemaining = 0 THEN
			Paper_RefillDone := FALSE;	
		END_IF;
		
		IF Assem_PlasticRemaining = 0 THEN 
			Plastic_RefillDone := FALSE;
		END_IF;
		
		
		IF gAssemblyModule.skill.provideCup.state.stateMachine.operationalState = RUNNING THEN 
			
			gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.hold := TRUE;  
			
		END_IF;
		
		IF gAssemblyModule.skill.providePellet.state.stateMachine.operationalState = RUNNING THEN
			
			gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.hold := TRUE;  
			
		END_IF;
		
		
		gAssemblyModule.state.stateMachine.stateTransition.hold := TRUE;
					
	END_IF;
	
	//After the refill is made the skills and module are unholded and so the process can continue
	IF Event_Code = 133 THEN
		
		IF gAssemblyModule.skill.provideCup.state.stateMachine.operationalState = HELD THEN 
			
			gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.unhold := TRUE;  
			
		END_IF;
		
		IF gAssemblyModule.skill.providePellet.state.stateMachine.operationalState = HELD THEN
			
			gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.unhold := TRUE;  
			
		END_IF;
		
		gAssemblyModule.state.stateMachine.stateTransition.unhold := TRUE;

	END_IF;
	
	//When everything is unholded the logger receives a message showing the process was successful 
	IF Last_Event_Written = 133 THEN
		Event_Code := 141;
		EventLog.Commands.WriteUserEvent := TRUE;
	END_IF;
	
	//Whenever the module reaches the state RUNNING again the unhold signal gets back to false
	IF gAssemblyModule.state.stateMachine.operationalState = RUNNING THEN
		
		//Assem_IgnoreSafetySensors := FALSE;	
		gAssemblyModule.state.stateMachine.stateTransition.unhold := FALSE;
		
	END_IF;
	
	IF gAssemblyModule.state.stateMachine.operationalState = HELD THEN
		
		//Assem_IgnoreSafetySensors := FALSE;	
		gAssemblyModule.state.stateMachine.stateTransition.hold := FALSE;
		
	END_IF;
	
	
	//When the refill has been completed the three refill variables will be true and the pellets will be 
	//detected by the light barrier
	IF Plastic_RefillDone AND Paper_RefillDone AND Assem_PelletPresent THEN
		Refill_Done := TRUE;
	END_IF;
	
		
	
	//If a refill event is reached the module will be held, as well as the skill that detected the empty storage
	IF Event_Code = 80 THEN
		
		IF gSuperTrak.skill.Outfeed.state.stateMachine.operationalState = RUNNING THEN 
			
			gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.hold := TRUE; 
			gSuperTrak.state.stateMachine.stateTransition.hold := TRUE;
			
		ELSIF gSuperTrak.skill.Outfeed.state.stateMachine.operationalState = HELD
			AND gSuperTrak.state.stateMachine.operationalState = HELD THEN
			
			gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.hold := FALSE; 
			gSuperTrak.state.stateMachine.stateTransition.hold := FALSE;
			
		END_IF;		
		
	END_IF;
	
	//After the refill is made the skills and module are unholded and so the process can continue
	IF Event_Code = 81 THEN
		
		IF gSuperTrak.skill.Outfeed.state.stateMachine.operationalState = HELD THEN 
			
			gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.unhold := TRUE;  
			
		END_IF;
		
		gSuperTrak.state.stateMachine.stateTransition.unhold := TRUE;

	END_IF;
	
	//Whenever the module reaches the state RUNNING again the unhold signal gets back to false
	IF gSuperTrak.state.stateMachine.operationalState = RUNNING THEN
			
		gSuperTrak.state.stateMachine.stateTransition.unhold := FALSE;
		
	END_IF;
	
	//When everything is unholded the logger receives a message showing the process was successful 
	IF Last_Event_Written = 81 THEN
		Event_Code := 84;
		EventLog.Commands.WriteUserEvent := TRUE;
	END_IF;
	
END_ACTION
