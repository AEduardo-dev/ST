(*=========================================================
	ENUM for OPC Communication
  =========================================================*)
(*=========================================================
	General 
  =========================================================*)

TYPE
	opcStateEnum : 
		( (* Operational States *)
		IDLE,
		STARTING,
		RUNNING,
		PAUSING,
		PAUSED,
		SUSPENDING,
		SUSPENDED,
		UNSUSPENDING,
		HOLDING,
		HELD,
		UNHOLDING,
		COMPLETING,
		COMPLETE,
		RESETTING,
		STOPPING,
		STOPPED,
		ABORTING,
		ABORTED,
		CLEARING
		);
END_TYPE

(*========================================================
	 State Type for OPC Communication
  ========================================================*)
(* State *)
(* Struct for Transistion between States *)

TYPE
	opcStateTransitionType : 	STRUCT 
		start : BOOL := FALSE; (* Transition: Idle --> Starting --> Running *)
		pause : BOOL := FALSE; (* Transition: Running --> Pausing --> Paused *)
		resume : BOOL := FALSE; (* Transition: Paused --> Running *)
		suspend : BOOL := FALSE; (* Transition: Running/Pausing/Paused --> Suspending --> Suspended *)
		unsuspend : BOOL := FALSE; (* Transition: Suspended --> Suspending --> Running *)
		hold : BOOL := FALSE; (* Transition: Running/Pausing/Paused --> holding --> Held *)
		unhold : BOOL := FALSE; (* Transition: Held --> Unholding --> Running *)
		stop : BOOL := FALSE; (* Transition: Resetting/Idle/Running/Paused/Suspended/Held -> Stopping -> Stopped *)
		abort : BOOL := FALSE; (* Transition: Stopped/Resetting/Idle/Running/Paused/Suspended/Held -> Aborting --> Aborted *)
		clear : BOOL := FALSE; (* Transition: Aborted --> Clearing --> Stopped *)
		reset : BOOL := FALSE; (* Transition: Complete/Aborted/Stopped --> Resetting --> Idle*)
	END_STRUCT;
END_TYPE

(* Struct for Statemachine *)

TYPE
	opcStateMachineType : 	STRUCT 
		operationalState : opcStateEnum := ABORTED; (* operational state, initalizing at aborted *)
		operationalStateError : STRING[255] := '';
		stateTransition : opcStateTransitionType; (* state transition type *)
	END_STRUCT;
END_TYPE

(* Struct for Skill Statemachine *)

TYPE
	opcModuleStateType : 	STRUCT 
		errorAcknowledge : BOOL := FALSE; (* Error Acknowledge *)
		stateMachine : opcStateMachineType; (* statemachine *)
	END_STRUCT;
END_TYPE

(* Struct for Skill Statemachine *)

TYPE
	opcSkillStateType : 	STRUCT 
		stateMachine : opcStateMachineType; (* statemachine *)
	END_STRUCT;
END_TYPE

(*========================================================
	 Output Skill Types Assembly Module
  ========================================================*)
(* Struct for Skill provideCup *)

TYPE
	opcSkill_provideCup_OutParType : 	STRUCT 
		FirstOutputParam : UINT := 0;
		SecondOutputParam : UINT := 0;
	END_STRUCT;
END_TYPE

(*========================================================
	 Output Skill Types Supertrak Module
  ========================================================*)
(* Struct for Skill moveShuttle *)

TYPE
	opcSkill_moveShuttle_OutParType : 	STRUCT 
		ID : STRING[80] := ''; (* Current Position of Pallet on SuperTrak in total Distance *)
		currentTarget : opcMoveShuttlePositionEnum; (* Current target of Pallet is positioned at *)
	END_STRUCT;
	opcMoveShuttlePositionEnum : 
		( (* Final Position for movement, Position in mm *)
		Target_1 := 1,
		Target_2 := 2,
		Target_3 := 3,
		Target_4 := 4,
		Target_5 := 5,
		Target_6 := 6,
		Target_7 := 7,
		Target_8 := 8
		);
END_TYPE

(* Struct for Skill checkParking *)

TYPE
	opcSkill_checkParking_OutParType : 	STRUCT 
		shuttleId : INT; (*this must not be unsigned*)
	END_STRUCT;
END_TYPE

(*========================================================
	 Input Skill Types Assembly Module
  ========================================================*)
(* Struct for Skill provideCup *)

TYPE
	opcSkill_provideCup_InParType : 	STRUCT 
		cupType : INT := 0;
	END_STRUCT;
END_TYPE

(* Struct for Skill providePellet *)

TYPE
	opcSkill_providePellet_InParType : 	STRUCT 
		pelletType : INT := 0;
	END_STRUCT;
END_TYPE

(*========================================================
	 Input Skill Types Supertrak Module
  ========================================================*)
(* Struct for Skill moveShuttle *)

TYPE
	opcSkill_moveShuttle_InParType : 	STRUCT 
		finalTarget : opcMoveShuttlePositionEnum; (* Position to be send to *)
	END_STRUCT;
END_TYPE

(*========================================================
	 Skill Types for OPC Communication in Assembly Module
  ========================================================*)
