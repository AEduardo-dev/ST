
PROGRAM _INIT
	
	DisableBrake := 12;
	ParIDType.ParID := 90; // Brake disable
	ParIDType.DataType :=  mcACPAX_PARTYPE_UINT;
	ParIDType.VariableAddress := ADR(DisableBrake);
	
	BrakeOffTime := 1.0;
	BrakeOff.ParID := 45;
	BrakeOff.DataType := mcACPAX_PARTYPE_REAL;
	BrakeOff.VariableAddress := ADR(BrakeOffTime);
	
		
	fbMC_BR_ProcessParID_AcpAx[0].Axis := ADR(gAxisQ2);
	fbMC_BR_ProcessParID_AcpAx[1].Axis := ADR(gAxisQ3);
	fbMC_BR_ProcessParID_AcpAx[2].Axis := ADR(gAxisQ5);
	fbMC_BR_ProcessParID_AcpAx[3].Axis := ADR(gAxisQ6);
	
	
	FOR i:=0 TO 3 DO
		fbMC_BR_ProcessParID_AcpAx[i].DataAddress := ADR(ParIDType);
		fbMC_BR_ProcessParID_AcpAx[i].Mode := mcACPAX_PARID_SET;
		fbMC_BR_ProcessParID_AcpAx[i].NumberOfParIDs;
		
	END_FOR
	
	fbMC_BR_Q3_BrakeOff.Axis := ADR(gAxisQ3);
	fbMC_BR_Q3_BrakeOff.DataAddress := ADR(BrakeOff);
	fbMC_BR_Q3_BrakeOff.Mode := mcACPAX_PARID_SET;
	fbMC_BR_Q3_BrakeOff.NumberOfParIDs := 1;
	
	 
END_PROGRAM

PROGRAM _CYCLIC
	FOR i:=0 TO 3 DO
		fbMC_BR_ProcessParID_AcpAx[i].Execute := TRUE;
		fbMC_BR_ProcessParID_AcpAx[i]();
		
	END_FOR
	fbMC_BR_Q3_BrakeOff.Execute := TRUE;
	fbMC_BR_Q3_BrakeOff();
	
	 
END_PROGRAM

PROGRAM _EXIT
	FOR i:=0 TO 3 DO
		fbMC_BR_ProcessParID_AcpAx[i].Execute := FALSE;
		fbMC_BR_ProcessParID_AcpAx[i]();
		
			fbMC_BR_Q3_BrakeOff.Execute := FALSE;
		fbMC_BR_Q3_BrakeOff();
		
	END_FOR
	 
END_PROGRAM

