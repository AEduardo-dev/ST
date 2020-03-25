
ACTION Aborted: 

	(* Reset MessageSum *) 
	transitionFromAborted := TRUE;
	(* Checking all errors for TRUE State --> If: SumCritical is TRUE, if not: SumCritical is FALSE *)
	Timer_Actuator_DOWN (IN:= FALSE);
	Timer_Actuator_UP (IN:= FALSE);
	
	Skills_Aborted := 0;
	
	IF gSuperTrak.state.stateMachine.stateTransition.clear THEN
		
		IF NOT SumCritical THEN		
			gSuperTrak.state.stateMachine.operationalState := CLEARING;
			
		ELSE
			Event_Code := 83;
			EventLog.Commands.WriteUserEvent := TRUE;			
		END_IF;	
	END_IF;
END_ACTION
