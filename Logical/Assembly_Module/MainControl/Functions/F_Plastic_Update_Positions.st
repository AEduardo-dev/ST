FUNCTION F_Plastic_Update_Positions
	
	
	IF (y_counter_plastic = 0) AND (x_counter_plastic < 4) THEN //this raw has only 5 cups
			
		x_counter_plastic := x_counter_plastic + 1;
		Plastic_Cup_Supply_Above_Pos[0] := PLASTIC_CUP_INIT_POSITION [0] - DIST_X_PLASTIC_CENTR_SAME_ROW * x_counter_plastic * COS(PLASTIC_TRAY_ORIENTATION);
		Plastic_Cup_Supply_Position[0] := PLASTIC_CUP_INIT_POSITION [0] - DIST_X_PLASTIC_CENTR_SAME_ROW * x_counter_plastic * COS(PLASTIC_TRAY_ORIENTATION);
		Plastic_Cup_Supply_Above_Pos[1] := PLASTIC_CUP_INIT_POSITION [1] - DIST_Y_PLASTIC_CENTR * y_counter_plastic;
		Plastic_Cup_Supply_Position[1] := PLASTIC_CUP_INIT_POSITION [1] - DIST_Y_PLASTIC_CENTR * y_counter_plastic;
		Plastic_Cups_Remaining := Plastic_Cups_Remaining -1;
		RETURN;
	ELSIF (y_counter_plastic = 0) AND (x_counter_plastic = 4) THEN //this raw has only 5 cups last case
		x_counter_plastic := 0;
		y_counter_plastic := 1;
		Plastic_Cup_Supply_Above_Pos[0] := PLASTIC_CUP_INIT_POSITION [0] - DIST_X_PLASTIC_CENTR_SAME_ROW * x_counter_plastic * COS(PLASTIC_TRAY_ORIENTATION) -50 +200;
		Plastic_Cup_Supply_Position[0] := PLASTIC_CUP_INIT_POSITION [0] - DIST_X_PLASTIC_CENTR_SAME_ROW * x_counter_plastic * COS(PLASTIC_TRAY_ORIENTATION) -50 +200;
		Plastic_Cup_Supply_Above_Pos[1] := PLASTIC_CUP_INIT_POSITION [1] - DIST_Y_PLASTIC_CENTR * y_counter_plastic;
		Plastic_Cup_Supply_Position[1] := PLASTIC_CUP_INIT_POSITION [1] - DIST_Y_PLASTIC_CENTR * y_counter_plastic;
		Plastic_Cups_Remaining := Plastic_Cups_Remaining -1;
		RETURN;
	END_IF
	
	IF (y_counter_plastic = 1) AND (x_counter_plastic < 7) THEN
			
		x_counter_plastic := x_counter_plastic + 1;
		Plastic_Cup_Supply_Above_Pos[0] := PLASTIC_CUP_INIT_POSITION [0] - DIST_X_PLASTIC_CENTR_SAME_ROW * x_counter_plastic * COS(PLASTIC_TRAY_ORIENTATION) -50 +200;
		Plastic_Cup_Supply_Position[0] := PLASTIC_CUP_INIT_POSITION [0] - DIST_X_PLASTIC_CENTR_SAME_ROW * x_counter_plastic * COS(PLASTIC_TRAY_ORIENTATION) -50 +200;
		Plastic_Cup_Supply_Above_Pos[1] := PLASTIC_CUP_INIT_POSITION [1] - DIST_Y_PLASTIC_CENTR * y_counter_plastic;
		Plastic_Cup_Supply_Position[1] := PLASTIC_CUP_INIT_POSITION [1] - DIST_Y_PLASTIC_CENTR * y_counter_plastic;
		Plastic_Cups_Remaining := Plastic_Cups_Remaining -1;
		RETURN;
	ELSIF (y_counter_plastic = 1) AND (x_counter_plastic = 7) THEN //this raw has only 5 cups last case
		x_counter_plastic := 0;
		y_counter_plastic := 2;
		Plastic_Cup_Supply_Above_Pos[0] := PLASTIC_CUP_INIT_POSITION [0] - DIST_X_PLASTIC_CENTR_SAME_ROW * x_counter_plastic * COS(PLASTIC_TRAY_ORIENTATION) +200;
		Plastic_Cup_Supply_Position[0] := PLASTIC_CUP_INIT_POSITION [0] - DIST_X_PLASTIC_CENTR_SAME_ROW * x_counter_plastic * COS(PLASTIC_TRAY_ORIENTATION) +200;
		Plastic_Cup_Supply_Above_Pos[1] := PLASTIC_CUP_INIT_POSITION [1] - DIST_Y_PLASTIC_CENTR * y_counter_plastic;
		Plastic_Cup_Supply_Position[1] := PLASTIC_CUP_INIT_POSITION [1] - DIST_Y_PLASTIC_CENTR * y_counter_plastic;
		Plastic_Cups_Remaining := Plastic_Cups_Remaining -1;
		RETURN;
	END_IF
			
	IF (y_counter_plastic = 2) AND (x_counter_plastic < 8) THEN
			
		x_counter_plastic := x_counter_plastic + 1;
		Plastic_Cup_Supply_Above_Pos[0] := PLASTIC_CUP_INIT_POSITION [0] - DIST_X_PLASTIC_CENTR_SAME_ROW * x_counter_plastic * COS(PLASTIC_TRAY_ORIENTATION) +200;
		Plastic_Cup_Supply_Position[0] := PLASTIC_CUP_INIT_POSITION [0] - DIST_X_PLASTIC_CENTR_SAME_ROW * x_counter_plastic * COS(PLASTIC_TRAY_ORIENTATION) +200;
		Plastic_Cup_Supply_Above_Pos[1] := PLASTIC_CUP_INIT_POSITION [1] - DIST_Y_PLASTIC_CENTR * y_counter_plastic;
		Plastic_Cup_Supply_Position[1] := PLASTIC_CUP_INIT_POSITION [1] - DIST_Y_PLASTIC_CENTR * y_counter_plastic;
		Plastic_Cups_Remaining := Plastic_Cups_Remaining -1;
		RETURN;
	ELSIF (y_counter_plastic = 2) AND (x_counter_plastic = 8) THEN //this raw has only 5 cups last case
		x_counter_plastic := 0;
		y_counter_plastic := 3;
		Plastic_Cup_Supply_Above_Pos[0] := PLASTIC_CUP_INIT_POSITION [0] - DIST_X_PLASTIC_CENTR_SAME_ROW * x_counter_plastic * COS(PLASTIC_TRAY_ORIENTATION) -50 +200;
		Plastic_Cup_Supply_Position[0] := PLASTIC_CUP_INIT_POSITION [0] - DIST_X_PLASTIC_CENTR_SAME_ROW * x_counter_plastic * COS(PLASTIC_TRAY_ORIENTATION) -50 +200;
		Plastic_Cup_Supply_Above_Pos[1] := PLASTIC_CUP_INIT_POSITION [1] - DIST_Y_PLASTIC_CENTR * y_counter_plastic;
		Plastic_Cup_Supply_Position[1] := PLASTIC_CUP_INIT_POSITION [1] - DIST_Y_PLASTIC_CENTR * y_counter_plastic;
		Plastic_Cups_Remaining := Plastic_Cups_Remaining -1;
		RETURN;
	END_IF

	IF (y_counter_plastic = 3) AND (x_counter_plastic < 7) THEN
			
		x_counter_plastic := x_counter_plastic + 1;
		Plastic_Cup_Supply_Above_Pos[0] := PLASTIC_CUP_INIT_POSITION [0] - DIST_X_PLASTIC_CENTR_SAME_ROW * x_counter_plastic * COS(PLASTIC_TRAY_ORIENTATION) -50 +200;
		Plastic_Cup_Supply_Position[0] := PLASTIC_CUP_INIT_POSITION [0] - DIST_X_PLASTIC_CENTR_SAME_ROW * x_counter_plastic * COS(PLASTIC_TRAY_ORIENTATION) -50 +200;
		Plastic_Cup_Supply_Above_Pos[1] := PLASTIC_CUP_INIT_POSITION [1] - DIST_Y_PLASTIC_CENTR * y_counter_plastic;
		Plastic_Cup_Supply_Position[1] := PLASTIC_CUP_INIT_POSITION [1] - DIST_Y_PLASTIC_CENTR * y_counter_plastic;
		Plastic_Cups_Remaining := Plastic_Cups_Remaining -1;
		RETURN;
	ELSIF (y_counter_plastic = 3) AND (x_counter_plastic = 7) THEN //this raw has only 5 cups last case
		x_counter_plastic := 0;
		y_counter_plastic := 4;
		Plastic_Cup_Supply_Above_Pos[0] := PLASTIC_CUP_INIT_POSITION [0] - DIST_X_PLASTIC_CENTR_SAME_ROW * x_counter_plastic * COS(PLASTIC_TRAY_ORIENTATION) +200;
		Plastic_Cup_Supply_Position[0] := PLASTIC_CUP_INIT_POSITION [0] - DIST_X_PLASTIC_CENTR_SAME_ROW * x_counter_plastic * COS(PLASTIC_TRAY_ORIENTATION) +200;
		Plastic_Cup_Supply_Above_Pos[1] := PLASTIC_CUP_INIT_POSITION [1] - DIST_Y_PLASTIC_CENTR * y_counter_plastic;
		Plastic_Cup_Supply_Position[1] := PLASTIC_CUP_INIT_POSITION [1] - DIST_Y_PLASTIC_CENTR * y_counter_plastic;
		Plastic_Cups_Remaining := Plastic_Cups_Remaining -1;
		RETURN;
	END_IF
						
	IF (y_counter_plastic = 4) AND (x_counter_plastic < 8) THEN
			
		x_counter_plastic := x_counter_plastic + 1;
		Plastic_Cup_Supply_Above_Pos[0] := PLASTIC_CUP_INIT_POSITION [0] - DIST_X_PLASTIC_CENTR_SAME_ROW * x_counter_plastic * COS(PLASTIC_TRAY_ORIENTATION) +200;
		Plastic_Cup_Supply_Position[0] := PLASTIC_CUP_INIT_POSITION [0] - DIST_X_PLASTIC_CENTR_SAME_ROW * x_counter_plastic * COS(PLASTIC_TRAY_ORIENTATION) +200;
		Plastic_Cup_Supply_Above_Pos[1] := PLASTIC_CUP_INIT_POSITION [1] - DIST_Y_PLASTIC_CENTR * y_counter_plastic;
		Plastic_Cup_Supply_Position[1] := PLASTIC_CUP_INIT_POSITION [1] - DIST_Y_PLASTIC_CENTR * y_counter_plastic;
		Plastic_Cups_Remaining := Plastic_Cups_Remaining -1;
		RETURN;
	ELSIF (y_counter_plastic = 4) AND (x_counter_plastic = 8) THEN //this raw has only 5 cups last case
		x_counter_plastic := 0;
		y_counter_plastic := 0;
		Plastic_Cup_Supply_Above_Pos[0] := PLASTIC_CUP_INIT_POSITION [0] - DIST_X_PLASTIC_CENTR_SAME_ROW * x_counter_plastic * COS(PLASTIC_TRAY_ORIENTATION);
		Plastic_Cup_Supply_Position[0] := PLASTIC_CUP_INIT_POSITION [0] - DIST_X_PLASTIC_CENTR_SAME_ROW * x_counter_plastic * COS(PLASTIC_TRAY_ORIENTATION);
		Plastic_Cup_Supply_Above_Pos[1] := PLASTIC_CUP_INIT_POSITION [1] - DIST_Y_PLASTIC_CENTR * y_counter_plastic;
		Plastic_Cup_Supply_Position[1] := PLASTIC_CUP_INIT_POSITION [1] - DIST_Y_PLASTIC_CENTR * y_counter_plastic;
		Plastic_Cups_Remaining := 0;
		RETURN;
	END_IF
		
	RETURN;
	
END_FUNCTION
