
PROGRAM _EXIT
	
	Mp_Comau.Enable := FALSE;
	Mp_Comau();
	
	
	FOR i:=0 TO 5 DO
		Mp_Joint[i].Enable := FALSE;
		Mp_Joint[i]();
	END_FOR
	 
END_PROGRAM