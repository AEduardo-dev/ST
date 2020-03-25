
ACTION provideCup: 
		(*************************************************************************************************)
		(*************************************************************************************************)
		(* State Machine *) 
	CASE gAssemblyModule.skill.provideCup.state.stateMachine.operationalState OF
		(*************************************************************************************************)
		(* RESETTING *)
		RESETTING:
			(*gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.reset := FALSE;*)
			
			IF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				provideCup_Resetting;
				
			END_IF;
			
			(*************************************************************************************************)
			(* IDLE *)
		IDLE: 
			
			gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.reset := FALSE;
			
			IF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := STOPPING;
				
			ELSE	
				provideCup_Idle;	
		
			END_IF;
		
			(*************************************************************************************************)
			(* STARTING *)
		STARTING: 
			(*gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.start := FALSE;*)
							
			IF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := STOPPING;
			
			ELSE
				provideCup_Starting;
	
			END_IF;
		
		
			(*************************************************************************************************)
			(* RUNNING *)
		RUNNING:
			
			gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.start := FALSE;
			
			IF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.hold THEN
				gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := HOLDING;
			
			ELSIF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.suspend THEN
				//gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := SUSPENDING;

			ELSIF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.pause THEN
				//gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := PAUSING;
				
			ELSE
				provideCup_Running;
				
			END_IF;
		
			(*************************************************************************************************)
			(* PAUSING *)
		PAUSING: 
			(*	gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.pause := FALSE;*)
			
			IF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.hold THEN
				//gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := HOLDING;
			
			ELSIF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.suspend THEN
				//gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := SUSPENDING;
			
			ELSE
				provideCup_Pausing;
			END_IF;
		
			(*************************************************************************************************)
			(* PAUSED *)		
		PAUSED: 
			
			gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.pause := FALSE;
			
			IF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.hold THEN
				//gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := HOLDING;
				
			ELSIF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.suspend THEN
				//gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := SUSPENDING;

			ELSE
				provideCup_Paused;
				
			END_IF;
		
			(*************************************************************************************************)
			(* SUSPENDING *)		
		SUSPENDING:
			(*gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.suspend := FALSE;*)
				
			IF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.hold THEN
				//gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := HOLDING;
			
			ELSE
				provideCup_Suspending;

			END_IF;
		
			(*************************************************************************************************)
			(* SUSPENDED *)
		SUSPENDED: 
			
			gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.suspend := FALSE;
			
			IF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.hold THEN
				//gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := HOLDING;
				
			ELSE
				provideCup_Suspended;

			END_IF;
		
			(*************************************************************************************************)
			(* UNSUSPENDING *)		
		UNSUSPENDING: 
			gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.unsuspend := FALSE;
			
			IF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.hold THEN
				//gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := HOLDING;
				
			ELSE
				provideCup_Unsuspending;

			END_IF;

			(*************************************************************************************************)
			(* HOLDING *)
		HOLDING: 
			(*gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.hold := FALSE;*)
			
			IF gAssemblyModule.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.state.stateMachine.operationalState := STOPPING;
			
			ELSE
				provideCup_Holding;
			
			END_IF;
			
			(*************************************************************************************************)
			(* HELD *)		
		HELD: 
				
			gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.hold := FALSE;
			
			IF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				provideCup_Held;
			
			END_IF;

			(*************************************************************************************************)
			(* UNHOLDING *)
		UNHOLDING: 
			gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.unhold := FALSE;
			
			IF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				provideCup_Unholding;
			
			END_IF;

			(*************************************************************************************************)
			(* COMPLETING *)
		COMPLETING: 
		
			IF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				provideCup_Completing;
			
			END_IF;

			(*************************************************************************************************)
			(* COMPLETE *)
		COMPLETE: 
			
			
			IF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				provideCup_Complete;	
			
			END_IF;

			(*************************************************************************************************)
			(* STOPPING *)
		STOPPING:
			(*gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.stop := FALSE;*)
				
			IF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := ABORTING;
			
			ELSE
				provideCup_Stopping;
			
			END_IF;

			(*************************************************************************************************)
			(* STOPPED *)
		STOPPED: 
	
			gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.stop := FALSE;
			
			IF gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.provideCup.state.stateMachine.operationalState := ABORTING;

			ELSE
				provideCup_Stopped;
				
			END_IF;

			(*************************************************************************************************)
			(* ABORTING *)
		ABORTING: 	
			(*gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.abort := FALSE;*)
			
			provideCup_Aborting;

			(*************************************************************************************************)
			(* ABORTED *)
		ABORTED: 
			
			gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.abort := FALSE;
			
			provideCup_Aborted;

			(*************************************************************************************************)
			(* CLEARING *)
		CLEARING:
			gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.clear := FALSE;
			
			provideCup_Clearing;

			(*************************************************************************************************)
			(* ELSE *)
		ELSE;
	
	END_CASE;
END_ACTION
