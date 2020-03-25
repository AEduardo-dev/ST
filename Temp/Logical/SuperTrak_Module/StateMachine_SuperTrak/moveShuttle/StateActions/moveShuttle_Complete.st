
ACTION moveShuttle_Complete: 
		(* The supertrak triggers reset transition when shuttle on target 8 
	     because it has to take care of the movement from target 8 to target 1 *)		
	IF	StTargetExt_[8].PalletPresent
		AND StTargetExt_[8].PalletID = iShuttle THEN
		
		IF NOT StTargetExt_[8].ReleaseToTarget THEN
			gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.reset := TRUE;
			
		ELSIF  StTargetExt_[8].CommandDone THEN
			StTargetExt_[8].ReleaseToTarget := FALSE;
		END_IF;
	
	END_IF;
	
	(* Once the shuttle gets TO target 1 the SuperTrak resets the skill AND waits again 
	FOR the MES control OF the movement *)
	IF StTargetExt_[1].PalletID = iShuttle AND
		StTargetExt_[1].PalletPresent THEN
		
		IF NOT StTargetExt_[1].ReleaseToTarget THEN
			gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.reset := TRUE;
			
		ELSIF  StTargetExt_[1].CommandDone THEN
			StTargetExt_[1].ReleaseToTarget := FALSE;
		END_IF;		
	END_IF;
	
	(* During other movements the skill needs to be reset by the MES, keeping the complete 
	state while other actions are taking place over the shuttle (Other modules)*)
	IF gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.stateTransition.reset THEN
		gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := RESETTING;
	END_IF;
	
END_ACTION
