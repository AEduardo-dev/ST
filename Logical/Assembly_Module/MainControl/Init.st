PROGRAM _INIT

	Mp_Joint[0].Enable := TRUE;
	Mp_Joint[0].MpLink := ADR(gAxisQ1);
	Mp_Joint[0].Parameters := ADR(Mp_JointParameters[0]);
	Mp_JointParameters[0].Homing.Mode := mcHOMING_DEFAULT;
	
	Mp_Joint[1].Enable := TRUE;
	Mp_Joint[1].MpLink := ADR(gAxisQ2);
	Mp_Joint[1].Parameters := ADR(Mp_JointParameters[1]);
	Mp_JointParameters[1].Homing.Mode := mcHOMING_DEFAULT;
	
	Mp_Joint[2].Enable := TRUE;
	Mp_Joint[2].MpLink := ADR(gAxisQ3);
	Mp_Joint[2].Parameters := ADR(Mp_JointParameters[2]);
	Mp_JointParameters[2].Homing.Mode := mcHOMING_DEFAULT;
	
	Mp_Joint[3].Enable := TRUE;
	Mp_Joint[3].MpLink := ADR(gAxisQ4);
	Mp_Joint[3].Parameters := ADR(Mp_JointParameters[3]);
	Mp_JointParameters[3].Homing.Mode := mcHOMING_DEFAULT;
	
	Mp_Joint[4].Enable := TRUE;
	Mp_Joint[4].MpLink := ADR(gAxisQ5);
	Mp_Joint[4].Parameters := ADR(Mp_JointParameters[4]);
	Mp_JointParameters[4].Homing.Mode := mcHOMING_DEFAULT;
	
	Mp_Joint[5].Enable := TRUE;
	Mp_Joint[5].MpLink := ADR(gAxisQ6);
	Mp_Joint[5].Parameters := ADR(Mp_JointParameters[5]);
	Mp_JointParameters[5].Homing.Mode := mcHOMING_DEFAULT;
	
			
	Mp_Comau.MpLink := ADR(gComauRacer3);
	Mp_Comau.Enable := TRUE;
	Mp_Comau.Parameters := ADR(Mp_Parameters);
	

	Mp_Comau.Override := 100.0;
	Mp_Parameters.CoordSystem := 4;
	
	//SKILS names initialization
	gAssemblyModule.skill.goHome.name := 'goHome';
	gAssemblyModule.skill.provideCup.name := 'provideCup';
	gAssemblyModule.skill.providePellet.name := 'providePellet';
	
	provideCup_Case := CUP_SUPPLY_DECISION_CASE;
	providePellet_Case := PELLET_SUPPLY_DECISION_CASE;
	
	// adapt supply INIT positions
	Paper_Cup_Supply_Position := PAPER_CUP_INIT_POSITION;
	Plastic_Cup_Supply_Position := PLASTIC_CUP_INIT_POSITION;
	
	//Safe-Positions INIT
	Plastic_Cup_Safe_Pos := PLASTIC_CUP_INIT_POSITION;
	Paper_Cup_Safe_Pos := PAPER_CUP_INIT_POSITION;
	
	// define "above" positions dependent on the referred position
	Paper_Cup_Supply_Above_Pos := Paper_Cup_Supply_Position;
	Plastic_Cup_Supply_Above_Pos := Plastic_Cup_Supply_Position;
	Supertrak_Above_Position := Supertrak_Position;
	Small_Pellet_Supply_Pos_Before := Small_Pellet_Supply_Pos;
	
	Supertrak_Above_Position[2] := Supertrak_Above_Position[2] + 70;
	
	Paper_Cup_Supply_Above_Pos[2] := Paper_Cup_Supply_Position[2] + 60;
	Plastic_Cup_Supply_Above_Pos[2] := Paper_Cup_Supply_Position[2] + 60;

	Small_Pellet_Supply_Pos_Before[2] := Small_Pellet_Supply_Pos_Before[2] +65;
	
	Plastic_Cup_Safe_Pos[0] := 0;
	Plastic_Cup_Safe_Pos[1] := PAPER_CUP_INIT_POSITION[1]*(-1) - 200;
	Plastic_Cup_Safe_Pos[2] := Supertrak_Above_Position[2];
	
	Paper_Cup_Safe_Pos[0] := 0;
	Paper_Cup_Safe_Pos[1] := PAPER_CUP_INIT_POSITION[1] +200;
	Paper_Cup_Safe_Pos[2] := Supertrak_Above_Position[2];
	
	Assem_PaperLock := TRUE;
	Assem_PlasticLock := TRUE;
	Refill_Done := FALSE;
	Plastic_RefillDone := TRUE;
	Paper_RefillDone := TRUE;
	
END_PROGRAM



