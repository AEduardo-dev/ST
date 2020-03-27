
ACTION Outfeed_Running: 
	
	IF NOT Outfeed_Full AND Outfeed_Checked THEN
		(*Activate actuator movement up and wait until fully extended*)
	
		Outfeed_Actuator_UP := TRUE;
			
		Timer_Outfeed_UP(IN := TRUE, PT := T#10s);
			
		IF Timer_Outfeed_UP.Q THEN 
			Outfeed_LED_Green := TRUE;
			Outfeed_LED_Red := FALSE;
			Outfeed_LED_Blue := FALSE;
				
			Outfeed_Actuator_FRONT := TRUE;
			Timer_Outfeed_FRONT(IN:= TRUE, PT:=T#5s);
				
			IF Timer_Outfeed_FRONT.Q THEN
					
				(*Actuator go down and then we get complete*)
				Outfeed_Actuator_UP := FALSE;
				Outfeed_Actuator_FRONT := FALSE;
		
					
				IF NOT Outfeed_Actuator_UP AND NOT Outfeed_Actuator_FRONT THEN
					Outfeed_Actuator_DOWN := TRUE;
					Outfeed_Actuator_BACK := TRUE;
				END_IF;
			
				Timer_Outfeed_DOWN(IN := Outfeed_Actuator_DOWN, PT := T#10s);
				Timer_Outfeed_BACK(IN := Outfeed_Actuator_BACK, PT := T#5s);
			
				IF Timer_Outfeed_DOWN.Q AND Timer_Outfeed_BACK.Q THEN
					Timer_Outfeed_DOWN(IN := FALSE);
					Timer_Outfeed_BACK(IN := FALSE);
					Timer_Outfeed_FRONT(IN := FALSE);
					Timer_Outfeed_UP (IN := FALSE);
					gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := COMPLETING;
				END_IF;
					
			END_IF;
			
		END_IF;
	
	ELSIF NOT Outfeed_Checked THEN
		
		IF Outfeed_Full THEN
			Event_Code := 80;
			EventLog.Commands.WriteUserEvent := TRUE;	
			
		ELSE 
			Outfeed_Checked := TRUE;
		END_IF;
		
	END_IF;
	
		
	
END_ACTION
