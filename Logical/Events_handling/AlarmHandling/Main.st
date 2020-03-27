


PROGRAM _INIT
	(*Initial definiton of all the messages that could possibly be used during the execution*)
	ST_Events_Data;
	Assembly_Events_Data;
	General_Events_Data;
	
	(*Flag for the user to select whether or not the info messages of the actual state of the state machines will be shown*)
	//By default is false taking into account that if not this could generate execesive information in the logger
	Set_Info_Messages := FALSE;
	SumCritical := FALSE;

	Initialization := TRUE;
	
END_PROGRAM

PROGRAM _CYCLIC
	ComauerrorHandler;
	STerrorHandler;
	RefillEvent;
	ErrorSum;
	(* Error Reset *)
	
	IF gSuperTrak.state.errorAcknowledge AND SumCritical THEN
		
		IF Last_Event_Written = 200  AND NOT Initialization THEN
			Event_Code := 201;
			EventLog.Commands.WriteUserEvent := TRUE;
			
			Restart_Status := SYSreset(1, 1); (* perform WARMSTART *)

			IF Restart_Status <> 0 THEN (* check status value *)
				Event_Code := 202;
				EventLog.Commands.WriteUserEvent := TRUE;
			END_IF;
			
		END_IF;
		
		Event_Code := 249;
		EventLog.Commands.WriteUserEvent := TRUE;
		Initialization := FALSE;
		
		gSuperTrak.state.errorAcknowledge := FALSE;
		SumCritical := FALSE;

	END_IF;
	
	
	IF gAssemblyModule.state.errorAcknowledge AND SumCritical THEN
		
		IF Last_Event_Written = 200  AND NOT Initialization THEN
			Event_Code := 201;
			EventLog.Commands.WriteUserEvent := TRUE;
			
			Restart_Status := SYSreset(1, 1); (* perform WARMSTART *)

			IF Restart_Status <> 0 THEN (* check status value *)
				Event_Code := 202;
				EventLog.Commands.WriteUserEvent := TRUE;
			END_IF;
			
		END_IF;
		
		Event_Code := 249;
		EventLog.Commands.WriteUserEvent := TRUE;
		
		gAssemblyModule.state.errorAcknowledge := FALSE;
		SumCritical := FALSE;

	END_IF;
	
	
	StateInfo;
	ServiceStations;
	Assembly_WarningHandler;
	
	(* Call to the skills responsible of the critical errors detection and duplicate messages management*)
	IF New_Event THEN
		InfoHistory;
	END_IF;
	
	
	IF Demo THEN 
		Demo_Mode;
	END_IF;
	
	
END_PROGRAM

