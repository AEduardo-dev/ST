
PROGRAM _INIT

	 
END_PROGRAM

PROGRAM _CYCLIC

(******************************************************************************************************************)
	
	(*********************)
	//(*INPUT INTERFACE*)//
	(*********************)
	
	
	//(*HARDWARE INPUT VARIABLES*)//
	
	(*Angles of the Comau assigned from AS Library for Comau*)
	(*they will allway come from the "Hardware" side because there is no transformation in the robot in the Digital tween*)
	
	Comau_Joint_1_Angle := Mp_Comau.Info.JointAxisPosition[0];
	Comau_Joint_2_Angle := Mp_Comau.Info.JointAxisPosition[1];
	Comau_Joint_3_Angle := Mp_Comau.Info.JointAxisPosition[2];
	Comau_Joint_4_Angle := Mp_Comau.Info.JointAxisPosition[3];
	Comau_Joint_5_Angle := Mp_Comau.Info.JointAxisPosition[4];
	Comau_Joint_6_Angle := Mp_Comau.Info.JointAxisPosition[5];
	
	(*Signal to detect if the gripper has already grabbed an object coming from the hardware*)
	
	IF NOT DiagCpuIsSimulated() THEN	
		
	//	Comau_IsGrabbing 					:= HW_Comau_IsGrabbing; we don't have this signal (it does not exist)
		
		Assem_LeftDoorSensor 				:= HW_Assem_LeftDoorSensor;
		Assem_RightDoorSensor 				:= HW_Assem_RightDoorSensor;
		
		Assem_PelletPresent					:= HW_Assem_PelletPresent;
		
		Assem_PlasticCupsDrawer				:= HW_Assem_PlasticCupsDrawer;
		Assem_PaperCupsDrawer				:= HW_Assem_PaperCupsDrawer;
		
	END_IF
		
	//(*SIMULATION INPUT VARIABLES*)//
	
	(*Signal to detect if the gripper has already grabbed an object coming from Industrial Physics*)
	
	IF DiagCpuIsSimulated() THEN	
		Comau_IsGrabbing :=  SimInputs.Gripper01_VACUUM;
		
//		Assem_PlasticRightDoor_Sensor 	:= SimInputs.DT_Assem_PlasticRightDoor_Sensor;
//		Assem_PlasticLeftDoor_Sensor	:= SimInputs.DT_Assem_PlasticLeftDoor_Sensor;
		
//		Assem_PaperRightDoor_Sensor 	:= SimInputs.DT_Assem_PaperRightDoor_Sensor;
//		Assem_PaperLeftDoor_Sensor		:= SimInputs.DT_Assem_PaperLeftDoor_Sensor;
	END_IF
		
	
	//End of the Input variables Interface
(******************************************************************************************************************)
	
	(*********************)
	//(*OUTPUT INTERFACE*)//
	(*********************)
	
	//(*HARDWARE OUTPUT VARIABLES*)//
	
	(*Here are defined the ouput variables for the hardware*)
	(* They only will work iF the simulation mode is no active*)
	
	IF NOT DiagCpuIsSimulated() THEN
			
		HW_Comau_Gripper 		:= Comau_Gripper;
		
		HW_Assem_PlasticLock 	:= Assem_PlasticLock;
		HW_Assem_PlasticLock 	:= Assem_PlasticLock;
		
	END_IF	
	
	//(*SIMULATION OUTPUT VARIABLES*)//
	
	(*Here are defined all the outputs that go to Industrial physics and to the Hardware*)
	(*they are allway assigned because the simulation MUST always work*)
	
	(*Angles of the Comau assigned to Industrial Physics variables*)
	
	SimOutputs.Comau_Link101_TGT_POS := LREAL_TO_REAL(Comau_Joint_1_Angle);
	SimOutputs.Comau_Link201_TGT_POS := LREAL_TO_REAL(Comau_Joint_2_Angle);
	SimOutputs.Comau_Link301_TGT_POS := LREAL_TO_REAL(Comau_Joint_3_Angle);
	SimOutputs.Comau_Link401_TGT_POS := LREAL_TO_REAL(Comau_Joint_4_Angle);
	SimOutputs.Comau_Link501_TGT_POS := LREAL_TO_REAL(Comau_Joint_5_Angle);
	SimOutputs.Comau_Link601_TGT_POS := LREAL_TO_REAL(Comau_Joint_6_Angle);
	
	(*Security sensor variables assigned to an Industrial Physics variable*)
	
	SimOutputs.PlasticCupDrawer01_Assem := Assem_PlasticCupsDrawer;
	SimOutputs.PaperCupDrawer01_Assem := Assem_PaperCupsDrawer;

	(*Grpper of the Comau assigned to an Industrial Physics variable*)
	
	SimOutputs.Gripper01_GRIP := Comau_Gripper;
	
	//End of the Output variables Interface
(*****************************************************************************************************************)
	 
END_PROGRAM

PROGRAM _EXIT

	 
END_PROGRAM

