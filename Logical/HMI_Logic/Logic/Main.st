PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	CASE gAssemblyModule.state.stateMachine.operationalState OF
		(*************************************************************************************************)
		(* RESETTING *)
		RESETTING:
			HMI_Assembly_State_String := 'RESETTING';
		
			(*************************************************************************************************)
			(* IDLE *)
		IDLE: 
			HMI_Assembly_State_String := 'IDLE';
			(*************************************************************************************************)
			(* STARTING *)
		STARTING: 
			HMI_Assembly_State_String := 'STARTING';
			(*************************************************************************************************)
			(* RUNNING *)
		RUNNING:
			HMI_Assembly_State_String := 'RUNNING';
			(*************************************************************************************************)
			(* PAUSING *)
		PAUSING: 
			HMI_Assembly_State_String := 'PAUSING';	
			(*************************************************************************************************)
			(* PAUSED *)		
		PAUSED: 
			HMI_Assembly_State_String := 'PAUSED';
			(*************************************************************************************************)
			(* SUSPENDING *)		
		SUSPENDING:
			HMI_Assembly_State_String := 'SUSPENDING';
			(*************************************************************************************************)
			(* SUSPENDED *)
		SUSPENDED: 
			HMI_Assembly_State_String := 'SUSPENDED';
			(*************************************************************************************************)
			(* UNSUSPENDING *)		
		UNSUSPENDING: 
			HMI_Assembly_State_String := 'UNSUSPENDING';
			(*************************************************************************************************)
			(* HOLDING *)
		HOLDING: 
			HMI_Assembly_State_String := 'HOLDING';
			(*************************************************************************************************)
			(* HELD *)		
		HELD: 
			HMI_Assembly_State_String := 'HELD';
			(*************************************************************************************************)
			(* UNHOLDING *)
		UNHOLDING: 
			HMI_Assembly_State_String := 'UNHOLDING';
			(*************************************************************************************************)
			(* COMPLETING *)
		COMPLETING: 
			HMI_Assembly_State_String := 'COMPLETING';
			(*************************************************************************************************)
			(* COMPLETE *)
		COMPLETE: 
			HMI_Assembly_State_String := 'COMPLETE';
			(*************************************************************************************************)
			(* STOPPING *)
		STOPPING:
			HMI_Assembly_State_String := 'STOPPING';
			(*************************************************************************************************)
			(* STOPPED *)
		STOPPED: 
			HMI_Assembly_State_String := 'STOPPED';
			(*************************************************************************************************)
			(* ABORTING *)
		ABORTING: 
			HMI_Assembly_State_String := 'ABORTING';
			(*************************************************************************************************)
			(* ABORTED *)
		ABORTED: 
			HMI_Assembly_State_String := 'ABORTED';
			(*************************************************************************************************)
			(* CLEARING *)
		CLEARING:
			HMI_Assembly_State_String := 'CLEARING';		
			(*************************************************************************************************)
			(* ELSE *)
		ELSE;
	END_CASE;
	
	CASE gSuperTrak.state.stateMachine.operationalState OF
		(*************************************************************************************************)
		(* RESETTING *)
		RESETTING:
			HMI_ST_State_String := 'RESETTING';
		
			(*************************************************************************************************)
			(* IDLE *)
		IDLE: 
			HMI_ST_State_String := 'IDLE';
			(*************************************************************************************************)
			(* STARTING *)
		STARTING: 
			HMI_ST_State_String := 'STARTING';
			(*************************************************************************************************)
			(* RUNNING *)
		RUNNING:
			HMI_ST_State_String := 'RUNNING';
			(*************************************************************************************************)
			(* PAUSING *)
		PAUSING: 
			HMI_ST_State_String := 'PAUSING';	
			(*************************************************************************************************)
			(* PAUSED *)		
		PAUSED: 
			HMI_ST_State_String := 'PAUSED';
			(*************************************************************************************************)
			(* SUSPENDING *)		
		SUSPENDING:
			HMI_ST_State_String := 'SUSPENDING';
			(*************************************************************************************************)
			(* SUSPENDED *)
		SUSPENDED: 
			HMI_ST_State_String := 'SUSPENDED';
			(*************************************************************************************************)
			(* UNSUSPENDING *)		
		UNSUSPENDING: 
			HMI_ST_State_String := 'UNSUSPENDING';
			(*************************************************************************************************)
			(* HOLDING *)
		HOLDING: 
			HMI_ST_State_String := 'HOLDING';
			(*************************************************************************************************)
			(* HELD *)		
		HELD: 
			HMI_ST_State_String := 'HELD';
			(*************************************************************************************************)
			(* UNHOLDING *)
		UNHOLDING: 
			HMI_ST_State_String := 'UNHOLDING';
			(*************************************************************************************************)
			(* COMPLETING *)
		COMPLETING: 
			HMI_ST_State_String := 'COMPLETING';
			(*************************************************************************************************)
			(* COMPLETE *)
		COMPLETE: 
			HMI_ST_State_String := 'COMPLETE';
			(*************************************************************************************************)
			(* STOPPING *)
		STOPPING:
			HMI_ST_State_String := 'STOPPING';
			(*************************************************************************************************)
			(* STOPPED *)
		STOPPED: 
			HMI_ST_State_String := 'STOPPED';
			(*************************************************************************************************)
			(* ABORTING *)
		ABORTING: 
			HMI_ST_State_String := 'ABORTING';
			(*************************************************************************************************)
			(* ABORTED *)
		ABORTED: 
			HMI_ST_State_String := 'ABORTED';
			(*************************************************************************************************)
			(* CLEARING *)
		CLEARING:
			HMI_ST_State_String := 'CLEARING';		
			(*************************************************************************************************)
			(* ELSE *)
		ELSE;
	END_CASE;
	
	
	IF HMI_Abort_System THEN
		gSuperTrak.state.stateMachine.stateTransition.abort 		:= TRUE;
		gAssemblyModule.state.stateMachine.stateTransition.abort 	:= TRUE;
	END_IF;
	
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

