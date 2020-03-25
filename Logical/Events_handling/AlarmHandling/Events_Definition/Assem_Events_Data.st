
ACTION Assembly_Events_Data: 
	
	(*Errors/Events are defined through a structure containing 5 different datas*)
	
	(* Severity, facility in which the event is being detected, code of the error, Event_Message for it and the ID generated for the Event*)

	(***************************************************************************************)
	
	Events[100].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[100].Facility_Code 	:= 0;
	Events[100].Code_Value		:= 100;
	Events[100].Event_Message	:= 'Timeout Error - Clearing failed.';

	Events[101].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[101].Facility_Code 	:= 0;
	Events[101].Code_Value		:= 101;
	Events[101].Event_Message	:= 'Comau Illegal Position.';
	
	Events[102].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[102].Facility_Code 	:= 15;
	Events[102].Code_Value		:= 102;
	Events[102].Event_Message	:= 'Critical Hardware Error - Paper Cups Supply not supported';
	
	Events[103].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[103].Facility_Code 	:= 0;
	Events[103].Code_Value		:= 103;
	Events[103].Event_Message	:= 'Critical Hardware Error -';
	
	Events[104].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[104].Facility_Code 	:= 15;
	Events[104].Code_Value		:= 104;
	Events[104].Event_Message	:= 'Timeout Error - Lost connection to MES.';
	
	Events[105].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[105].Facility_Code 	:= 15;
	Events[105].Code_Value		:= 105;
	Events[105].Event_Message	:= 'Critical Error - Emergency Stop.';
	
	Events[106].Severity_Code 	:= arEVENTLOG_SEVERITY_WARNING;
	Events[106].Facility_Code 	:= 0;
	Events[106].Code_Value		:= 106;
	Events[106].Event_Message	:= 'Timeout Error - Lost connection to Process Simulator.';

	(***************************************************************************************)
	
	(*Skills Events*)
	
	Events[107].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[107].Facility_Code 	:= 0;
	Events[107].Code_Value		:= 107;
	Events[107].Event_Message	:= 'goHome Skill was aborted';
	
	Events[108].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[108].Facility_Code 	:= 0;
	Events[108].Code_Value		:= 108;
	Events[108].Event_Message	:= 'provideCup Skill was aborted';
	
	Events[109].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[109].Facility_Code 	:= 0;
	Events[109].Code_Value		:= 109;
	Events[109].Event_Message	:= 'providePellet Skill was aborted';
	
	
	(***************************************************************************************)
	(* Assembly Info states*)
	
	Events[111].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[111].Facility_Code 	:= 0;
	Events[111].Code_Value		:= 111;
	Events[111].Event_Message	:= 'Assembly State - Idle.';
	
	Events[112].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[112].Facility_Code 	:= 0;
	Events[112].Code_Value		:= 112;
	Events[112].Event_Message	:= 'Assembly State - Starting.';
	
	Events[113].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[113].Facility_Code 	:= 0;
	Events[113].Code_Value		:= 113;
	Events[113].Event_Message	:= 'Assembly State - Running.';
	
	Events[114].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[114].Facility_Code 	:= 0;
	Events[114].Code_Value		:= 114;
	Events[114].Event_Message	:= 'Assembly State - Pausing.';
	
	Events[115].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[115].Facility_Code 	:= 0;
	Events[115].Code_Value		:= 115;
	Events[115].Event_Message	:= 'Assembly State - Paused.';
	
	Events[116].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[116].Facility_Code 	:= 0;
	Events[116].Code_Value		:= 116;
	Events[116].Event_Message	:= 'Assembly State - Suspending.';
	
	Events[117].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[117].Facility_Code 	:= 0;
	Events[117].Code_Value		:= 117;
	Events[117].Event_Message	:= 'Assembly State - Suspended.';
	
	Events[118].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[118].Facility_Code 	:= 0;
	Events[118].Code_Value		:= 118;
	Events[118].Event_Message	:= 'Assembly State - Unsuspending.';
	
	Events[119].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[119].Facility_Code 	:= 0;
	Events[119].Code_Value		:= 119;
	Events[119].Event_Message	:= 'Assembly State - Holding.';
	
	Events[120].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[120].Facility_Code 	:= 0;
	Events[120].Code_Value		:= 120;
	Events[120].Event_Message	:= 'Assembly State - Held.';
	
	Events[121].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[121].Facility_Code 	:= 0;
	Events[121].Code_Value		:= 121;
	Events[121].Event_Message	:= 'Assembly State - Unholding.';
	
	Events[122].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[122].Facility_Code 	:= 0;
	Events[122].Code_Value		:= 122;
	Events[122].Event_Message	:= 'Assembly State - Completing.';
	
	Events[123].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[123].Facility_Code 	:= 0;
	Events[123].Code_Value		:= 123;
	Events[123].Event_Message	:= 'Assembly State - Complete.';
	
	Events[124].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[124].Facility_Code 	:= 0;
	Events[124].Code_Value		:= 124;
	Events[124].Event_Message	:= 'Assembly State - Resetting.';
	
	Events[125].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[125].Facility_Code 	:= 0;
	Events[125].Code_Value		:= 125;
	Events[125].Event_Message	:= 'Assembly State - Stopping.';
	
	Events[126].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[126].Facility_Code 	:= 0;
	Events[126].Code_Value		:= 126;
	Events[126].Event_Message	:= 'Assembly State - Stopped.';

	Events[127].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[127].Facility_Code 	:= 0;
	Events[127].Code_Value		:= 127;
	Events[127].Event_Message	:= 'Assembly State - Aborting.';
	
	Events[128].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[128].Facility_Code 	:= 0;
	Events[128].Code_Value		:= 128;
	Events[128].Event_Message	:= 'Assembly State - Aborted.';
	
	Events[129].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[129].Facility_Code 	:= 0;
	Events[129].Code_Value		:= 129;
	Events[129].Event_Message	:= 'Assembly State - Clearing.';
	
	(***************************************************************************************)	
	
	(*Service Stations Events*)
	
	Events[130].Severity_Code 	:= arEVENTLOG_SEVERITY_WARNING;
	Events[130].Facility_Code 	:= 15;
	Events[130].Code_Value		:= 130;
	Events[130].Event_Message	:= 'Maintenance Mode - Requested by the user';
	
	Events[131].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[131].Facility_Code 	:= 0;
	Events[131].Code_Value		:= 131;
	Events[131].Event_Message	:= 'Error in the Homing Procedure';
	
	Events[132].Severity_Code 	:= arEVENTLOG_SEVERITY_WARNING;
	Events[132].Facility_Code 	:= 15;
	Events[132].Code_Value		:= 132;
	Events[132].Event_Message	:= 'Maintenance Mode - Plastic Cup ordered, but there were any in the tray';

	Events[133].Severity_Code 	:= arEVENTLOG_SEVERITY_SUCCESS;
	Events[133].Facility_Code 	:= 15;
	Events[133].Code_Value		:= 133;
	Events[133].Event_Message	:= 'Maintenance Mode - Refill finished, restoring the process';
	(***************************************************************************************)
	
	(*door sensors and magnets Events*)
	
	Events[140].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[140].Facility_Code 	:= 15;
	Events[140].Code_Value		:= 140;
	Events[140].Event_Message	:= 'Assembly Door was illegally opened';
	
		
	Events[141].Severity_Code 	:= arEVENTLOG_SEVERITY_SUCCESS;
	Events[141].Facility_Code 	:= 15;
	Events[141].Code_Value		:= 141;
	Events[141].Event_Message	:= 'Refill succesfully finished';
	
	
	Events[142].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[142].Facility_Code 	:= 15;
	Events[142].Code_Value		:= 142;
	Events[142].Event_Message	:= 'Assembly Paper Tray Right Door was illegally opened';
	
	
	Events[143].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[143].Facility_Code 	:= 15;
	Events[143].Code_Value		:= 143;
	Events[143].Event_Message	:= 'Assembly Paper Tray Left Door was illegally opened';
	
	
	Events[144].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[144].Facility_Code 	:= 15;
	Events[144].Code_Value		:= 144;
	Events[144].Event_Message	:= 'Assembly Plastic Tray drawer was illegally opened';
	
	
	Events[145].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[145].Facility_Code 	:= 15;
	Events[145].Code_Value		:= 145;
	Events[145].Event_Message	:= 'Assembly Paper Tray drawer was illegally opened';

(***************************************************************************************)
	
	
	Events[182].Severity_Code 	:= arEVENTLOG_SEVERITY_WARNING;
	Events[182].Facility_Code 	:= 0;
	Events[182].Code_Value		:= 182;
	Events[182].Event_Message	:= 'Assembly process stopped';
	
		
	Events[183].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[183].Facility_Code 	:= 0;
	Events[183].Code_Value		:= 183;
	Events[183].Event_Message	:= '';

	
	(* Definition of all events ID's *)
	FOR i := 100 TO 199 DO
		Events[i].ID := ArEventLogMakeEventID(Severity := Events[i].Severity_Code , Facility := Events[i].Facility_Code , ErrorCode := Events[i].Code_Value);
	END_FOR;
	
END_ACTION
