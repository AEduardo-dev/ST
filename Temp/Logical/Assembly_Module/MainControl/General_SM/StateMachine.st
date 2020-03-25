
ACTION StateMachine: 
	
	CASE gAssemblyModule.state.stateMachine.operationalState OF
		
		(************************************************************************************************)
		(* RESETTING *)
		
		RESETTING:
		
			(*gAssemblyModule.state.stateMachine.stateTransition.reset := FALSE;*)

			IF gAssemblyModule.state.stateMachine.stateTransition.abort THEN	
				gAssemblyModule.state.stateMachine.operationalState := ABORTING;

			ELSIF gAssemblyModule.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.state.stateMachine.operationalState := STOPPING;

			ELSE
				Resetting;

			END_IF;

			(*************************************************************************************************)
			(* IDLE *)
		IDLE: 

			gAssemblyModule.state.stateMachine.stateTransition.reset := FALSE;
			
			IF gAssemblyModule.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.state.stateMachine.operationalState := ABORTING;

			ELSIF gAssemblyModule.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.state.stateMachine.operationalState := STOPPING;

			ELSE
				Idle;

			END_IF;

			(*************************************************************************************************)
			(* STARTING *)
		STARTING: 
			(*gAssemblyModule.state.stateMachine.stateTransition.start := FALSE;*)

			IF gAssemblyModule.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.state.stateMachine.operationalState := ABORTING;

			ELSIF gAssemblyModule.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.state.stateMachine.operationalState := STOPPING;

			ELSE 
				Starting;

			END_IF;


			(*************************************************************************************************)
			(* RUNNING *)
		RUNNING:

			gAssemblyModule.state.stateMachine.stateTransition.start := FALSE;
			
			IF gAssemblyModule.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.state.stateMachine.operationalState := ABORTING;

			ELSIF gAssemblyModule.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.state.stateMachine.operationalState := STOPPING;

			ELSIF gAssemblyModule.state.stateMachine.stateTransition.hold THEN
				gAssemblyModule.state.stateMachine.operationalState := HOLDING;

			ELSIF gAssemblyModule.state.stateMachine.stateTransition.suspend THEN
				gAssemblyModule.state.stateMachine.operationalState := SUSPENDING;

			ELSIF gAssemblyModule.state.stateMachine.stateTransition.pause THEN
				gAssemblyModule.state.stateMachine.operationalState := PAUSING;

			ELSE 	
				Running;

			END_IF;

			(*************************************************************************************************)
			(* PAUSING *)
		PAUSING: 
						
			(*gAssemblyModule.state.stateMachine.stateTransition.pause := FALSE;*)

			IF gAssemblyModule.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.state.stateMachine.operationalState := ABORTING;

			ELSIF gAssemblyModule.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.state.stateMachine.operationalState := STOPPING;

			ELSIF gAssemblyModule.state.stateMachine.stateTransition.hold THEN
				gAssemblyModule.state.stateMachine.operationalState := HOLDING;

			ELSIF gAssemblyModule.state.stateMachine.stateTransition.suspend THEN
				gAssemblyModule.state.stateMachine.operationalState := SUSPENDING;

			ELSE
				Pausing;

			END_IF;

			(*************************************************************************************************)
			(* PAUSED *)		
		PAUSED: 

			gAssemblyModule.state.stateMachine.stateTransition.pause := FALSE;
			
			IF gAssemblyModule.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.state.stateMachine.operationalState := ABORTING;

			ELSIF gAssemblyModule.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.state.stateMachine.operationalState := STOPPING;

			ELSIF gAssemblyModule.state.stateMachine.stateTransition.hold THEN
				gAssemblyModule.state.stateMachine.operationalState := HOLDING;

			ELSIF gAssemblyModule.state.stateMachine.stateTransition.suspend THEN
				gAssemblyModule.state.stateMachine.operationalState := SUSPENDING;

			ELSE
				Paused;

			END_IF;

			(*************************************************************************************************)
			(* SUSPENDING *)		
		SUSPENDING:

			(*	gAssemblyModule.state.stateMachine.stateTransition.suspend := FALSE;*)

			IF gAssemblyModule.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.state.stateMachine.operationalState := ABORTING;

			ELSIF gAssemblyModule.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.state.stateMachine.operationalState := STOPPING;

			ELSIF gAssemblyModule.state.stateMachine.stateTransition.hold THEN
				gAssemblyModule.state.stateMachine.operationalState := HOLDING;

			ELSE
				Suspending;

			END_IF;

			(*************************************************************************************************)
			(* SUSPENDED *)
		SUSPENDED:
			
			gAssemblyModule.state.stateMachine.stateTransition.suspend := FALSE;
			

			IF gAssemblyModule.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.state.stateMachine.operationalState := ABORTING;

			ELSIF gAssemblyModule.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.state.stateMachine.operationalState := STOPPING;

			ELSIF gAssemblyModule.state.stateMachine.stateTransition.hold THEN
				gAssemblyModule.state.stateMachine.operationalState := HOLDING;

			ELSE
				Suspended;

			END_IF;

			(*************************************************************************************************)
			(* UNSUSPENDING *)		
		UNSUSPENDING: 

			gAssemblyModule.state.stateMachine.stateTransition.unsuspend := FALSE;

			IF gAssemblyModule.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.state.stateMachine.operationalState := ABORTING;

			ELSIF gAssemblyModule.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.state.stateMachine.operationalState := STOPPING;

			ELSIF gAssemblyModule.state.stateMachine.stateTransition.hold THEN
				gAssemblyModule.state.stateMachine.operationalState := HOLDING;

			ELSE
				Unsuspending;

			END_IF;

			(*************************************************************************************************)
			(* HOLDING *)
		HOLDING: 

			(*gAssemblyModule.state.stateMachine.stateTransition.hold := FALSE;*)

			IF gAssemblyModule.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.state.stateMachine.operationalState := ABORTING;

			ELSIF gAssemblyModule.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.state.stateMachine.operationalState := STOPPING;

			ELSE
				Holding;

			END_IF;

			(*************************************************************************************************)
			(* HELD *)		
		HELD: 
			
			gAssemblyModule.state.stateMachine.stateTransition.hold := FALSE;

			IF gAssemblyModule.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.state.stateMachine.operationalState := ABORTING;

			ELSIF gAssemblyModule.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.state.stateMachine.operationalState := STOPPING;

			ELSE
				Held;

			END_IF;

			(*************************************************************************************************)
			(* UNHOLDING *)
		UNHOLDING: 

			gAssemblyModule.state.stateMachine.stateTransition.unhold := FALSE;

			IF gAssemblyModule.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.state.stateMachine.operationalState := ABORTING;

			ELSIF gAssemblyModule.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.state.stateMachine.operationalState := STOPPING;

			ELSE
				Unholding;

			END_IF;

			(*************************************************************************************************)
			(* COMPLETING *)
		COMPLETING: 

			IF gAssemblyModule.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.state.stateMachine.operationalState := ABORTING;

			ELSIF gAssemblyModule.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.state.stateMachine.operationalState := STOPPING;

			ELSE
				Completing;

			END_IF;

			(*************************************************************************************************)
			(* COMPLETE *)
		COMPLETE: 

			IF gAssemblyModule.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.state.stateMachine.operationalState := ABORTING;

			ELSIF gAssemblyModule.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.state.stateMachine.operationalState := STOPPING;

			ELSE
				Complete;

			END_IF;

			(*************************************************************************************************)
			(* STOPPING *)
		STOPPING:

			//			gAssemblyModule.state.stateMachine.stateTransition.stop := FALSE;

			IF gAssemblyModule.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.state.stateMachine.operationalState := ABORTING;

			ELSE
				Stopping;

			END_IF;

			(*************************************************************************************************)
			(* STOPPED *)
		STOPPED: 
			
			gAssemblyModule.state.stateMachine.stateTransition.stop := FALSE;

			IF gAssemblyModule.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.state.stateMachine.operationalState := ABORTING;

			ELSE
				Stopped;

			END_IF;

			(*************************************************************************************************)
			(* ABORTING *)
		ABORTING: 

			(*gAssemblyModule.state.stateMachine.stateTransition.abort := FALSE;*)

			Aborting;

			(*************************************************************************************************)
			(* ABORTED *)
		ABORTED: 

			gAssemblyModule.state.stateMachine.stateTransition.abort := FALSE;
			Aborted;

			(*************************************************************************************************)
			(* CLEARING *)
		CLEARING:
																		
			gAssemblyModule.state.stateMachine.stateTransition.clear := FALSE;

			IF gAssemblyModule.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.state.stateMachine.operationalState := ABORTING;

			ELSE
				Clearing;

			END_IF;

			(*************************************************************************************************)
			(* ELSE *)
		ELSE;

	END_CASE;

END_ACTION
