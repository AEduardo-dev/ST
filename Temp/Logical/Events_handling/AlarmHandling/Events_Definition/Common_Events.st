
ACTION General_Events_Data: 
	(*Define Event_Messages here*)
	
	//start messages
	
	Events[200].Severity_Code 	:= arEVENTLOG_SEVERITY_ERROR;
	Events[200].Facility_Code 	:= 15;
	Events[200].Code_Value		:= 200;
	Events[200].Event_Message	:= 'Emergency button was pressed';
	
	Events[201].Severity_Code 	:= arEVENTLOG_SEVERITY_WARNING;
	Events[201].Facility_Code 	:= 15;
	Events[201].Code_Value		:= 201;
	Events[201].Event_Message	:= 'Warm restart initiated';
	
	Events[202].Severity_Code 	:= arEVENTLOG_SEVERITY_WARNING;
	Events[202].Facility_Code 	:= 15;
	Events[202].Code_Value		:= 202;
	Events[202].Event_Message	:= 'Warm restart failed';
		
	Events[249].Severity_Code 	:= arEVENTLOG_SEVERITY_SUCCESS;
	Events[249].Facility_Code 	:= 15;
	Events[249].Code_Value		:= 249;
	Events[249].Event_Message	:= 'Error acknowledged';
	
	Events[250].Severity_Code 	:= arEVENTLOG_SEVERITY_SUCCESS;
	Events[250].Facility_Code 	:= 15;
	Events[250].Code_Value		:= 250;
	Events[250].Event_Message	:= 'User logger entry created succesfully';
	
	(* Definition of all events ID's *)
	FOR i := 200 TO 250 DO
		Events[i].ID := ArEventLogMakeEventID(Severity := Events[i].Severity_Code , Facility := Events[i].Facility_Code , ErrorCode := Events[i].Code_Value);
	END_FOR;
	
END_ACTION
