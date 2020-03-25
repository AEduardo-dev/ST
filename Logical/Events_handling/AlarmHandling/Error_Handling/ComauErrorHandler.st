
ACTION ComauerrorHandler: 
		
	IF Event_Code = 101 THEN
		
		Mp_Comau.ErrorReset := TRUE;

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
		
		IF NOT Mp_Comau.Error THEN
			Mp_Comau.ErrorReset := FALSE;
		END_IF;

	END_IF;
	
	IF Event_Code = 102 THEN  //Error in imput parameter paper cup
		gAssemblyModule.skill.provideCup.inputParameters.cupType :=0;
	END_IF;
	
	IF Event_Code = 131 //Error In Homing Procedure
		OR Event_Code = 100 THEN //Clearing Timeout
		
		Mp_Comau.ErrorReset := TRUE;
		Mp_Comau.Home := FALSE;
		HomeRobot := FALSE;
		
		IF NOT Mp_Comau.Error THEN
			Mp_Comau.ErrorReset := FALSE;
		END_IF;

	END_IF;
	
END_ACTION
