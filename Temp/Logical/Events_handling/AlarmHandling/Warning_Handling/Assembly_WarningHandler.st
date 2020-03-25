
ACTION Assembly_WarningHandler :

	
	IF Event_Code = 132 THEN //Plastic Tray empty but plastic Cup was ordered
		
		gAssemblyModule.state.stateMachine.stateTransition.abort := TRUE;	//should go to stopped
		
		Maintenance_Requested := TRUE;
		Assem_PlasticRemaining := Assem_PlasticTraySize;
		
		Plastic_Cup_Supply_Position[0] := PLASTIC_CUP_INIT_POSITION [0];
		Plastic_Cup_Supply_Position[1] := PLASTIC_CUP_INIT_POSITION [1];
		Plastic_Cup_Supply_Position[2] := PLASTIC_CUP_INIT_POSITION [2];
			
		Plastic_Cup_Supply_Above_Pos[0] := PLASTIC_CUP_INIT_POSITION [0];
		Plastic_Cup_Supply_Above_Pos[1] := PLASTIC_CUP_INIT_POSITION [1];
		Plastic_Cup_Supply_Above_Pos[2] := PLASTIC_CUP_INIT_POSITION [2] + 60;
		
		x_counter_plastic := 0;
		y_counter_plastic := 0;
		
		Paper_Cup_Supply_Position[0] := PAPER_CUP_INIT_POSITION [0];
		Paper_Cup_Supply_Position[1] := PAPER_CUP_INIT_POSITION [1];
		Paper_Cup_Supply_Position[2] := PAPER_CUP_INIT_POSITION [2];
		
		Paper_Cup_Supply_Above_Pos[0] := PAPER_CUP_INIT_POSITION [0];
		Paper_Cup_Supply_Above_Pos[1] := PAPER_CUP_INIT_POSITION [1];
		Paper_Cup_Supply_Above_Pos[2] := PAPER_CUP_INIT_POSITION [2] + 60;
		
		x_counter_plastic := 0;
		y_counter_plastic := 0;

	END_IF;

END_ACTION
