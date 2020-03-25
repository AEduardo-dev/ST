ACTION Stopped: 
	
	CASE Stopped_Case OF
		
		GENERAL_STOPPED:
			
			IF gAssemblyModule.state.stateMachine.stateTransition.reset THEN
				
				gAssemblyModule.state.stateMachine.operationalState := RESETTING;	
			
			END_IF;	
			
			IF HomeRobot THEN
				Stopped_Case := HOMING_STOPPED;
			END_IF
			
		HOMING_STOPPED:
			
			IF DiagCpuIsSimulated() OR  Home_Mode THEN
	
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
			Stopped_Case := EXIT_HOMING_STOPPED;
			
		EXIT_HOMING_STOPPED:

			IF Mp_Comau.IsHomed AND NOT Mp_Comau.CommandBusy THEN	
				Mp_Comau.Home := FALSE;
				Home_Mode := FALSE;
				HomeRobot := FALSE;
				Stopped_Case := GENERAL_STOPPED;
			END_IF
				
//		MAINTENANCE_STOPPED:	
//				
//			IF  Assem_PaperTray_Refill_Button THEN
//				Paper_Cups_Remaining := 20;
//			END_IF
//				
//			IF Assem_PlasticTray_Refill_Button THEN
//				Plastic_Cups_Remaining := 20;
//				//put position 1 of the trays
//			END_IF	
//			
//			IF Maintenance_Done THEN
//				Maintenance_Done := FALSE;
//				Stopped_Case := GENERAL_STOPPED;
//				gAssemblyModule.state.stateMachine.operationalState := RESETTING;	
//			END_IF	
				
	END_CASE
	
END_ACTION

