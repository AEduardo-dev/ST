
ACTION QACheck: 
		(*************************************************************************************************)
		(*************************************************************************************************)
		(* State Machine *) 
	CASE gSuperTrak.skill.QACheck.state.stateMachine.operationalState OF
		(*************************************************************************************************)
		(* RESETTING *)
		RESETTING:
			(*gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.reset := FALSE;*)
			
			IF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				QACheck_Resetting;
				
			END_IF;
			
		(*************************************************************************************************)
		(* IDLE *)
		IDLE: 
			gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.reset := FALSE;
			
			IF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := STOPPING;
				
			ELSE	
				QACheck_Idle;	
		
			END_IF;
		
		(*************************************************************************************************)
		(* STARTING *)
		STARTING: 
//			gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.start := FALSE;
							
			IF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := STOPPING;
			
			ELSE
				QACheck_Starting;
	
			END_IF;
		
		
		(*************************************************************************************************)
		(* RUNNING *)
		RUNNING:
			
			gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.start := FALSE;
			
			IF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.hold THEN
			
				//				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := HOLDING;
			
			ELSIF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.suspend THEN
			
				//				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := SUSPENDING;

			ELSIF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.pause THEN
			
				//				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := PAUSING;
				
			ELSE
				QACheck_Running;
				
			END_IF;
		
		(*************************************************************************************************)
		(* PAUSING *)
		PAUSING: 
			(*gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.pause := FALSE;*)
			
			IF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.hold THEN
		
				//				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := HOLDING;
			
			ELSIF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.suspend THEN
		
				//				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := SUSPENDING;
			
			ELSE
				QACheck_Pausing;
			END_IF;
		
		(*************************************************************************************************)
		(* PAUSED *)		
		PAUSED: 
			
			gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.pause := FALSE;
			
			IF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.hold THEN
				  
				//				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := HOLDING;
				
			ELSIF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.suspend THEN
				  
				//				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := SUSPENDING;

			ELSE
				QACheck_Paused;
				
			END_IF;
		
		(*************************************************************************************************)
		(* SUSPENDING *)		
		SUSPENDING:
			(*gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.suspend := FALSE;*)
				
			IF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.hold THEN
				  
				//				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := HOLDING;
			
			ELSE
				QACheck_Suspending;

			END_IF;
		
		(*************************************************************************************************)
		(* SUSPENDED *)
		SUSPENDED: 
			
			gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.suspend := FALSE;
			
			IF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.hold THEN
				  
				//				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := HOLDING;
				
			ELSE
				QACheck_Suspended;

			END_IF;
		
		(*************************************************************************************************)
		(* UNSUSPENDING *)		
		UNSUSPENDING: 
			gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.unsuspend := FALSE;
			
			IF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.hold THEN
				  
				//				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := HOLDING;
				
			ELSE
				QACheck_Unsuspending;

			END_IF;

		(*************************************************************************************************)
		(* HOLDING *)
		HOLDING: 
			(*gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.hold := FALSE;*)
			
			IF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := STOPPING;
			
			ELSE
				QACheck_Holding;
			
			END_IF;
			
		(*************************************************************************************************)
		(* HELD *)		
		HELD: 
			
			gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.hold := FALSE;
				
			IF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				QACheck_Held;
			
			END_IF;

		(*************************************************************************************************)
		(* UNHOLDING *)
		UNHOLDING: 
			gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.unhold := FALSE;
			
			IF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				QACheck_Unholding;
			
			END_IF;

		(*************************************************************************************************)
		(* COMPLETING *)
		COMPLETING: 
		
			IF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				QACheck_Completing;
			
			END_IF;

		(*************************************************************************************************)
		(* COMPLETE *)
		COMPLETE: 
			
			
			IF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				QACheck_Complete;	
			
			END_IF;

		(*************************************************************************************************)
		(* STOPPING *)
		STOPPING:
//			gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.stop := FALSE;
				
			IF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := ABORTING;
			
			ELSE
				QACheck_Stopping;
			
			END_IF;

		(*************************************************************************************************)
		(* STOPPED *)
		STOPPED: 
			
			gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.stop := FALSE;	
			
			IF gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.QACheck.state.stateMachine.operationalState := ABORTING;

			ELSE
				QACheck_Stopped;
				
			END_IF;

		(*************************************************************************************************)
		(* ABORTING *)
		ABORTING: 	
			(*gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.abort := FALSE;*)
			
			QACheck_Aborting;

		(*************************************************************************************************)
		(* ABORTED *)
		ABORTED: 
			
			gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.abort := FALSE;
			
			QACheck_Aborted;

		(*************************************************************************************************)
		(* CLEARING *)
		CLEARING:
			gSuperTrak.skill.QACheck.state.stateMachine.stateTransition.clear := FALSE;
			
			QACheck_Clearing;

			(*************************************************************************************************)
			(* ELSE *)
		ELSE;
	
	END_CASE;
END_ACTION
