
ACTION providePellet_Running:
	
	IF NOT Assem_PelletPresent AND NOT Checked THEN
		Event_Code := 130;
		EventLog.Commands.WriteUserEvent := TRUE;
		
	ELSIF Checked THEN
		CASE providePellet_Case OF
				
			PELLET_SUPPLY_DECISION_CASE:
			
				//			IF gAssemblyModule.skill.providePellet.inputParameters.pelletType = 1 THEN	// 1 = Small Pellet
				//				providePellet_Case := Pellet_Supply_Small_Case;
				//			ELSIF gAssemblyModule.skill.providePellet.inputParameters.pelletType = 2 THEN	//2 = Big Pellet
				//				providePellet_Case := Pellet_Supply_Big_Case;
				//			ELSE 
				//				providePellet_Case := Pellet_Supply_Final_Case;
				//			END_IF;
				providePellet_Case := PLTSUP_INTERMPOS1_CASE;
			
			PLTSUP_INTERMPOS1_CASE:
				
				Mp_Parameters.Position := Small_Pellet_Intermediate1_Pos;
				Mp_Comau.MoveDirect :=TRUE;
			
				IF Mp_Comau.MoveDone THEN
					Mp_Comau.MoveDirect := FALSE;
					providePellet_Case := PLTSUP_INTERMPOS2_CASE;
				END_IF
			
			PLTSUP_INTERMPOS2_CASE:
				
				Mp_Parameters.Position := Small_Pellet_Intermediate2_Pos;
				Mp_Comau.MoveDirect :=TRUE;
			
				IF Mp_Comau.MoveDone THEN
					Mp_Comau.MoveDirect := FALSE;
					providePellet_Case := PELLET_SUPPLY_BEFORE_SMALL_CASE;
				END_IF
				
			PELLET_SUPPLY_BEFORE_SMALL_CASE:
				
				Mp_Parameters.Position := Small_Pellet_Supply_Pos_Before;
				Mp_Comau.MoveDirect :=TRUE;
			
				IF Mp_Comau.MoveDone THEN
					Mp_Comau.MoveDirect := FALSE;
					providePellet_Case := PELLET_SUPPLY_SMALL_CASE;
				END_IF
			
			PELLET_SUPPLY_SMALL_CASE:

				Mp_Parameters.Position := Small_Pellet_Supply_Pos;
				Mp_Comau.MoveLinear :=TRUE;
				Comau_Gripper := TRUE;
				IF Mp_Comau.MoveDone THEN
					Mp_Comau.MoveLinear := FALSE;
					providePellet_Case := PELLET_SUPPLY_TIMER_CASE;	
				END_IF
		
			PELLET_SUPPLY_TIMER_CASE:
									
				Counter_GrabbingPellets_Timeout(IN := TRUE, PT := T#0.5s);
	
				//If the clearing takes more time than expected the supertrak goes into aborted
				IF Counter_GrabbingPellets_Timeout.Q THEN
					Counter_GrabbingPellets_Timeout(IN := FALSE);
					providePellet_Case := PELLET_SUPPLY_BIG_CASE;
				END_IF;
	
			PELLET_SUPPLY_BIG_CASE:
			
				Mp_Parameters.Position := Small_Pellet_Supply_Pos_Before;
				Mp_Comau.MoveLinear :=TRUE;
			
				IF Mp_Comau.MoveDone THEN
					Mp_Comau.MoveLinear := FALSE;
					providePellet_Case := PLTSUP_INTERMPOS2END_CASE;	
				END_IF
			
			PLTSUP_INTERMPOS2END_CASE:
				
				Mp_Parameters.Position := Small_Pellet_Intermediate2_Pos;
				Mp_Comau.MoveDirect :=TRUE;
			
				IF Mp_Comau.MoveDone THEN
					Mp_Comau.MoveDirect := FALSE;
					providePellet_Case := PLTSUP_INTERMPOS1END_CASE;
				END_IF
			
			PLTSUP_INTERMPOS1END_CASE:
				
				Mp_Parameters.Position := Small_Pellet_Intermediate1_Pos;
				Mp_Comau.MoveDirect :=TRUE;
			
				IF Mp_Comau.MoveDone THEN
					Mp_Comau.MoveDirect := FALSE;
					providePellet_Case := PELLET_SUPPLY_FINAL_CASE;
				END_IF

			PELLET_SUPPLY_FINAL_CASE:
			
				Mp_Parameters.Position := Supertrak_Above_Position;
				Mp_Comau.MoveDirect :=TRUE;
			
				IF Mp_Comau.MoveDone THEN
					Mp_Comau.MoveDirect := FALSE;
					Comau_Gripper := FALSE;
					providePellet_Case := PELLET_SUPPLY_FINAL_CASE1;	
				END_IF	
			
			PELLET_SUPPLY_FINAL_CASE1:
		
				Mp_Parameters.Position := Home_Position;
				Mp_Comau.MoveDirect :=TRUE;
			
				IF Mp_Comau.MoveDone THEN
					Mp_Comau.MoveDirect := FALSE;
					gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := COMPLETING;
				END_IF;	

		END_CASE;
	ELSE
		Checked := TRUE;
	END_IF;	
	
END_ACTION
