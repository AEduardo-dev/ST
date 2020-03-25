
ACTION moveShuttle: 
		(*************************************************************************************************)
		(*************************************************************************************************)
		(* State Machine *) 
	CASE gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState OF
		(*************************************************************************************************)
		(* RESETTING *)
		RESETTING:
			(*gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.reset := FALSE;*)
			
			IF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := STOPPING;
				
			ELSE
				moveShuttle_Resetting;
				
			END_IF;
			
			(*************************************************************************************************)
			(* IDLE *)
		IDLE: 
			gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.reset := FALSE;
			
			IF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := STOPPING;
				
			ELSE	
				moveShuttle_Idle;	
		
			END_IF;
		
			(*************************************************************************************************)
			(* STARTING *)
		STARTING: 
			//			gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.start := FALSE;
							
			IF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := STOPPING;
			
			ELSE
				moveShuttle_Starting;
	
			END_IF;
		
		
			(*************************************************************************************************)
			(* RUNNING *)
		RUNNING:
			
			gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.start := FALSE;
			
			IF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := STOPPING;
				
			ELSIF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.hold THEN
			
				//				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := HOLDING;
			
			ELSIF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.suspend THEN
			
				//				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := SUSPENDING;

			ELSIF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.pause THEN
			
				//				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := PAUSING;
				
			ELSE
				moveShuttle_Running;
				
			END_IF;
		
			(*************************************************************************************************)
			(* PAUSING *)
		PAUSING: 
			(*gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.pause := FALSE;*)
			
			IF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := STOPPING;
				
			ELSIF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.hold THEN
		
				//				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := HOLDING;
			
			ELSIF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.suspend THEN
		
				//				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := SUSPENDING;
			
			ELSE
				moveShuttle_Pausing;
			END_IF;
		
			(*************************************************************************************************)
			(* PAUSED *)		
		PAUSED: 
			
			gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.pause := FALSE;
			
			IF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := STOPPING;
				
			ELSIF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.hold THEN
				  
				//				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := HOLDING;
				
			ELSIF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.suspend THEN
				  
				//				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := SUSPENDING;

			ELSE
				moveShuttle_Paused;
				
			END_IF;
		
			(*************************************************************************************************)
			(* SUSPENDING *)		
		SUSPENDING:
			(*gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.suspend := FALSE;*)
				
			IF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := STOPPING;
				
			ELSIF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.hold THEN
				  
				//				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := HOLDING;
			
			ELSE
				moveShuttle_Suspending;

			END_IF;
		
			(*************************************************************************************************)
			(* SUSPENDED *)
		SUSPENDED: 
			
			gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.suspend := FALSE;
			
			IF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := STOPPING;
				
			ELSIF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.hold THEN
				  
				//				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := HOLDING;
				
			ELSE
				moveShuttle_Suspended;

			END_IF;
		
			(*************************************************************************************************)
			(* UNSUSPENDING *)		
		UNSUSPENDING: 
			gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.unsuspend := FALSE;
			
			IF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := STOPPING;
				
			ELSIF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.hold THEN
				  
				//				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := HOLDING;
				
			ELSE
				moveShuttle_Unsuspending;

			END_IF;

			(*************************************************************************************************)
			(* HOLDING *)
		HOLDING: 
			(*gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.hold := FALSE;*)
			
			IF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := STOPPING;
			
			ELSE
				moveShuttle_Holding;
			
			END_IF;
			
			(*************************************************************************************************)
			(* HELD *)		
		HELD: 
			
			gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.hold := FALSE;
				
			IF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := STOPPING;
				
			ELSE
				moveShuttle_Held;
			
			END_IF;

			(*************************************************************************************************)
			(* UNHOLDING *)
		UNHOLDING: 
			gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.unhold := FALSE;
			
			IF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := STOPPING;
				
			ELSE
				moveShuttle_Unholding;
			
			END_IF;

			(*************************************************************************************************)
			(* COMPLETING *)
		COMPLETING: 
		
			IF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := STOPPING;
				
			ELSE
				moveShuttle_Completing;
			
			END_IF;

			(*************************************************************************************************)
			(* COMPLETE *)
		COMPLETE: 
			
			
			IF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := STOPPING;
				
			ELSE
				moveShuttle_Complete;	
			
			END_IF;

			(*************************************************************************************************)
			(* STOPPING *)
		STOPPING:
			//			gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.stop := FALSE;
				
			IF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := ABORTING;
			
			ELSE
				moveShuttle_Stopping;
			
			END_IF;

			(*************************************************************************************************)
			(* STOPPED *)
		STOPPED: 
			
			gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.stop := FALSE;	
			
			IF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := ABORTING;

			ELSE
				moveShuttle_Stopped;
				
			END_IF;

			(*************************************************************************************************)
			(* ABORTING *)
		ABORTING: 	
			(*gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.abort := FALSE;*)
			
			moveShuttle_Aborting;

			(*************************************************************************************************)
			(* ABORTED *)
		ABORTED: 
			
			gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.abort := FALSE;
			
			moveShuttle_Aborted;

			(*************************************************************************************************)
			(* CLEARING *)
		CLEARING:
			gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.clear := FALSE;
			
			moveShuttle_Clearing;

			(*************************************************************************************************)
			(* ELSE *)
		ELSE;
	
	END_CASE;
END_ACTION
