
ACTION moveShuttle_Stopping: 
	(* Updates all the shuttles current target before entering stopped state *)
	FOR i[iShuttle] := 1 TO SUPERTRAK_TARGETS DO
		IF StTargetExt_[i[iShuttle]].PalletPresent AND
			StTargetExt_[i[iShuttle]].PalletID = iShuttle AND
			gSuperTrak.skill.moveShuttle[iShuttle].inputParameters.finalTarget = USINT_TO_UDINT(i[iShuttle]) THEN
								
			gSuperTrak.skill.moveShuttle[iShuttle].outputParameters.currentTarget := i[iShuttle];
			gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := STOPPED;								
		END_IF;
	END_FOR;
	
	gSuperTrak.skill.moveShuttle[iShuttle].state.stateMachine.operationalState := STOPPED;
END_ACTION
