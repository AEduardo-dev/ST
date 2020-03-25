
ACTION checkParking: 
		(*************************************************************************************************)
		(*************************************************************************************************)
		(* State Machine *) 
	IF gSuperTrak.skill.checkParking.outputParameters.shuttleId = -1 THEN
		check_Parking_Timeout(IN := TRUE, PT:= T#5s);
	ELSE
		check_Parking_Timeout(IN := FALSE);
	END_IF;
	
	(* If we timeout then the las shuttle is forgotten *)
	IF check_Parking_Timeout.Q THEN
		Last_Shuttle := 0;
	END_IF;
	
	
	
	CASE gSuperTrak.skill.checkParking.state.stateMachine.operationalState OF
		(*************************************************************************************************)
		(* RESETTING *)
		RESETTING:
			(*gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.reset := FALSE;*)
			
			IF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				checkParking_Resetting;
				
			END_IF;
			
		(*************************************************************************************************)
		(* IDLE *)
		IDLE: 
			gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.reset := FALSE;
			
			IF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := STOPPING;
				
			ELSE	
				checkParking_Idle;	
		
			END_IF;
		
		(*************************************************************************************************)
		(* STARTING *)
		STARTING: 
//			gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.start := FALSE;
							
			IF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := STOPPING;
			
			ELSE
				checkParking_Starting;
	
			END_IF;
		
		
		(*************************************************************************************************)
		(* RUNNING *)
		RUNNING:
			
			gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.start := FALSE;
			
			IF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.hold THEN
			
				//				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := HOLDING;
			
			ELSIF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.suspend THEN
			
				//				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := SUSPENDING;

			ELSIF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.pause THEN
			
				//				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := PAUSING;
				
			ELSE
				checkParking_Running;
				
			END_IF;
		
		(*************************************************************************************************)
		(* PAUSING *)
		PAUSING: 
			(*gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.pause := FALSE;*)
			
			IF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.hold THEN
		
				//				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := HOLDING;
			
			ELSIF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.suspend THEN
		
				//				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := SUSPENDING;
			
			ELSE
				checkParking_Pausing;
			END_IF;
		
		(*************************************************************************************************)
		(* PAUSED *)		
		PAUSED: 
			
			gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.pause := FALSE;
			
			IF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.hold THEN
				  
				//				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := HOLDING;
				
			ELSIF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.suspend THEN
				  
				//				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := SUSPENDING;

			ELSE
				checkParking_Paused;
				
			END_IF;
		
		(*************************************************************************************************)
		(* SUSPENDING *)		
		SUSPENDING:
			(*gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.suspend := FALSE;*)
				
			IF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.hold THEN
				  
				//				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := HOLDING;
			
			ELSE
				checkParking_Suspending;

			END_IF;
		
		(*************************************************************************************************)
		(* SUSPENDED *)
		SUSPENDED: 
			
			gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.suspend := FALSE;
			
			IF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.hold THEN
				  
				//				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := HOLDING;
				
			ELSE
				checkParking_Suspended;

			END_IF;
		
		(*************************************************************************************************)
		(* UNSUSPENDING *)		
		UNSUSPENDING: 
			gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.unsuspend := FALSE;
			
			IF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := STOPPING;
				
			ELSIF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.hold THEN
				  
				//				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := HOLDING;
				
			ELSE
				checkParking_Unsuspending;

			END_IF;

		(*************************************************************************************************)
		(* HOLDING *)
		HOLDING: 
			(*gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.hold := FALSE;*)
			
			IF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := STOPPING;
			
			ELSE
				checkParking_Holding;
			
			END_IF;
			
		(*************************************************************************************************)
		(* HELD *)		
		HELD: 
			
			gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.hold := FALSE;
				
			IF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				checkParking_Held;
			
			END_IF;

		(*************************************************************************************************)
		(* UNHOLDING *)
		UNHOLDING: 
			gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.unhold := FALSE;
			
			IF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				checkParking_Unholding;
			
			END_IF;

		(*************************************************************************************************)
		(* COMPLETING *)
		COMPLETING: 
		
			IF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				checkParking_Completing;
			
			END_IF;

		(*************************************************************************************************)
		(* COMPLETE *)
		COMPLETE: 
			
			
			IF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := ABORTING;
				
			ELSIF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.stop THEN
				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := STOPPING;
				
			ELSE
				checkParking_Complete;	
			
			END_IF;

		(*************************************************************************************************)
		(* STOPPING *)
		STOPPING:
//			gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.stop := FALSE;
				
			IF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := ABORTING;
			
			ELSE
				checkParking_Stopping;
			
			END_IF;

		(*************************************************************************************************)
		(* STOPPED *)
		STOPPED: 
			
			gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.stop := FALSE;	
			
			IF gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.abort THEN
				gSuperTrak.skill.checkParking.state.stateMachine.operationalState := ABORTING;

			ELSE
				checkParking_Stopped;
				
			END_IF;

		(*************************************************************************************************)
		(* ABORTING *)
		ABORTING: 	
			(*gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.abort := FALSE;*)
			
			checkParking_Aborting;

		(*************************************************************************************************)
		(* ABORTED *)
		ABORTED: 
			
			gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.abort := FALSE;
			
			checkParking_Aborted;

		(*************************************************************************************************)
		(* CLEARING *)
		CLEARING:
			gSuperTrak.skill.checkParking.state.stateMachine.stateTransition.clear := FALSE;
			
			checkParking_Clearing;

			(*************************************************************************************************)
			(* ELSE *)
		ELSE;
	
	END_CASE;
END_ACTION
