
ACTION ST_Events_Data: 
	(*Define Event_Messages here*)
	
	(*Errors/Events are defined through a structure containing 5 different datas*)
	
	(* Severity, facility in which the event is being detected, code of the error, Event_Message for it and the ID generated for the Event*)
	Events[0].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[0].Facility_Code 	:= 0;
	Events[0].Code_Value		:= 0;
	Events[0].Event_Message		:= 'SuperTrak Initialized Correctly';

	Events[1].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[1].Facility_Code 	:= 0;
	Events[1].Code_Value		:= 1;
	Events[1].Event_Message		:= 'Critical Hardware Error - Sections were not enabled';
	
	Events[2].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[2].Facility_Code 	:= 0;
	Events[2].Code_Value		:= 2;
	Events[2].Event_Message		:= 'Critical Hardware Error - Shuttles not recognized.';
	
	Events[3].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[3].Facility_Code 	:= 0;
	Events[3].Code_Value		:= 3;
	Events[3].Event_Message		:= 'Critical Hardware Error - Targets not enabled.';
	
	Events[4].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[4].Facility_Code 	:= 15;
	Events[4].Code_Value		:= 4;
	Events[4].Event_Message		:= 'Timeout Error - Lost connection to MES.';
(*	Change angel
	Events[5].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[5].Facility_Code 	:= 15;
	Events[5].Code_Value		:= 5;
	Events[5].Event_Message		:= 'Critical Error - Emergency Stop.';
*)	
	Events[6].Severity_Code 	:= arEVENTLOG_SEVERITY_WARNING;
	Events[6].Facility_Code 	:= 0;
	Events[6].Code_Value		:= 6;
	Events[6].Event_Message		:= 'Timeout Error - Lost connection to Process Simulator.';
	
	Events[7].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[7].Facility_Code 	:= 0;
	Events[7].Code_Value		:= 7;
	Events[7].Event_Message		:= 'Timeout Error - Clearing Process Timed Out, Aborting process';
	
	Events[8].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[8].Facility_Code 	:= 0;
	Events[8].Code_Value		:= 8;
	Events[8].Event_Message		:= 'Number of SECTIONS is greater than maximum allowed';
	
	Events[9].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[9].Facility_Code 	:= 0;
	Events[9].Code_Value		:= 9;
	Events[9].Event_Message		:= 'Number of SHUTTLES is greater than maximum allowed';
	
	Events[10].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[10].Facility_Code 	:= 0;
	Events[10].Code_Value		:= 10;
	Events[10].Event_Message	:= 'Number of TARGETS is greater than maximum allowed';
	
	(* =========================================================================== *)
	(* SuperTrak Info *)
	
	Events[11].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[11].Facility_Code 	:= 0;
	Events[11].Code_Value		:= 11;
	Events[11].Event_Message	:= 'SuperTrak State - Idle.';
	
	Events[12].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[12].Facility_Code 	:= 0;
	Events[12].Code_Value		:= 12;
	Events[12].Event_Message	:= 'SuperTrak State - Starting.';
	
	Events[13].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[13].Facility_Code 	:= 0;
	Events[13].Code_Value		:= 13;
	Events[13].Event_Message	:= 'SuperTrak State - Running.';
	
	Events[14].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[14].Facility_Code 	:= 0;
	Events[14].Code_Value		:= 14;
	Events[14].Event_Message	:= 'SuperTrak State - Pausing.';
	
	Events[15].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[15].Facility_Code 	:= 0;
	Events[15].Code_Value		:= 15;
	Events[15].Event_Message	:= 'SuperTrak State - Paused.';
	
	Events[16].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[16].Facility_Code 	:= 0;
	Events[16].Code_Value		:= 16;
	Events[16].Event_Message	:= 'SuperTrak State - Suspending.';
	
	Events[17].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[17].Facility_Code 	:= 0;
	Events[17].Code_Value		:= 17;
	Events[17].Event_Message	:= 'SuperTrak State - Suspended.';
	
	Events[18].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[18].Facility_Code 	:= 0;
	Events[18].Code_Value		:= 18;
	Events[18].Event_Message	:= 'SuperTrak State - Unsuspending.';
	
	Events[19].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[19].Facility_Code 	:= 0;
	Events[19].Code_Value		:= 19;
	Events[19].Event_Message	:= 'SuperTrak State - Holding.';
	
	Events[20].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[20].Facility_Code 	:= 0;
	Events[20].Code_Value		:= 20;
	Events[20].Event_Message	:= 'SuperTrak State - Held.';
	
	Events[21].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[21].Facility_Code 	:= 0;
	Events[21].Code_Value		:= 21;
	Events[21].Event_Message	:= 'SuperTrak State - Unholding.';
	
	Events[22].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[22].Facility_Code 	:= 0;
	Events[22].Code_Value		:= 22;
	Events[22].Event_Message	:= 'SuperTrak State - Completing.';
	
	Events[23].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[23].Facility_Code 	:= 0;
	Events[23].Code_Value		:= 23;
	Events[23].Event_Message	:= 'SuperTrak State - Complete.';
	
	Events[24].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[24].Facility_Code 	:= 0;
	Events[24].Code_Value		:= 24;
	Events[24].Event_Message	:= 'SuperTrak State - Resetting.';
	
	Events[25].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[25].Facility_Code 	:= 0;
	Events[25].Code_Value		:= 25;
	Events[25].Event_Message	:= 'SuperTrak State - Stopping.';
	
	Events[26].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[26].Facility_Code 	:= 0;
	Events[26].Code_Value		:= 26;
	Events[26].Event_Message	:= 'SuperTrak State - Stopped.';

	Events[27].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[27].Facility_Code 	:= 0;
	Events[27].Code_Value		:= 27;
	Events[27].Event_Message	:= 'SuperTrak State - Aborting.';
	
	Events[28].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[28].Facility_Code 	:= 0;
	Events[28].Code_Value		:= 28;
	Events[28].Event_Message	:= 'SuperTrak State - Aborted.';
	
	Events[29].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
	Events[29].Facility_Code 	:= 0;
	Events[29].Code_Value		:= 29;
	Events[29].Event_Message	:= 'SuperTrak State - Clearing.';

	
	(************************************************************************************)
	(*Shuttles Critical Events*)

	
	FOR i := 1 TO SUPERTRAK_SHUTTLES DO
		iEvent := i+29;
			
		Events[iEvent].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
		Events[iEvent].Facility_Code 	:= 0;
		Events[iEvent].Code_Value		:= iEvent;
		Events[iEvent].Event_Message	:= CONCAT(gSuperTrak.skill.moveShuttle[i].name, ' - Final Target does not exist.');
		
	END_FOR;
	

	FOR i := 1 TO SUPERTRAK_SHUTTLES DO
		iEvent := i+41;
		
		Events[iEvent].Severity_Code 	:= arEVENTLOG_SEVERITY_INFO;
		Events[iEvent].Facility_Code 	:= 0;
		Events[iEvent].Code_Value		:= iEvent;
		Events[iEvent].Event_Message	:= CONCAT(gSuperTrak.skill.moveShuttle[i].name, ' - Shuttle finished product cycle.');
	
	END_FOR;
	
	FOR i := 1 TO SUPERTRAK_SHUTTLES DO
		iEvent := i+53;
			
		Events[iEvent].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
		Events[iEvent].Facility_Code 	:= 0;
		Events[iEvent].Code_Value		:= iEvent;
		Events[iEvent].Event_Message	:= CONCAT(gSuperTrak.skill.moveShuttle[i].name, ' - Final Target equals current target.');
		
	END_FOR;
	
	FOR i := 1 TO SUPERTRAK_SHUTTLES DO
		iEvent := i+65;
			
		Events[iEvent].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
		Events[iEvent].Facility_Code 	:= 0;
		Events[iEvent].Code_Value		:= iEvent;
		Events[iEvent].Event_Message	:= CONCAT(gSuperTrak.skill.moveShuttle[i].name, ' - Skill was aborted.');
		
	END_FOR;
	
	Events[77].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[77].Facility_Code 	:= 15;
	Events[77].Code_Value		:= 77;
	Events[77].Event_Message	:= 'checkParking Skill was aborted';
	
	
	(*Service Stations Events*)
	
	Events[78].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[78].Facility_Code 	:= 15;
	Events[78].Code_Value		:= 78;
	Events[78].Event_Message	:= 'Light Barrier detected illegal access. System Aborted.';
	
	Events[79].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[79].Facility_Code 	:= 15;
	Events[79].Code_Value		:= 79;
	Events[79].Event_Message	:= 'QA Service door was illegaly opened';
	
	Events[80].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[80].Facility_Code 	:= 15;
	Events[80].Code_Value		:= 80;
	Events[80].Event_Message	:= '';
	
		
	Events[81].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[81].Facility_Code 	:= 15;
	Events[81].Code_Value		:= 81;
	Events[81].Event_Message	:= '';
	
		
	Events[82].Severity_Code 	:= arEVENTLOG_SEVERITY_WARNING;
	Events[82].Facility_Code 	:= 0;
	Events[82].Code_Value		:= 82;
	Events[82].Event_Message	:= 'SuperTrak process stopped';
	
		
	Events[83].Severity_Code 	:= arEVENTLOG_SEVERITY_WARNING;
	Events[83].Facility_Code 	:= 0;
	Events[83].Code_Value		:= 83;
	Events[83].Event_Message	:= 'Error has not yet been acknowledged, clear transition not possible';

	
	(* Definition of all events ID's *)
	FOR i := 0 TO 99 DO
		Events[i].ID := ArEventLogMakeEventID(Severity := Events[i].Severity_Code , Facility := Events[i].Facility_Code , ErrorCode := Events[i].Code_Value);
	END_FOR;
	
END_ACTION
