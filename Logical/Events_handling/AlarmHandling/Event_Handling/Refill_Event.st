
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
	
	//If a refill event is reached the module will be held, as well as the skill that detected the empty storage
	IF Event_Code = 133 THEN
		
		IF gAssemblyModule.skill.provideCup.state.stateMachine.operationalState = HELD THEN 
			
			gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.unhold := TRUE;  
			
		END_IF;
		
		IF gAssemblyModule.skill.providePellet.state.stateMachine.operationalState = HELD THEN
			
			gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.unhold := TRUE;  
			
		END_IF;
		
		
		gAssemblyModule.state.stateMachine.stateTransition.unhold := TRUE;

	END_IF;
	
	IF Last_Event_Written = 133 THEN
		Event_Code := 141;
		EventLog.Commands.WriteUserEvent := TRUE;
	END_IF;
	
	IF gAssemblyModule.state.stateMachine.operationalState = RUNNING THEN
		
		//Assem_IgnoreSafetySensors := FALSE;	
		gAssemblyModule.state.stateMachine.stateTransition.unhold := FALSE;
		
	END_IF;
	
	//When the refill has been completed the three refill variables will be true and the pellets will be 
	//detected by the light barrier
	IF Plastic_RefillDone AND Paper_RefillDone AND Assem_PelletPresent THEN
		Refill_Done := TRUE;
	END_IF;
	
END_ACTION
