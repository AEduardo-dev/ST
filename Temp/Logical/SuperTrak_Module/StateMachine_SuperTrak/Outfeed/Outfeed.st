
ACTION Outfeed: 
		(*************************************************************************************************)
		(*************************************************************************************************)
		(* State Machine *) 
	CASE gSuperTrak.skill.Outfeed.state.stateMachine.operationalState OF
		(*************************************************************************************************)
		(* RESETTING *)
		RESETTING:
			(*gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.reset := FALSE;*)
			
			IF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				Outfeed_Resetting;
				
			END_IF;
			
		(*************************************************************************************************)
		(* IDLE *)
		IDLE: 
			gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.reset := FALSE;
			
			IF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := STOPPING;
				
			ELSE	
				Outfeed_Idle;	
		
			END_IF;
		
		(*************************************************************************************************)
		(* STARTING *)
		STARTING: 
//			gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.start := FALSE;
							
			IF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := STOPPING;
			
			ELSE
				Outfeed_Starting;
	
			END_IF;
		
		
		(*************************************************************************************************)
		(* RUNNING *)
		RUNNING:
			
			gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.start := FALSE;
			
			IF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.hold THEN
			
				//				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := HOLDING;
			
			ELSIF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.suspend THEN
			
				//				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := SUSPENDING;

			ELSIF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.pause THEN
			
				//				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := PAUSING;
				
			ELSE
				Outfeed_Running;
				
			END_IF;
		
		(*************************************************************************************************)
		(* PAUSING *)
		PAUSING: 
			(*gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.pause := FALSE;*)
			
			IF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.hold THEN
		
				//				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := HOLDING;
			
			ELSIF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.suspend THEN
		
				//				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := SUSPENDING;
			
			ELSE
				Outfeed_Pausing;
			END_IF;
		
		(*************************************************************************************************)
		(* PAUSED *)		
		PAUSED: 
			
			gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.pause := FALSE;
			
			IF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.hold THEN
				  
				//				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := HOLDING;
				
			ELSIF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.suspend THEN
				  
				//				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := SUSPENDING;

			ELSE
				Outfeed_Paused;
				
			END_IF;
		
		(*************************************************************************************************)
		(* SUSPENDING *)		
		SUSPENDING:
			(*gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.suspend := FALSE;*)
				
			IF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.hold THEN
				  
				//				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := HOLDING;
			
			ELSE
				Outfeed_Suspending;

			END_IF;
		
		(*************************************************************************************************)
		(* SUSPENDED *)
		SUSPENDED: 
			
			gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.suspend := FALSE;
			
			IF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.hold THEN
				  
				//				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := HOLDING;
				
			ELSE
				Outfeed_Suspended;

			END_IF;
		
		(*************************************************************************************************)
		(* UNSUSPENDING *)		
		UNSUSPENDING: 
			gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.unsuspend := FALSE;
			
			IF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.hold THEN
				  
				//				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := HOLDING;
				
			ELSE
				Outfeed_Unsuspending;

			END_IF;

		(*************************************************************************************************)
		(* HOLDING *)
		HOLDING: 
			(*gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.hold := FALSE;*)
			
			IF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := STOPPING;
			
			ELSE
				Outfeed_Holding;
			
			END_IF;
			
		(*************************************************************************************************)
		(* HELD *)		
		HELD: 
			
			gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.hold := FALSE;
				
			IF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				Outfeed_Held;
			
			END_IF;

		(*************************************************************************************************)
		(* UNHOLDING *)
		UNHOLDING: 
			gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.unhold := FALSE;
			
			IF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				Outfeed_Unholding;
			
			END_IF;

		(*************************************************************************************************)
		(* COMPLETING *)
		COMPLETING: 
		
			IF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				Outfeed_Completing;
			
			END_IF;

		(*************************************************************************************************)
		(* COMPLETE *)
		COMPLETE: 
			
			
			IF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				Outfeed_Complete;	
			
			END_IF;

		(*************************************************************************************************)
		(* STOPPING *)
		STOPPING:
//			gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.stop := FALSE;
				
			IF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := ABORTING;
			
			ELSE
				Outfeed_Stopping;
			
			END_IF;

		(*************************************************************************************************)
		(* STOPPED *)
		STOPPED: 
			
			gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.stop := FALSE;	
			
			IF gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.Outfeed.state.stateMachine.operationalState := ABORTING;

			ELSE
				Outfeed_Stopped;
				
			END_IF;

		(*************************************************************************************************)
		(* ABORTING *)
		ABORTING: 	
			(*gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.abort := FALSE;*)
			
			Outfeed_Aborting;

		(*************************************************************************************************)
		(* ABORTED *)
		ABORTED: 
			
			gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.abort := FALSE;
			
			Outfeed_Aborted;

		(*************************************************************************************************)
		(* CLEARING *)
		CLEARING:
			gSuperTrak.skill.Outfeed.state.stateMachine.stateTransition.clear := FALSE;
			
			Outfeed_Clearing;

			(*************************************************************************************************)
			(* ELSE *)
		ELSE;
	
	END_CASE;
END_ACTION
