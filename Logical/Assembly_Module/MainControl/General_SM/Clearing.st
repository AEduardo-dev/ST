ACTION Clearing: 
	
	Counter_Clearing_Timeout (IN := TRUE, PT := T#5s);
	
	IF Counter_Clearing_Timeout.Q THEN
		Event_Code := 100;
		EventLog.Commands.WriteUserEvent := TRUE;
	END_IF;
	
	CASE Clearing_Case OF 
		
		POWERON:
			
			//initialize cases
			Stopped_Case := GENERAL_STOPPED;
			provideCup_Case := CUP_SUPPLY_DECISION_CASE;
			providePellet_Case := PELLET_SUPPLY_DECISION_CASE;
			
			//set safe speed and accel and deccel as default			
			Mp_Parameters.Velocity := 1000;
			Mp_Parameters.Deceleration := 10000;
			Mp_Parameters.Acceleration := 10000;
			
			IF NOT Mp_Comau.PowerOn AND Mp_Comau.Info.ReadyToPowerOn THEN
				Mp_Comau.Power:= TRUE;
				Clearing_Case:= HOMING;	
			END_IF
		
		HOMING:
	
			IF Mp_Comau.PowerOn THEN
				
				IF DiagCpuIsSimulated() OR Home_Mode THEN
	
					FOR i:=0 TO 5 DO
						Mp_JointParameters[i].Homing.Mode := mcHOMING_DIRECT;
						
						IF i=2 THEN
							Mp_JointParameters[i].Homing.Position := -90;
						ELSE
							Mp_JointParameters[i].Homing.Position := 0;
						END_IF
					END_FOR
				
				ELSE
					
					FOR i:=0 TO 5 DO
						Mp_JointParameters[i].Homing.Mode := mcHOMING_DEFAULT;
					END_FOR
					
				END_IF
				
				Mp_Comau.Home := TRUE;
				Clearing_Case:= EXIT_CLEARING;
				
			END_IF
			
		EXIT_CLEARING:
			
			IF Mp_Comau.IsHomed AND Mp_Comau.PowerOn AND NOT Mp_Comau.CommandBusy THEN
	
				Mp_Comau.Home := FALSE;
				Home_Mode := FALSE;
				gAssemblyModule.state.stateMachine.operationalState := STOPPED;
				Clearing_Case:= POWERON;
				Comau_Gripper := FALSE;
				//Disable timer count until next clearing
				IF Counter_Clearing_Timeout.IN THEN
					Counter_Clearing_Timeout (IN := FALSE);
				END_IF;
				
			END_IF
		
	END_CASE
	
END_ACTION