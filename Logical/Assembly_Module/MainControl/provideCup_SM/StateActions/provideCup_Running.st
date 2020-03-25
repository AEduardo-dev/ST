
ACTION provideCup_Running:
	
	IF (Assem_PaperRemaining = 0 AND gAssemblyModule.skill.provideCup.inputParameters.cupType = 1 ) AND NOT Checked THEN
		Event_Code := 130;
		EventLog.Commands.WriteUserEvent := TRUE;
		
	ELSIF (Assem_PlasticRemaining = 0 AND gAssemblyModule.skill.provideCup.inputParameters.cupType = 2 ) AND NOT Checked THEN
		Event_Code := 130;
		EventLog.Commands.WriteUserEvent := TRUE;
			
	ELSIF Checked THEN
		CASE provideCup_Case OF
		
			CUP_SUPPLY_DECISION_CASE:
			
				IF  gAssemblyModule.skill.provideCup.inputParameters.cupType = 1 THEN	// 1 = Paper

					IF Assem_PaperRemaining > 0 THEN
						provideCup_Case := PAPER_CUP_SAFE_POSITION_CASE;
					ELSE
						provideCup_Case := CUP_SUPPLY_FINAL_CASE1;
						Event_Code := 132;
						EventLog.Commands.WriteUserEvent := TRUE;
					END_IF
	
				ELSIF gAssemblyModule.skill.provideCup.inputParameters.cupType = 2 THEN	// 2 = Plastic
				
					IF Assem_PlasticRemaining > 0 THEN
						provideCup_Case := PLASTIC_CUP_SAFE_POSITION_CASE;
					ELSE
						provideCup_Case := CUP_SUPPLY_FINAL_CASE1;
						Event_Code := 132;
						EventLog.Commands.WriteUserEvent := TRUE;
					END_IF
				
				ELSE
				
					provideCup_Case := CUP_SUPPLY_FINAL_CASE1;
				
				END_IF;

				////////////////////////////////////////////////////////////////////////////////////////////////////
			
			PLASTIC_CUP_SAFE_POSITION_CASE:
			
				Mp_Parameters.Position := Plastic_Cup_Safe_Pos;
				Mp_Comau.MoveLinear :=TRUE;		
				IF Mp_Comau.MoveDone THEN
					Mp_Comau.MoveLinear := FALSE;
					provideCup_Case := PLASTIC_CUP_ABOVE_POSITION_CASE;
				END_IF;
		
			PLASTIC_CUP_ABOVE_POSITION_CASE:

				Mp_Parameters.Position := Plastic_Cup_Supply_Above_Pos;
				Mp_Comau.MoveLinear :=TRUE;
				IF Mp_Comau.MoveDone THEN
					Mp_Comau.MoveLinear := FALSE;
					provideCup_Case := PLASTIC_CUP_POSITION_CASE;
				END_IF;
		
			PLASTIC_CUP_POSITION_CASE:
			
				Mp_Parameters.Position := Plastic_Cup_Supply_Position;
				Mp_Comau.MoveLinear := TRUE;
			
				IF Mp_Comau.MoveDone THEN
					Mp_Comau.MoveLinear := FALSE;
					Comau_Gripper := TRUE;		
					provideCup_Case := PLASTIC_CUP_TIMER_CASE;
				END_IF;
			
			PLASTIC_CUP_TIMER_CASE:
									
				Counter_GrabbingCups_Timeout(IN := TRUE, PT := T#0.5s);
	
				//If the clearing takes more time than expected the supertrak goes into aborted
				IF Counter_GrabbingCups_Timeout.Q THEN
					Counter_GrabbingCups_Timeout(IN := FALSE);
					provideCup_Case := PLASTIC_CUP_ABOVE_POSITION_CASE1;
				END_IF;
		
			PLASTIC_CUP_ABOVE_POSITION_CASE1:
			
				Mp_Parameters.Position := Plastic_Cup_Supply_Above_Pos;
				Mp_Comau.MoveLinear := TRUE;
				IF Mp_Comau.MoveDone THEN
					Mp_Comau.MoveLinear := FALSE;
					provideCup_Case := PLASTIC_CUP_SAFE_POSITION_CASE1;
				END_IF;
		
			PLASTIC_CUP_SAFE_POSITION_CASE1:
			
				Mp_Parameters.Position := Plastic_Cup_Safe_Pos;
				Mp_Comau.MoveLinear := TRUE;
				IF Mp_Comau.MoveDone THEN
					Mp_Comau.MoveLinear := FALSE;
					provideCup_Case := SUPERTRAK_ABOVE_POSITION_CASE;
				END_IF;
			
				//////////////////////////////////////////////////////////////////////////////////////////////////
			
			PAPER_CUP_SAFE_POSITION_CASE:
			
				Mp_Parameters.Position := Paper_Cup_Safe_Pos;
				Mp_Comau.MoveLinear :=TRUE;
				IF Mp_Comau.MoveDone THEN
					Mp_Comau.MoveLinear := FALSE;
					provideCup_Case := PAPER_CUP_ABOVE_POSITION_CASE;
				END_IF;
		
			PAPER_CUP_ABOVE_POSITION_CASE:
			
				Mp_Parameters.Position := Paper_Cup_Supply_Above_Pos;
				Mp_Comau.MoveLinear :=TRUE;
				IF Mp_Comau.MoveDone THEN
					Mp_Comau.MoveLinear := FALSE;
					Comau_Gripper := TRUE;		
					provideCup_Case := PAPER_CUP_POSITION_CASE;
				END_IF;
		
			PAPER_CUP_POSITION_CASE:
			
				Mp_Parameters.Position := Paper_Cup_Supply_Position;
				Mp_Comau.MoveLinear := TRUE;
				IF Mp_Comau.MoveDone THEN
					Mp_Comau.MoveLinear := FALSE;
					provideCup_Case := PAPER_CUP_TIMER_CASE;
				END_IF;
			
			PAPER_CUP_TIMER_CASE:
									
				Counter_GrabbingCups_Timeout(IN := TRUE, PT := T#0.5s);
	
				//If the clearing takes more time than expected the supertrak goes into aborted
				IF Counter_GrabbingCups_Timeout.Q THEN
					Counter_GrabbingCups_Timeout(IN := FALSE);
					provideCup_Case := PAPER_CUP_ABOVE_POSITION_CASE1;
				END_IF;
		
			PAPER_CUP_ABOVE_POSITION_CASE1:
			
				Mp_Parameters.Position := Paper_Cup_Supply_Above_Pos;
				Mp_Comau.MoveLinear := TRUE;
				IF Mp_Comau.MoveDone THEN
					Mp_Comau.MoveLinear := FALSE;
					provideCup_Case := PAPER_CUP_SAFE_POSITION_CASE1;
				END_IF;
		
			PAPER_CUP_SAFE_POSITION_CASE1:
			
				Mp_Parameters.Position := Paper_Cup_Safe_Pos;
				Mp_Comau.MoveLinear := TRUE;
				IF Mp_Comau.MoveDone THEN
					Mp_Comau.MoveLinear := FALSE;
					provideCup_Case := SUPERTRAK_ABOVE_POSITION_CASE;
				END_IF;
			
				/////////////////////////////////////////////////////////////////////////////////////////////////////////////
			
			SUPERTRAK_ABOVE_POSITION_CASE:
			
				Mp_Parameters.Position := Supertrak_Above_Position;
				Mp_Comau.MoveLinear := TRUE;
				IF Mp_Comau.MoveDone THEN
					Mp_Comau.MoveLinear := FALSE;
					provideCup_Case := SUPERTRAK_POSITION_CASE;
				END_IF;	
				
			SUPERTRAK_POSITION_CASE:
			
				Mp_Parameters.Position := Supertrak_Position;
				Mp_Comau.MoveLinear := TRUE;
				IF Mp_Comau.MoveDone THEN
					Mp_Comau.MoveLinear := FALSE;
					Comau_Gripper := FALSE;								//IP variable
					provideCup_Case := SUPERTRAK_TIMER_CASE;
				END_IF;
		
			SUPERTRAK_TIMER_CASE:
									
				Counter_LeavingCups_Timeout(IN := TRUE, PT := T#0.5s);
	
				//If the clearing takes more time than expected the supertrak goes into aborted
				IF Counter_LeavingCups_Timeout.Q THEN
					Counter_LeavingCups_Timeout(IN := FALSE);
					provideCup_Case := SUPERTRAK_ABOVE_POSITION_CASE1;
				END_IF;
		
			SUPERTRAK_ABOVE_POSITION_CASE1:
			
				Mp_Parameters.Position := Supertrak_Above_Position;
				Mp_Comau.MoveLinear := TRUE;
				IF Mp_Comau.MoveDone THEN
					Mp_Comau.MoveLinear := FALSE;
					provideCup_Case := SAFE_POSITION_CASE;
				END_IF;	
			
			SAFE_POSITION_CASE:
		
				Mp_Parameters.Position := Home_Position;
				Mp_Comau.MoveLinear:=TRUE;
				IF Mp_Comau.MoveDone THEN
					Mp_Comau.MoveLinear := FALSE;
					provideCup_Case := CUP_SUPPLY_FINAL_CASE;
				END_IF;
			
			CUP_SUPPLY_FINAL_CASE:
			
				IF  gAssemblyModule.skill.provideCup.inputParameters.cupType = 1 THEN	// 1 = Paper
					F_Paper_Update_Positions(
						PAPER_CUP_INIT_POSITION,
						PAPER_TRAY_ORIENTATION,
						DIST_X_PAPER_CENTR_SAME_ROW,
						DIST_X_PAPER_CENTR_DIFF_ROW,
						DIST_Y_PAPER_CENTR,
						Paper_Cup_Supply_Above_Pos, 
						Paper_Cup_Supply_Position, 
						x_counter_paper, 
						y_counter_paper, 
						Assem_PaperRemaining);	
				ELSIF gAssemblyModule.skill.provideCup.inputParameters.cupType = 2 THEN	// 2 = Plastic
					F_Plastic_Update_Positions( 
						PLASTIC_CUP_INIT_POSITION, 
						PLASTIC_TRAY_ORIENTATION,
						DIST_X_PLASTIC_CENTR_SAME_ROW,
						DIST_X_PLASTIC_CENTR_DIFF_ROW,
						DIST_Y_PLASTIC_CENTR,
						Plastic_Cup_Supply_Above_Pos, 
						Plastic_Cup_Supply_Position, 
						x_counter_plastic, 
						y_counter_plastic, 
						Assem_PlasticRemaining);
				END_IF
		
			
				provideCup_Case := CUP_SUPPLY_FINAL_CASE1;
			
			CUP_SUPPLY_FINAL_CASE1:
			
				gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := COMPLETING;
				//provideCup_Case := Cup_Supply_Decision_Case;
			
			ELSE
				;	
			
		END_CASE;
	ELSE
		Checked := TRUE;
	END_IF;	
	
	
END_ACTION
