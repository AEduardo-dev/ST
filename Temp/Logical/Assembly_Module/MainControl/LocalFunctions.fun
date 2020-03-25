
{REDUND_ERROR} FUNCTION F_Plastic_Update_Positions : BOOL (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		PLASTIC_CUP_INIT_POSITION : ARRAY[0..5] OF LREAL;
		PLASTIC_TRAY_ORIENTATION : LREAL; (*Angle of inclination respect Comau's X axis.*)
		DIST_X_PLASTIC_CENTR_SAME_ROW : REAL;
		DIST_X_PLASTIC_CENTR_DIFF_ROW : REAL;
		DIST_Y_PLASTIC_CENTR : REAL;
	END_VAR
	VAR_IN_OUT
		Plastic_Cup_Supply_Above_Pos : ARRAY[0..5] OF LREAL;
		Plastic_Cup_Supply_Position : ARRAY[0..5] OF LREAL;
		x_counter_plastic : INT;
		y_counter_plastic : INT;
		Plastic_Cups_Remaining : USINT;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION F_Paper_Update_Positions : BOOL (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		PAPER_CUP_INIT_POSITION : ARRAY[0..5] OF LREAL;
		PAPER_TRAY_ORIENTATION : LREAL; (*Angle of inclination respect Comau's X axis.*)
		DIST_X_PAPER_CENTR_SAME_ROW : REAL;
		DIST_X_PAPER_CENTR_DIFF_ROW : REAL;
		DIST_Y_PAPER_CENTR : REAL;
	END_VAR
	VAR_IN_OUT
		Paper_Cup_Supply_Above_Pos : ARRAY[0..5] OF LREAL;
		Paper_Cup_Supply_Position : ARRAY[0..5] OF LREAL;
		x_counter_paper : INT;
		y_counter_paper : INT;
		Paper_Cups_Remaining : USINT;
	END_VAR
END_FUNCTION
