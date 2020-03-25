
ACTION Running: 

	(* For each of the skills we check if there is an STOPPED state *)
	FOR j := 1 TO SUPERTRAK_SHUTTLES DO
		IF gSuperTrak.skill.moveShuttle[j].state.stateMachine.operationalState = STOPPED THEN
			
			Timer_Send_Super_Trak_In_Stop(IN := TRUE, PT := T#2s);
			
			IF Timer_Send_Super_Trak_In_Stop.Q = TRUE THEN
				Timer_Send_Super_Trak_In_Stop(IN := FALSE);
				
				Event_Code := 82;
				EventLog.Commands.WriteUserEvent := TRUE;
				
				gSuperTrak.state.stateMachine.stateTransition.stop := TRUE;
								
			END_IF;
		END_IF;
	END_FOR;
	
	(* If not we wait for the pause trigger *)
	IF	gSuperTrak.state.stateMachine.stateTransition.pause THEN
		gSuperTrak.state.stateMachine.operationalState := PAUSING;
	END_IF;
		
	Timer_Send_Super_Trak_In_Stop();
END_ACTION
