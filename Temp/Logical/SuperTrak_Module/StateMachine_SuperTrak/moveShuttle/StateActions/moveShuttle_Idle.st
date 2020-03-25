
ACTION moveShuttle_Idle: 
	
	(* If movement is from target 8 to target 1 the supertrak triggers start for the skill *)
	IF gSuperTrak.skill.moveShuttle[iShuttle].outputParameters.currentTarget = Target_8 THEN
		gSuperTrak.skill.moveShuttle[iShuttle].inputParameters.finalTarget := Target_1;
		gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.start := TRUE;
	END_IF;

	IF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.start THEN
		
		(* Check if final target exists on SuperTrak *)
		IF gSuperTrak.skill.moveShuttle[iShuttle].inputParameters.finalTarget > SUPERTRAK_TARGETS 
			OR gSuperTrak.skill.moveShuttle[iShuttle].inputParameters.finalTarget < Target_1 THEN
		
			Event_Code := 29 + iShuttle;
			EventLog.Commands.WriteUserEvent := TRUE;
		
			(* Check if final Target equal current Target *)
		ELSIF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.start AND 
			gSuperTrak.skill.moveShuttle[iShuttle].inputParameters.finalTarget = gSuperTrak.skill.moveShuttle[iShuttle].outputParameters.currentTarget THEN
		
			Event_Code := 53 + iShuttle;
			EventLog.Commands.WriteUserEvent := TRUE;
		//If everything ois ok we change state	
		ELSE
			gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := STARTING;
		
		END_IF;
		
		
	
	END_IF;
	
END_ACTION
