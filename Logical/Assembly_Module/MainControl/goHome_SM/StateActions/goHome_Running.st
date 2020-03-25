
ACTION goHome_Running: 
	Mp_Parameters.Position := Home_Position;
			
	Mp_Comau.MoveDirect:=TRUE;
	IF Mp_Comau.MoveDone THEN
		Mp_Comau.MoveDirect := FALSE;
		gAssemblyModule.skill.goHome.state.stateMachine.operationalState := COMPLETING;
	END_IF
	
END_ACTION
