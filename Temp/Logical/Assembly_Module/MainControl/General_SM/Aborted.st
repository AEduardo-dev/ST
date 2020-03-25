
ACTION Aborted: 
	Assem_PaperLock := FALSE;
	Assem_PlasticLock := FALSE;
	
	IF gAssemblyModule.state.stateMachine.stateTransition.clear AND 
		NOT SumCritical THEN
		
		gAssemblyModule.state.stateMachine.operationalState := CLEARING;

	END_IF;

END_ACTION
