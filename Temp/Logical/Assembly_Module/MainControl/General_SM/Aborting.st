
ACTION Aborting: 	
	
	Clearing_Case:= POWERON;
	Counter_Clearing_Timeout (IN:= FALSE);
	
	Mp_Comau.MoveLinear := FALSE;
	Mp_Comau.MoveDirect := FALSE;
	
	IF Mp_Comau.PowerOn THEN
		Mp_Comau.Power:= FALSE;
	END_IF;
	
	Comau_Gripper := FALSE;
	
	IF  gAssemblyModule.skill.goHome.state.stateMachine.operationalState <> ABORTING AND
		gAssemblyModule.skill.goHome.state.stateMachine.operationalState <> ABORTED THEN
		
		gAssemblyModule.skill.goHome.state.stateMachine.stateTransition.abort := TRUE;
	
	END_IF
	
	IF  gAssemblyModule.skill.provideCup.state.stateMachine.operationalState <> ABORTING AND
		gAssemblyModule.skill.provideCup.state.stateMachine.operationalState <> ABORTED THEN
		
		gAssemblyModule.skill.provideCup.state.stateMachine.stateTransition.abort := TRUE;
	
	END_IF
	
	IF  gAssemblyModule.skill.providePellet.state.stateMachine.operationalState <> ABORTING AND 
		gAssemblyModule.skill.providePellet.state.stateMachine.operationalState <> ABORTED THEN
		
		gAssemblyModule.skill.providePellet.state.stateMachine.stateTransition.abort := TRUE;
	
	END_IF
	
	IF (gAssemblyModule.skill.goHome.state.stateMachine.operationalState = ABORTED) AND 
		(gAssemblyModule.skill.provideCup.state.stateMachine.operationalState = ABORTED) AND
		(gAssemblyModule.skill.providePellet.state.stateMachine.operationalState = ABORTED) AND
		(Mp_Comau.PowerOn = FALSE)	THEN
	
		gAssemblyModule.state.stateMachine.operationalState := ABORTED;
		
	END_IF;

END_ACTION

