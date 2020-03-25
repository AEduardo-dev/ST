
ACTION goHome: 
		(*************************************************************************************************)
		(*************************************************************************************************)
		(* State Machine *) 
	CASE gAssemblyModule.skill.goHome.state.stateMachine.operationalState OF
		(*************************************************************************************************)
		(* RESETTING *)
		RESETTING:
			(*gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.reset := FALSE;*)
			
			IF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.goHome.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.goHome.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				goHome_Resetting;
				
			END_IF;
			
		(*************************************************************************************************)
		(* IDLE *)
		IDLE: 
			
			gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.reset := FALSE;
			
			IF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.goHome.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.goHome.state.stateMachine.operationalState := STOPPING;
				
			ELSE	
				goHome_Idle;	
		
			END_IF;
		
		(*************************************************************************************************)
		(* STARTING *)
		STARTING: 
			(*gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.start := FALSE;*)
							
			IF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.goHome.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.goHome.state.stateMachine.operationalState := STOPPING;
			
			ELSE
				goHome_Starting;
	
			END_IF;
		
		
		(*************************************************************************************************)
		(* RUNNING *)
		RUNNING:
			
			gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.start := FALSE;
			
			IF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.goHome.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.goHome.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.hold THEN
				//gAssemblyModule.skill.goHome.state.stateMachine.operationalState := HOLDING;
			
			ELSIF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.suspend THEN
				//gAssemblyModule.skill.goHome.state.stateMachine.operationalState := SUSPENDING;

			ELSIF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.pause THEN
				//gAssemblyModule.skill.goHome.state.stateMachine.operationalState := PAUSING;
				
			ELSE
				goHome_Running;
				
			END_IF;
		
		(*************************************************************************************************)
		(* PAUSING *)
		PAUSING: 
		(*	gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.pause := FALSE;*)
			
			IF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.goHome.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.goHome.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.hold THEN
				//gAssemblyModule.skill.goHome.state.stateMachine.operationalState := HOLDING;
			
			ELSIF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.suspend THEN
				//gAssemblyModule.skill.goHome.state.stateMachine.operationalState := SUSPENDING;
			
			ELSE
				goHome_Pausing;
			END_IF;
		
		(*************************************************************************************************)
		(* PAUSED *)		
		PAUSED: 
			
			gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.pause := FALSE;
			
			IF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.goHome.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.goHome.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.hold THEN
				//gAssemblyModule.skill.goHome.state.stateMachine.operationalState := HOLDING;
				
			ELSIF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.suspend THEN
				//gAssemblyModule.skill.goHome.state.stateMachine.operationalState := SUSPENDING;

			ELSE
				goHome_Paused;
				
			END_IF;
		
		(*************************************************************************************************)
		(* SUSPENDING *)		
		SUSPENDING:
			(*gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.suspend := FALSE;*)
				
			IF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.goHome.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.goHome.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.hold THEN
				//gAssemblyModule.skill.goHome.state.stateMachine.operationalState := HOLDING;
			
			ELSE
				goHome_Suspending;

			END_IF;
		
		(*************************************************************************************************)
		(* SUSPENDED *)
		SUSPENDED: 
			
			gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.suspend := FALSE;
			
			IF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.goHome.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.goHome.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.hold THEN
				//gAssemblyModule.skill.goHome.state.stateMachine.operationalState := HOLDING;
				
			ELSE
				goHome_Suspended;

			END_IF;
		
		(*************************************************************************************************)
		(* UNSUSPENDING *)		
		UNSUSPENDING: 
			gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.unsuspend := FALSE;
			
			IF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.goHome.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.goHome.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.hold THEN
				//gAssemblyModule.skill.goHome.state.stateMachine.operationalState := HOLDING;
				
			ELSE
				goHome_Unsuspending;

			END_IF;

		(*************************************************************************************************)
		(* HOLDING *)
		HOLDING: 
			(*gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.hold := FALSE;*)
			
			IF gAssemblyModule.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.state.stateMachine.operationalState := STOPPING;
			
			ELSE
				goHome_Holding;
			
			END_IF;
			
		(*************************************************************************************************)
		(* HELD *)		
		HELD: 
				
			gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.hold := FALSE;
			
			IF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.goHome.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.goHome.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				goHome_Held;
			
			END_IF;

		(*************************************************************************************************)
		(* UNHOLDING *)
		UNHOLDING: 
			gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.unhold := FALSE;
			
			IF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.goHome.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.goHome.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				goHome_Unholding;
			
			END_IF;

		(*************************************************************************************************)
		(* COMPLETING *)
		COMPLETING: 
		
			IF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.goHome.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.goHome.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				goHome_Completing;
			
			END_IF;

		(*************************************************************************************************)
		(* COMPLETE *)
		COMPLETE: 
			
			
			IF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.goHome.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.stop THEN
				gAssemblyModule.skill.goHome.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				goHome_Complete;	
			
			END_IF;

		(*************************************************************************************************)
		(* STOPPING *)
		STOPPING:
			(*gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.stop := FALSE;*)
				
			IF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.goHome.state.stateMachine.operationalState := ABORTING;
			
			ELSE
				goHome_Stopping;
			
			END_IF;

		(*************************************************************************************************)
		(* STOPPED *)
		STOPPED: 
	
			gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.stop := FALSE;
			
			IF gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.abort THEN
				gAssemblyModule.skill.goHome.state.stateMachine.operationalState := ABORTING;

			ELSE
				goHome_Stopped;
				
			END_IF;

		(*************************************************************************************************)
		(* ABORTING *)
		ABORTING: 	
			(*gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.abort := FALSE;*)
			
			goHome_Aborting;

		(*************************************************************************************************)
		(* ABORTED *)
		ABORTED: 
			
			gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.abort := FALSE;
			
			goHome_Aborted;

		(*************************************************************************************************)
		(* CLEARING *)
		CLEARING:
			gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.clear := FALSE;
			
			goHome_Clearing;

			(*************************************************************************************************)
			(* ELSE *)
		ELSE;
	
	END_CASE;
END_ACTION
