
ACTION Resetting: 
	Mp_Comau.Stop := FALSE;
	IF NOT Mp_Comau.Stopped THEN	
		Mp_Parameters.CoordSystem := 0;
		Mp_Parameters.Position := Comau_Resetting_Poition;
		Mp_Comau.MoveDirect := TRUE;	
		IF Mp_Comau.MoveDone THEN
			Mp_Comau.MoveDirect := FALSE;
			Mp_Parameters.CoordSystem := 4;
			gAssemblyModule.state.stateMachine.operationalState := IDLE;
		END_IF;
	END_IF	
END_ACTION


