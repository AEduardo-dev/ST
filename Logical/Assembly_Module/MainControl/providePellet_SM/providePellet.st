
ACTION providePellet: 
		(*************************************************************************************************)
		(*************************************************************************************************)
		(* State Machine *) 
	CASE gAssemblyModule.skill.providePellet.state.stateMachine.operationalState OF
		(*************************************************************************************************)
		(* RESETTING *)
		RESETTING:
			(*gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.reset := FALSE;*)
			
			IF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				providePellet_Resetting;
				
			END_IF;
			
			(*************************************************************************************************)
			(* IDLE *)
		IDLE: 
			
			gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.reset := FALSE;
			
			IF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := STOPPING;
				
			ELSE	
				providePellet_Idle;	
		
			END_IF;
		
			(*************************************************************************************************)
			(* STARTING *)
		STARTING: 
			(*gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.start := FALSE;*)
							
			IF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := STOPPING;
			
			ELSE
				providePellet_Starting;
	
			END_IF;
		
		
			(*************************************************************************************************)
			(* RUNNING *)
		RUNNING:
			
			gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.start := FALSE;
			
			IF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.hold THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := HOLDING;
			
			ELSIF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.suspend THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := SUSPENDING;

			ELSIF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.pause THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := PAUSING;
				
			ELSE
				providePellet_Running;
				
			END_IF;
		
			(*************************************************************************************************)
			(* PAUSING *)
		PAUSING: 
			(*	gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.pause := FALSE;*)
			
			IF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.hold THEN
				//gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := HOLDING;
			
			ELSIF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.suspend THEN
				//gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := SUSPENDING;
			
			ELSE
				providePellet_Pausing;
			END_IF;
		
			(*************************************************************************************************)
			(* PAUSED *)		
		PAUSED: 
			
			gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.pause := FALSE;
			
			IF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.hold THEN
				//gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := HOLDING;
				
			ELSIF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.suspend THEN
				//gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := SUSPENDING;

			ELSE
				providePellet_Paused;
				
			END_IF;
		
			(*************************************************************************************************)
			(* SUSPENDING *)		
		SUSPENDING:
			(*gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.suspend := FALSE;*)
				
			IF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.hold THEN
				//gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := HOLDING;
			
			ELSE
				providePellet_Suspending;

			END_IF;
		
			(*************************************************************************************************)
			(* SUSPENDED *)
		SUSPENDED: 
			
			gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.suspend := FALSE;
			
			IF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.hold THEN
				//gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := HOLDING;
				
			ELSE
				providePellet_Suspended;

			END_IF;
		
			(*************************************************************************************************)
			(* UNSUSPENDING *)		
		UNSUSPENDING: 
			gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.unsuspend := FALSE;
			
			IF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.hold THEN
				//gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := HOLDING;
				
			ELSE
				providePellet_Unsuspending;

			END_IF;

			(*************************************************************************************************)
			(* HOLDING *)
		HOLDING: 
			(*gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.hold := FALSE;*)
			
			IF gAssemblyModule.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.state.stateMachine.operationalState := STOPPING;
			
			ELSE
				providePellet_Holding;
			
			END_IF;
			
			(*************************************************************************************************)
			(* HELD *)		
		HELD: 
				
			gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.hold := FALSE;
			
			IF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				providePellet_Held;
			
			END_IF;

			(*************************************************************************************************)
			(* UNHOLDING *)
		UNHOLDING: 
			gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.unhold := FALSE;
			
			IF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				providePellet_Unholding;
			
			END_IF;

			(*************************************************************************************************)
			(* COMPLETING *)
		COMPLETING: 
		
			IF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				providePellet_Completing;
			
			END_IF;

			(*************************************************************************************************)
			(* COMPLETE *)
		COMPLETE: 
			
			
			IF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				providePellet_Complete;	
			
			END_IF;

			(*************************************************************************************************)
			(* STOPPING *)
		STOPPING:
			(*gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.stop := FALSE;*)
				
			IF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := ABORTING;
			
			ELSE
				providePellet_Stopping;
			
			END_IF;

			(*************************************************************************************************)
			(* STOPPED *)
		STOPPED: 
	
			gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.stop := FALSE;
			
			IF gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.providePellet.state.stateMachine.operationalState := ABORTING;

			ELSE
				providePellet_Stopped;
				
			END_IF;

			(*************************************************************************************************)
			(* ABORTING *)
		ABORTING: 	
			(*gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.abort := FALSE;*)
			
			providePellet_Aborting;

			(*************************************************************************************************)
			(* ABORTED *)
		ABORTED: 
			
			gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.abort := FALSE;
			
			providePellet_Aborted;

			(*************************************************************************************************)
			(* CLEARING *)
		CLEARING:
			gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.clear := FALSE;
			
			providePellet_Clearing;

			(*************************************************************************************************)
			(* ELSE *)
		ELSE;
	
	
	END_CASE;
END_ACTION