(* Struct for Skill provideCup *)

TYPE
	opcSkill_provideCup_Type : 	STRUCT 
		USID : USINT := 0; (* Unique Skill Identification *)
		name : STRING[255]; (* Name for Pallet *)
		inputParameters : opcSkill_provideCup_InParType; (*Input Parameters*)
		OutputParameters : opcSkill_provideCup_OutParType; (*output Parameters*)
		state : opcSkillStateType; (* State Type *)
	END_STRUCT;
END_TYPE

(* Struct for Skill providePellet *)

TYPE
	opcSkill_providePellet_Type : 	STRUCT 
		USID : USINT := 0; (* Unique Skill Identification *)
		name : STRING[255]; (* Name for Pallet *)
		inputParameters : opcSkill_providePellet_InParType; (*Input Parameters*)
		state : opcSkillStateType; (* State Type *)
	END_STRUCT;
END_TYPE

(* Struct for Skill goHome *)

TYPE
	opcSkill_goHome_Type : 	STRUCT 
		USID : USINT := 0; (* Unique Skill Identification *)
		name : STRING[255]; (* Name for Pallet *)
		state : opcSkillStateType; (* State Type *)
	END_STRUCT;
END_TYPE

(*========================================================
	 Skill Types for OPC Communication in Supertrak Module
  ========================================================*)
(* Struct for Skill moveShuttle *)

TYPE
	opcSkill_moveShuttle_Type : 	STRUCT 
		USID : USINT := 0; (* Unique Skill Identification *)
		name : STRING[255] := 'Move Shuttle'; (* Name for Shuttle*)
		inputParameters : opcSkill_moveShuttle_InParType; (* Input Parameters *)
		outputParameters : opcSkill_moveShuttle_OutParType; (*Output Parameters *)
		state : opcSkillStateType; (* State Type *)
	END_STRUCT;
END_TYPE

(* Struct for Skill Outfeed*)

TYPE
	opcSkill_Outfeed_Type : 	STRUCT 
		USID : USINT := 0; (* Unique Skill Identification *)
		name : STRING[255] := 'Outfeed skill'; (* Name for Shuttle*)
		state : opcSkillStateType; (* State Type *)
	END_STRUCT;
END_TYPE

(* Struct for Skill QACheck*)

TYPE
	opcSkill_QACheck_Type : 	STRUCT 
		USID : USINT := 0; (* Unique Skill Identification *)
		name : STRING[255] := 'QA Check'; (* Name for Shuttle*)
		state : opcSkillStateType; (* State Type *)
	END_STRUCT;
END_TYPE

(* Struct for Skill checkParking *)

TYPE
	opcSkill_checkParking_Type : 	STRUCT 
		USID : USINT := 0; (* Unique Skill Identification *)
		name : STRING[255] := 'Check Parking'; (* Name for Shuttle*)
		outputParameters : opcSkill_checkParking_OutParType; (*Output Parameters *)
		state : opcSkillStateType; (* State Type *)
	END_STRUCT;
END_TYPE

(*========================================================
	 Substructures for OPC Communication
  ========================================================*)
(* LifeBit *)

TYPE
	opcLifeBitType : 	STRUCT 
		lifeBitAck : BOOL := FALSE;
	END_STRUCT;
END_TYPE

(* Identification *)

TYPE
	opcIdentificationType : 	STRUCT 
		deviceName : STRING[255] := ''; (* Name of the Device *)
		manufacturer : STRING[255] := ''; (* Name of the device Manufacturer *)
		serialNumber : USINT := 0; (* Static and unique serial Number *)
	END_STRUCT;
END_TYPE

(* Skills for both modules*)

TYPE
	opcSkill_Assembly_Type : 	STRUCT 
		goHome : opcSkill_goHome_Type;
		providePellet : opcSkill_providePellet_Type;
		provideCup : opcSkill_provideCup_Type;
	END_STRUCT;
	opcSkill_Supertrak_Type : 	STRUCT 
		Outfeed : opcSkill_Outfeed_Type;
		QACheck : opcSkill_QACheck_Type;
		moveShuttle : ARRAY[1..SUPERTRAK_SHUTTLES]OF opcSkill_moveShuttle_Type; (* Skill for moving shuttle*)
		checkParking : opcSkill_checkParking_Type; (* Skill for checking the IDs of the shuttles at parking position*)
	END_STRUCT;
END_TYPE

(*========================================================
	 Module Structures for OPC Communication
  ========================================================*)
(* Assembly Module *)

TYPE
	opcAssemblyModuleType : 	STRUCT 
		identification : opcIdentificationType; (* Identification *)
		state : opcModuleStateType; (* General State *)
		skill : opcSkill_Assembly_Type; (* Skills *)
		lifeBit : opcLifeBitType; (* Security Bit *)
	END_STRUCT;
END_TYPE

(* Supertrak Module *)

TYPE
	opcSuperTrakType : 	STRUCT 
		identification : opcIdentificationType; (* Identification *)
		state : opcModuleStateType; (* State *)
		skill : opcSkill_Supertrak_Type;
		lifeBit : opcLifeBitType; (* Security Bit *)
	END_STRUCT;
END_TYPE
