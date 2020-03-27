
ACTION Held: 
	
	IF NOT Outfeed_Full THEN
	
		TON_Restore_Outfeed(IN := TRUE, PT := T#10s);
		
		IF TON_Restore_Outfeed.Q THEN
		
			Event_Code := 81;
			EventLog.Commands.WriteUserEvent := TRUE;
			
		END_IF;		
		
	END_IF;
	
	
	
	
	
	IF gSuperTrak.state.stateMachine.stateTransition.unhold THEN
		TON_Restore_Outfeed(IN := FALSE);
		gSuperTrak.state.stateMachine.operationalState := UNHOLDING;
		
	END_IF;

END_ACTION
