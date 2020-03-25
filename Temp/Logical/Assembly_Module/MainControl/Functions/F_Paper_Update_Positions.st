FUNCTION F_Paper_Update_Positions
	
	
	IF (y_counter_paper = 0) AND (x_counter_paper < 4) THEN //this raw has only 5 cups
			
		x_counter_paper := x_counter_paper + 1;
		Paper_Cup_Supply_Above_Pos[0] := PAPER_CUP_INIT_POSITION [0] - DIST_X_PAPER_CENTR_SAME_ROW * x_counter_paper * COS(PAPER_TRAY_ORIENTATION);
		Paper_Cup_Supply_Position[0] := PAPER_CUP_INIT_POSITION [0] - DIST_X_PAPER_CENTR_SAME_ROW * x_counter_paper * COS(PAPER_TRAY_ORIENTATION);
		Paper_Cup_Supply_Above_Pos[1] := PAPER_CUP_INIT_POSITION [1] + DIST_Y_PAPER_CENTR * y_counter_paper;
		Paper_Cup_Supply_Position[1] := PAPER_CUP_INIT_POSITION [1] + DIST_Y_PAPER_CENTR * y_counter_paper;
		Paper_Cups_Remaining := Paper_Cups_Remaining -1;
		RETURN;
	ELSIF (y_counter_paper = 0) AND (x_counter_paper = 4) THEN //this raw has only 5 cups last case
		x_counter_paper := 0;
		y_counter_paper := 1;
		Paper_Cup_Supply_Above_Pos[0] := PAPER_CUP_INIT_POSITION [0] - DIST_X_PAPER_CENTR_SAME_ROW * x_counter_paper * COS(PAPER_TRAY_ORIENTATION) -50 +200;
		Paper_Cup_Supply_Position[0] := PAPER_CUP_INIT_POSITION [0] - DIST_X_PAPER_CENTR_SAME_ROW * x_counter_paper * COS(PAPER_TRAY_ORIENTATION) -50 +200;
		Paper_Cup_Supply_Above_Pos[1] := PAPER_CUP_INIT_POSITION [1] + DIST_Y_PAPER_CENTR * y_counter_paper;
		Paper_Cup_Supply_Position[1] := PAPER_CUP_INIT_POSITION [1] + DIST_Y_PAPER_CENTR * y_counter_paper;
		Paper_Cups_Remaining := Paper_Cups_Remaining -1;
		RETURN;
	END_IF
	
	IF (y_counter_paper = 1) AND (x_counter_paper < 7) THEN
			
		x_counter_paper := x_counter_paper + 1;
		Paper_Cup_Supply_Above_Pos[0] := PAPER_CUP_INIT_POSITION [0] - DIST_X_PAPER_CENTR_SAME_ROW * x_counter_paper * COS(PAPER_TRAY_ORIENTATION) -50 +200;
		Paper_Cup_Supply_Position[0] := PAPER_CUP_INIT_POSITION [0] - DIST_X_PAPER_CENTR_SAME_ROW * x_counter_paper * COS(PAPER_TRAY_ORIENTATION) -50 +200;
		Paper_Cup_Supply_Above_Pos[1] := PAPER_CUP_INIT_POSITION [1] + DIST_Y_PAPER_CENTR * y_counter_paper;
		Paper_Cup_Supply_Position[1] := PAPER_CUP_INIT_POSITION [1] + DIST_Y_PAPER_CENTR * y_counter_paper;
		Paper_Cups_Remaining := Paper_Cups_Remaining -1;
		RETURN;
	ELSIF (y_counter_paper = 1) AND (x_counter_paper = 7) THEN //this raw has only 5 cups last case
		x_counter_paper := 0;
		y_counter_paper := 2;
		Paper_Cup_Supply_Above_Pos[0] := PAPER_CUP_INIT_POSITION [0] - DIST_X_PAPER_CENTR_SAME_ROW * x_counter_paper * COS(PAPER_TRAY_ORIENTATION) +200;
		Paper_Cup_Supply_Position[0] := PAPER_CUP_INIT_POSITION [0] - DIST_X_PAPER_CENTR_SAME_ROW * x_counter_paper * COS(PAPER_TRAY_ORIENTATION) +200;
		Paper_Cup_Supply_Above_Pos[1] := PAPER_CUP_INIT_POSITION [1] + DIST_Y_PAPER_CENTR * y_counter_paper;
		Paper_Cup_Supply_Position[1] := PAPER_CUP_INIT_POSITION [1] + DIST_Y_PAPER_CENTR * y_counter_paper;
		Paper_Cups_Remaining := Paper_Cups_Remaining -1;
		RETURN;
	END_IF
			
	IF (y_counter_paper = 2) AND (x_counter_paper < 8) THEN
			
		x_counter_paper := x_counter_paper + 1;
		Paper_Cup_Supply_Above_Pos[0] := PAPER_CUP_INIT_POSITION [0] - DIST_X_PAPER_CENTR_SAME_ROW * x_counter_paper * COS(PAPER_TRAY_ORIENTATION) +200;
		Paper_Cup_Supply_Position[0] := PAPER_CUP_INIT_POSITION [0] - DIST_X_PAPER_CENTR_SAME_ROW * x_counter_paper * COS(PAPER_TRAY_ORIENTATION) +200;
		Paper_Cup_Supply_Above_Pos[1] := PAPER_CUP_INIT_POSITION [1]  +DIST_Y_PAPER_CENTR * y_counter_paper;
		Paper_Cup_Supply_Position[1] := PAPER_CUP_INIT_POSITION [1] + DIST_Y_PAPER_CENTR * y_counter_paper;
		Paper_Cups_Remaining := Paper_Cups_Remaining -1;
		RETURN;
	ELSIF (y_counter_paper = 2) AND (x_counter_paper = 8) THEN //this raw has only 5 cups last case
		x_counter_paper := 0;
		y_counter_paper := 3;
		Paper_Cup_Supply_Above_Pos[0] := PAPER_CUP_INIT_POSITION [0] - DIST_X_PAPER_CENTR_SAME_ROW * x_counter_paper * COS(PAPER_TRAY_ORIENTATION) -50 +200;
		Paper_Cup_Supply_Position[0] := PAPER_CUP_INIT_POSITION [0] - DIST_X_PAPER_CENTR_SAME_ROW * x_counter_paper * COS(PAPER_TRAY_ORIENTATION) -50 +200;
		Paper_Cup_Supply_Above_Pos[1] := PAPER_CUP_INIT_POSITION [1] + DIST_Y_PAPER_CENTR * y_counter_paper;
		Paper_Cup_Supply_Position[1] := PAPER_CUP_INIT_POSITION [1] + DIST_Y_PAPER_CENTR * y_counter_paper;
		Paper_Cups_Remaining := Paper_Cups_Remaining -1;
		RETURN;
	END_IF

	IF (y_counter_paper = 3) AND (x_counter_paper < 7) THEN
			
		x_counter_paper := x_counter_paper + 1;
		Paper_Cup_Supply_Above_Pos[0] := PAPER_CUP_INIT_POSITION [0] - DIST_X_PAPER_CENTR_SAME_ROW * x_counter_paper * COS(PAPER_TRAY_ORIENTATION) -50 +200;
		Paper_Cup_Supply_Position[0] := PAPER_CUP_INIT_POSITION [0] - DIST_X_PAPER_CENTR_SAME_ROW * x_counter_paper * COS(PAPER_TRAY_ORIENTATION) -50 +200;
		Paper_Cup_Supply_Above_Pos[1] := PAPER_CUP_INIT_POSITION [1] + DIST_Y_PAPER_CENTR * y_counter_paper;
		Paper_Cup_Supply_Position[1] := PAPER_CUP_INIT_POSITION [1] + DIST_Y_PAPER_CENTR * y_counter_paper;
		Paper_Cups_Remaining := Paper_Cups_Remaining -1;
		RETURN;
	ELSIF (y_counter_paper = 3) AND (x_counter_paper = 7) THEN //this raw has only 5 cups last case
		x_counter_paper := 0;
		y_counter_paper := 4;
		Paper_Cup_Supply_Above_Pos[0] := PAPER_CUP_INIT_POSITION [0] - DIST_X_PAPER_CENTR_SAME_ROW * x_counter_paper * COS(PAPER_TRAY_ORIENTATION) +200;
		Paper_Cup_Supply_Position[0] := PAPER_CUP_INIT_POSITION [0] - DIST_X_PAPER_CENTR_SAME_ROW * x_counter_paper * COS(PAPER_TRAY_ORIENTATION) +200;
		Paper_Cup_Supply_Above_Pos[1] := PAPER_CUP_INIT_POSITION [1] + DIST_Y_PAPER_CENTR * y_counter_paper;
		Paper_Cup_Supply_Position[1] := PAPER_CUP_INIT_POSITION [1] + DIST_Y_PAPER_CENTR * y_counter_paper;
		Paper_Cups_Remaining := Paper_Cups_Remaining -1;
		RETURN;
	END_IF
						
	IF (y_counter_paper = 4) AND (x_counter_paper < 8) THEN
			
		x_counter_paper := x_counter_paper + 1;
		Paper_Cup_Supply_Above_Pos[0] := PAPER_CUP_INIT_POSITION [0] - DIST_X_PAPER_CENTR_SAME_ROW * x_counter_paper * COS(PAPER_TRAY_ORIENTATION) +200;
		Paper_Cup_Supply_Position[0] := PAPER_CUP_INIT_POSITION [0] - DIST_X_PAPER_CENTR_SAME_ROW * x_counter_paper * COS(PAPER_TRAY_ORIENTATION) +200;
		Paper_Cup_Supply_Above_Pos[1] := PAPER_CUP_INIT_POSITION [1] + DIST_Y_PAPER_CENTR * y_counter_paper;
		Paper_Cup_Supply_Position[1] := PAPER_CUP_INIT_POSITION [1] + DIST_Y_PAPER_CENTR * y_counter_paper;
		Paper_Cups_Remaining := Paper_Cups_Remaining -1;
		RETURN;
	ELSIF (y_counter_paper = 4) AND (x_counter_paper = 8) THEN //this raw has only 5 cups last case
		x_counter_paper := 0;
		y_counter_paper := 0;
		Paper_Cup_Supply_Above_Pos[0] := PAPER_CUP_INIT_POSITION [0] - DIST_X_PAPER_CENTR_SAME_ROW * x_counter_paper * COS(PAPER_TRAY_ORIENTATION);
		Paper_Cup_Supply_Position[0] := PAPER_CUP_INIT_POSITION [0] - DIST_X_PAPER_CENTR_SAME_ROW * x_counter_paper * COS(PAPER_TRAY_ORIENTATION);
		Paper_Cup_Supply_Above_Pos[1] := PAPER_CUP_INIT_POSITION [1] + DIST_Y_PAPER_CENTR * y_counter_paper;
		Paper_Cup_Supply_Position[1] := PAPER_CUP_INIT_POSITION [1] + DIST_Y_PAPER_CENTR * y_counter_paper;
		Paper_Cups_Remaining := 0;
		RETURN;
	END_IF
		
	RETURN;
	
END_FUNCTION
