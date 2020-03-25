TYPE
	McAGPGLicEnum :
		( (*Defines whether to use single function licenses or a flat license for this axes group*)
		mcAGPGL_SNG := 0, (*Single - Single licenses*)
		mcAGPGL_FLT := 1 (*Flat - Flat license*)
		);
	McAGPGPAJntAxJntAxType : STRUCT
		Name : STRING[250];
		AxisReference : McCfgReferenceType;
	END_STRUCT;
	McAGPGPAJntAxType : STRUCT
		JointAxis : McCfgUnboundedArrayType;
	END_STRUCT;
	McAGPGPASlAxSlAxType : STRUCT
		Name : STRING[250];
		AxisReference : McCfgReferenceType;
	END_STRUCT;
	McAGPGPASlAxType : STRUCT
		SlaveAxis : McCfgUnboundedArrayType;
	END_STRUCT;
	McAGPGPASngAxSngAxType : STRUCT
		AxisReference : McCfgReferenceType;
	END_STRUCT;
	McAGPGPASngAxType : STRUCT
		SingleAxis : McCfgUnboundedArrayType;
	END_STRUCT;
	McAGPGPAType : STRUCT
		JointAxes : McAGPGPAJntAxType;
		SlaveAxes : McAGPGPASlAxType;
		SingleAxes : McAGPGPASngAxType;
	END_STRUCT;
	McAGPGMSType : STRUCT
		MechanicalSystemReference : McCfgReferenceType; (*Name of the mechanical system reference*)
	END_STRUCT;
	McAGPGModalDatBxEnum :
		( (*Modal data behaviour selector setting*)
		mcCAGPGMDB_RST_TO_DEF := 0, (*Reset to default - The values are reseted to the configured/default values at program end.*)
		mcCAGPGMDB_KEEP_CUR_VAL := 1 (*Keep current values - The values at program end are used for the next program too.*)
		);
	McAGPGModalDatBxType : STRUCT (*All modal data is reset to the default/configured value for the next program*)
		Type : McAGPGModalDatBxEnum; (*Modal data behaviour selector setting*)
	END_STRUCT;
	McAGPGGeoPlanWrkPlEnum :
		( (*Defines the initial active working plane*)
		mcAGPGGPWP_PL_XY := 0, (*Plane XY*)
		mcAGPGGPWP_PL_YZ := 1, (*Plane YZ*)
		mcAGPGGPWP_PL_ZX := 2 (*Plane ZX*)
		);
	McAGPGGeoPlanType : STRUCT
		MaxCornerDeviation : LREAL; (*Defines the maximum corner deviation for non tangential path transitions [measurement units]*)
		MaxTangentialTransitionDeviation : LREAL; (*Defines the maximum contour deviation for tangential path transitions [measurement units]*)
		MaxRadiusDeviation : LREAL; (*Defines the tolerance if circle interpolation is programmed with numeric inconsistencies [measurement units]*)
		WorkingPlane : McAGPGGeoPlanWrkPlEnum; (*Defines the initial active working plane*)
	END_STRUCT;
	McAGPGTrajPlanEnum :
		( (*Trajectory planning selector setting*)
		mcAGPGTP_BASIC := 0 (*Basic -*)
		);
	McAGPGTPBLimCkResEnum :
		( (*Limit check resolution selector setting*)
		mcAGPGTPBLCR_USR_DEF := 0, (*User defined -*)
		mcAGPGTPBLCR_AUT := 1 (*Automatic -*)
		);
	McAGPGTPBLimCkResUsrDefType : STRUCT (*Type mcAGPGTPBLCR_USR_DEF settings*)
		Time : REAL; (*[s]*)
	END_STRUCT;
	McAGPGTPBLimCkResType : STRUCT (*Time resolution of the trajectory planner in which the limits are checked*)
		Type : McAGPGTPBLimCkResEnum; (*Limit check resolution selector setting*)
		UserDefined : McAGPGTPBLimCkResUsrDefType; (*Type mcAGPGTPBLCR_USR_DEF settings*)
	END_STRUCT;
	McAGPGTPBBuffTimeEnum :
		( (*Buffer time selector setting*)
		mcAGPGTPBBT_USR_DEF := 0, (*User defined -*)
		mcAGPGTPBBT_AUT := 1 (*Automatic -*)
		);
	McAGPGTPBBuffTimeUsrDefType : STRUCT (*Type mcAGPGTPBBT_USR_DEF settings*)
		Time : REAL; (*[s]*)
	END_STRUCT;
	McAGPGTPBBuffTimeType : STRUCT (*Maximum buffered timespan which is precomputed*)
		Type : McAGPGTPBBuffTimeEnum; (*Buffer time selector setting*)
		UserDefined : McAGPGTPBBuffTimeUsrDefType; (*Type mcAGPGTPBBT_USR_DEF settings*)
	END_STRUCT;
	McAGPGTPBType : STRUCT (*Type mcAGPGTP_BASIC settings*)
		LimitCheckResolution : McAGPGTPBLimCkResType; (*Time resolution of the trajectory planner in which the limits are checked*)
		BufferTime : McAGPGTPBBuffTimeType; (*Maximum buffered timespan which is precomputed*)
	END_STRUCT;
	McAGPGTrajPlanType : STRUCT
		Type : McAGPGTrajPlanEnum; (*Trajectory planning selector setting*)
		Basic : McAGPGTPBType; (*Type mcAGPGTP_BASIC settings*)
	END_STRUCT;
	McAGPGBSType : STRUCT
		ModalDataBehaviour : McAGPGModalDatBxType; (*All modal data is reset to the default/configured value for the next program*)
		GeometryPlanning : McAGPGGeoPlanType;
		TrajectoryPlanning : McAGPGTrajPlanType;
	END_STRUCT;
	McCfgAxGrpPathGenType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_PATHGEN*)
		ProcessingTaskClass : McPTCEnum; (*Cyclic task class for command processing*)
		License : McAGPGLicEnum; (*Defines whether to use single function licenses or a flat license for this axes group*)
		PhysicalAxes : McAGPGPAType;
		MechanicalSystem : McAGPGMSType;
		BasicSettings : McAGPGBSType;
		AxesGroupFeatures : McAGAGFType;
	END_STRUCT;
	McCfgAxGrpPathGenBaseSetType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_PATHGEN_BASE_SET*)
		BasicSettings : McAGPGBSType;
	END_STRUCT;
	McAGFFHSProdFrmType : STRUCT (*The product coordinate system is based on the last system coordinate system.*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
	END_STRUCT;
	McAGFFHSSysFrm5Type : STRUCT
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
		ProductFrame : McAGFFHSProdFrmType; (*The product coordinate system is based on the last system coordinate system.*)
	END_STRUCT;
	McAGFFHSSysFrm4Type : STRUCT
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
		SystemFrame5 : McAGFFHSSysFrm5Type;
	END_STRUCT;
	McAGFFHSSysFrm3Type : STRUCT
		FrameTable : McCfgReferenceType; (*Defines the initial frame table*)
		FrameIndex : UINT; (*Defines the initial frame index in the initial frame table*)
		SystemFrame4 : McAGFFHSSysFrm4Type;
	END_STRUCT;
	McAGFFHSSysFrm2Type : STRUCT
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
		SystemFrame3 : McAGFFHSSysFrm3Type;
	END_STRUCT;
	McAGFFHSSysFrm1Type : STRUCT (*System frames are based on the machine coordinate system and form a chain.*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
		SystemFrame2 : McAGFFHSSysFrm2Type;
	END_STRUCT;
	McAGFFHSBaseFrmType : STRUCT (*Is the base for a kinematic transformation (robot).*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
	END_STRUCT;
	McAGFFHSMachFrmType : STRUCT (*Base of all other coordinate systems of the axes group.*)
		SystemFrame1 : McAGFFHSSysFrm1Type; (*System frames are based on the machine coordinate system and form a chain.*)
		BaseFrame : McAGFFHSBaseFrmType; (*Is the base for a kinematic transformation (robot).*)
	END_STRUCT;
	McCfgAxGrpFeatFrmHierStdType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_FRM_HIER_STD*)
		ModalDataBehaviour : McAGFModalDatBxType; (*Defines the modal data behaviour of the feature.*)
		MachineFrame : McAGFFHSMachFrmType; (*Base of all other coordinate systems of the axes group.*)
	END_STRUCT;
	McAGFFHCFrmPropMappType : STRUCT
		BCS : STRING[250]; (*Name of the frame that should be mapped to BCS (mandatory)*)
		PCS : STRING[250]; (*Name of the frame that should be mapped to PCS (mandatory)*)
		SCS1 : STRING[250]; (*Name of the frame that should be mapped to SCS1*)
		SCS2 : STRING[250]; (*Name of the frame that should be mapped to SCS2*)
		SCS3 : STRING[250]; (*Name of the frame that should be mapped to SCS3*)
		SCS4 : STRING[250]; (*Name of the frame that should be mapped to SCS4*)
		SCS5 : STRING[250]; (*Name of the frame that should be mapped to SCS5*)
	END_STRUCT;
	McAGFFHCFTypeEnum :
		( (*Type selector setting*)
		mcAGFFHCFT_STD_FRM := 0, (*Standard frame -*)
		mcAGFFHCFT_FRM_TBL_FRM := 1, (*Frame table frame -*)
		mcAGFFHCFT_PRG_MOVE_FRM := 2 (*Programmed moving frame -*)
		);
	McAGFFHCFTStdFrmType : STRUCT (*Type mcAGFFHCFT_STD_FRM settings*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
	END_STRUCT;
	McAGFFHCFTFrmTblFrmType : STRUCT (*Type mcAGFFHCFT_FRM_TBL_FRM settings*)
		FrameTable : McCfgReferenceType; (*Defines the initial frame table*)
		FrameIndex : UINT; (*Defines the initial frame index in the initial frame table*)
	END_STRUCT;
	McAGFFHCFTPMFMoveTypEnum :
		( (*Movement type selector setting*)
		mcAGFFHCFTPMFMT_TRANS_X := 0, (*Translation X - Translation in X-direction*)
		mcAGFFHCFTPMFMT_TRANS_Y := 1, (*Translation Y - Translation in Y-direction*)
		mcAGFFHCFTPMFMT_TRANS_Z := 2, (*Translation Z - Translation in Z-direction*)
		mcAGFFHCFTPMFMT_ROT_X := 3, (*Rotation X - Rotation around X*)
		mcAGFFHCFTPMFMT_ROT_Y := 4, (*Rotation Y - Rotation around Y*)
		mcAGFFHCFTPMFMT_ROT_Z := 5 (*Rotation Z - Rotation around Z*)
		);
	McAGFFHCFTPMFMoveTypType : STRUCT (*Direction of the movement*)
		Type : McAGFFHCFTPMFMoveTypEnum; (*Movement type selector setting*)
	END_STRUCT;
	McAGFFHCFTPMFType : STRUCT (*Type mcAGFFHCFT_PRG_MOVE_FRM settings*)
		MovementType : McAGFFHCFTPMFMoveTypType; (*Direction of the movement*)
		SlaveAxisName : STRING[250]; (*Name of the slave axes that is mapped to the frame*)
	END_STRUCT;
	McAGFFHCFTypeType : STRUCT (*Frame type*)
		Type : McAGFFHCFTypeEnum; (*Type selector setting*)
		StandardFrame : McAGFFHCFTStdFrmType; (*Type mcAGFFHCFT_STD_FRM settings*)
		FrameTableFrame : McAGFFHCFTFrmTblFrmType; (*Type mcAGFFHCFT_FRM_TBL_FRM settings*)
		ProgrammedMovingFrame : McAGFFHCFTPMFType; (*Type mcAGFFHCFT_PRG_MOVE_FRM settings*)
	END_STRUCT;
	McAGFFHCFramesType : STRUCT
		ParentFrameName : STRING[250]; (*Parent frame name*)
		Name : STRING[250]; (*Frame name*)
		Type : McAGFFHCFTypeType; (*Frame type*)
	END_STRUCT;
	McAGFFHCMachFrmType : STRUCT (*Base of all other coordinate systems of the axes group.*)
		Name : STRING[250]; (*Frame name*)
		Frame : McCfgUnboundedArrayType;
	END_STRUCT;
	McAGFFHCType : STRUCT (*Custom frame-hierarchy of an axes group*)
		FramePropertyMapping : McAGFFHCFrmPropMappType;
		MachineFrame : McAGFFHCMachFrmType; (*Base of all other coordinate systems of the axes group.*)
	END_STRUCT;
	McCfgAxGrpFeatFrmHierCusType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_FRM_HIER_CUS*)
		ModalDataBehaviour : McAGFModalDatBxType; (*Defines the modal data behaviour of the feature.*)
		CustomFrameHierarchy : McAGFFHCType; (*Custom frame-hierarchy of an axes group*)
	END_STRUCT;
	McAGFPDPathTypEnum :
		( (*Type selector setting*)
		mcAGFPDPT_CART_PATH := 0, (*Cartesian path - The path is calculated from all Cartesian coordinates*)
		mcAGFPDPT_ORIENT_PATH := 1, (*Orientation path - The path is calculated from the orientation coordinates. Only available for mechanical systems with orientation axis.*)
		mcAGFPDPT_PHS_AX_PATH := 2 (*Physical axes path - Path definition containing all physical axes*)
		);
	McAGFPDCalcInEnum :
		( (*Calculated in selector setting*)
		mcAGFPDCI_MCS := 0, (*MCS - Machine coordinate system*)
		mcAGFPDCI_PCS := 1, (*PCS - Product coordinate system*)
		mcAGFPDCI_SEL_BY_NAME := 2 (*Selected by name - Select the frame by name.*)
		);
	McAGFPDCalcInSelByNameType : STRUCT (*Type mcAGFPDCI_SEL_BY_NAME settings*)
		FrameName : STRING[250]; (*Name of the frame in which the path is calculated.*)
	END_STRUCT;
	McAGFPDCalcInType : STRUCT (*In this frame the path is calculated.*)
		Type : McAGFPDCalcInEnum; (*Calculated in selector setting*)
		SelectedByName : McAGFPDCalcInSelByNameType; (*Type mcAGFPDCI_SEL_BY_NAME settings*)
	END_STRUCT;
	McAGFPDPathTypCartPathType : STRUCT (*Type mcAGFPDPT_CART_PATH settings*)
		CalculatedIn : McAGFPDCalcInType; (*In this frame the path is calculated.*)
	END_STRUCT;
	McAGFPDPathTypOrientPathType : STRUCT (*Type mcAGFPDPT_ORIENT_PATH settings*)
		CalculatedIn : McAGFPDCalcInType; (*In this frame the path is calculated.*)
	END_STRUCT;
	McAGFPDPathTypType : STRUCT (*Type of the path*)
		Type : McAGFPDPathTypEnum; (*Type selector setting*)
		CartesianPath : McAGFPDPathTypCartPathType; (*Type mcAGFPDPT_CART_PATH settings*)
		OrientationPath : McAGFPDPathTypOrientPathType; (*Type mcAGFPDPT_ORIENT_PATH settings*)
	END_STRUCT;
	McAGFPDPathLimEnum :
		( (*Path limits selector setting*)
		mcAGFPDPL_INT := 0, (*Internal - Internal definition of path limits*)
		mcAGFPDPL_EXT := 1 (*External - External definition of path limits*)
		);
	McAGFPDPathLimIntVelEnum :
		( (*Velocity selector setting*)
		mcAGFPDPLIV_NOT_USE := 0, (*Not used -*)
		mcAGFPDPLIV_BASIC := 1 (*Basic -*)
		);
	McAGFPDPathLimIntVelType : STRUCT (*Velocity limit*)
		Type : McAGFPDPathLimIntVelEnum; (*Velocity selector setting*)
		Basic : McCfgLimVelBaseType; (*Type mcAGFPDPLIV_BASIC settings*)
	END_STRUCT;
	McAGFPDPathLimIntAccEnum :
		( (*Acceleration selector setting*)
		mcAGFPDPLIA_NOT_USE := 0, (*Not used -*)
		mcAGFPDPLIA_BASIC := 1 (*Basic -*)
		);
	McAGFPDPathLimIntAccType : STRUCT (*Acceleration limit*)
		Type : McAGFPDPathLimIntAccEnum; (*Acceleration selector setting*)
		Basic : McCfgLimAccBaseType; (*Type mcAGFPDPLIA_BASIC settings*)
	END_STRUCT;
	McAGFPDPathLimIntDecEnum :
		( (*Deceleration selector setting*)
		mcAGFPDPLID_NOT_USE := 0, (*Not used -*)
		mcAGFPDPLID_BASIC := 1 (*Basic -*)
		);
	McAGFPDPathLimIntDecType : STRUCT (*Deceleration limit*)
		Type : McAGFPDPathLimIntDecEnum; (*Deceleration selector setting*)
		Basic : McCfgLimDecBaseType; (*Type mcAGFPDPLID_BASIC settings*)
	END_STRUCT;
	McAGFPDPathLimIntJerkEnum :
		( (*Jerk selector setting*)
		mcAGFPDPLIJ_NOT_USE := 0, (*Not used -*)
		mcAGFPDPLIJ_BASIC := 1 (*Basic -*)
		);
	McAGFPDPathLimIntJerkType : STRUCT (*Jerk limit*)
		Type : McAGFPDPathLimIntJerkEnum; (*Jerk selector setting*)
		Basic : McCfgLimJerkBaseType; (*Type mcAGFPDPLIJ_BASIC settings*)
	END_STRUCT;
	McAGFPDPathLimIntType : STRUCT (*Type mcAGFPDPL_INT settings*)
		Velocity : McAGFPDPathLimIntVelType; (*Velocity limit*)
		Acceleration : McAGFPDPathLimIntAccType; (*Acceleration limit*)
		Deceleration : McAGFPDPathLimIntDecType; (*Deceleration limit*)
		Jerk : McAGFPDPathLimIntJerkType; (*Jerk limit*)
	END_STRUCT;
	McAGFPDPathLimType : STRUCT (*Defines the path limits*)
		Type : McAGFPDPathLimEnum; (*Path limits selector setting*)
		Internal : McAGFPDPathLimIntType; (*Type mcAGFPDPL_INT settings*)
		External : McCfgExtLimRefType; (*Type mcAGFPDPL_EXT settings*)
	END_STRUCT;
	McAGFPDPathType : STRUCT (*Predefined path definitions can be used*)
		Name : STRING[250]; (*Name of the path in a NC program*)
		Type : McAGFPDPathTypType; (*Type of the path*)
		PathLimits : McAGFPDPathLimType; (*Defines the path limits*)
	END_STRUCT;
	McCfgAxGrpFeatPathDefType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_PATH_DEF*)
		ModalDataBehaviour : McAGFModalDatBxType; (*Defines the modal data behaviour of the feature.*)
		Path : McCfgUnboundedArrayType; (*Predefined path definitions can be used*)
	END_STRUCT;
	McAGFSSpdlType : STRUCT
		SlaveAxisName : STRING[250];
	END_STRUCT;
	McCfgAxGrpFeatSpindlesType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_SPINDLES*)
		ModalDataBehaviour : McAGFModalDatBxType; (*Defines the modal data behaviour of the feature.*)
		Spindle : McCfgUnboundedArrayType;
	END_STRUCT;
	McAGFTToolEnum :
		( (*Tools selector setting*)
		mcAGFTT_TOOL_TBL := 0, (*Tool table -*)
		mcAGFTT_SNG_TOOL := 1 (*Single tool -*)
		);
	McAGFTToolToolTblType : STRUCT (*Type mcAGFTT_TOOL_TBL settings*)
		ToolTable : McCfgReferenceType; (*Name of the initial tool table*)
		ToolIdentifier : STRING[250]; (*Defines the initial tool identifier in the tool table*)
	END_STRUCT;
	McAGFTToolSngToolType : STRUCT (*Type mcAGFTT_SNG_TOOL settings*)
		Tool : McCfgReferenceType; (*Name of the tool*)
		DynamicParameter : McCfgReferenceType; (*Name of the dynamic parameter*)
	END_STRUCT;
	McAGFTToolType : STRUCT (*Defines the initial tool settings*)
		Type : McAGFTToolEnum; (*Tools selector setting*)
		ToolTable : McAGFTToolToolTblType; (*Type mcAGFTT_TOOL_TBL settings*)
		SingleTool : McAGFTToolSngToolType; (*Type mcAGFTT_SNG_TOOL settings*)
	END_STRUCT;
	McCfgAxGrpFeatToolType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_TOOL*)
		ModalDataBehaviour : McAGFModalDatBxType; (*Defines the modal data behaviour of the feature.*)
		Tools : McAGFTToolType; (*Defines the initial tool settings*)
	END_STRUCT;
	McAGFWSelfColDetectEnum :
		( (*Self-collision detection selector setting*)
		mcAGFWSCD_NOT_USE := 0, (*Not used - Self-collision detection is not used*)
		mcAGFWSCD_EN := 1 (*Enabled - Self-collision detection is enabled*)
		);
	McAGFWSelfColDetectType : STRUCT (*Self-collision detection*)
		Type : McAGFWSelfColDetectEnum; (*Self-collision detection selector setting*)
	END_STRUCT;
	McCfgAxGrpFeatWsmType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_WSM*)
		ModalDataBehaviour : McAGFModalDatBxType; (*Defines the modal data behaviour of the feature.*)
		WorkspaceReference : McCfgReferenceType; (*Name of the workspace reference*)
		SelfCollisionDetection : McAGFWSelfColDetectType; (*Self-collision detection*)
	END_STRUCT;
	McAGF2DCCompTypEnum :
		( (*Type selector setting*)
		mcAGF2DCCT_JNT_AX := 0 (*Joint Axis - Joint axis compensation*)
		);
	McAGF2DCCompTypJntAxType : STRUCT (*Type mcAGF2DCCT_JNT_AX settings*)
		Source : McCfgReferenceType; (*Source axis*)
		Compensated : McCfgReferenceType; (*Compensated axis*)
	END_STRUCT;
	McAGF2DCCompTypType : STRUCT (*Type of compensation*)
		Type : McAGF2DCCompTypEnum; (*Type selector setting*)
		JointAxis : McAGF2DCCompTypJntAxType; (*Type mcAGF2DCCT_JNT_AX settings*)
	END_STRUCT;
	McAGF2DCCompDatEnum :
		( (*Compensation data selector setting*)
		mcAGF2DCCD_PT_LST := 0, (*Points list - Compensation data specified using list of points*)
		mcAGF2DCCD_CSV_F := 1 (*CSV file - Reference to CSV file with compensation data*)
		);
	McAGF2DCCompDatPtLstPtType : STRUCT
		Source : LREAL; (*Position of source*)
		Compensation : LREAL; (*Compensation value*)
	END_STRUCT;
	McAGF2DCCompDatPtLstType : STRUCT (*Type mcAGF2DCCD_PT_LST settings*)
		Point : McCfgUnboundedArrayType;
	END_STRUCT;
	McAGF2DCCompDatCSVFType : STRUCT (*Type mcAGF2DCCD_CSV_F settings*)
		FileDevice : STRING[250]; (*File device*)
		FileName : STRING[250]; (*File name*)
	END_STRUCT;
	McAGF2DCCompDatType : STRUCT (*Compensation data*)
		Type : McAGF2DCCompDatEnum; (*Compensation data selector setting*)
		PointsList : McAGF2DCCompDatPtLstType; (*Type mcAGF2DCCD_PT_LST settings*)
		CSVFile : McAGF2DCCompDatCSVFType; (*Type mcAGF2DCCD_CSV_F settings*)
	END_STRUCT;
	McAGF2DCCompType : STRUCT
		ID : UINT; (*Compensation ID*)
		Type : McAGF2DCCompTypType; (*Type of compensation*)
		Data : McAGF2DCCompDatType; (*Compensation data*)
	END_STRUCT;
	McCfgAxGrpFeat2DCompType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_2D_COMP*)
		ModalDataBehaviour : McAGFModalDatBxType; (*Defines the modal data behaviour of the feature.*)
		Compensation : McCfgUnboundedArrayType;
	END_STRUCT;
	McAGF3DCCompTypEnum :
		( (*Type selector setting*)
		mcAGF3DCCT_JNT_AX := 0 (*Joint Axis - Joint axis compensation*)
		);
	McAGF3DCCompTypJntAxType : STRUCT (*Type mcAGF3DCCT_JNT_AX settings*)
		Source1 : McCfgReferenceType; (*First source axis*)
		Source2 : McCfgReferenceType; (*Second source axis*)
		Compensated : McCfgReferenceType; (*Compensated axis*)
	END_STRUCT;
	McAGF3DCCompTypType : STRUCT (*Type of compensation*)
		Type : McAGF3DCCompTypEnum; (*Type selector setting*)
		JointAxis : McAGF3DCCompTypJntAxType; (*Type mcAGF3DCCT_JNT_AX settings*)
	END_STRUCT;
	McAGF3DCCompDatEnum :
		( (*Compensation data selector setting*)
		mcAGF3DCCD_PT_LST := 0, (*Points list - Compensation data specified using list of points*)
		mcAGF3DCCD_CSV_F := 1 (*CSV file - Reference to CSV file with compensation data*)
		);
	McAGF3DCCompDatPtLstPtType : STRUCT
		Source1 : LREAL; (*Position of source 1*)
		Source2 : LREAL; (*Position of source 2*)
		Compensation : LREAL; (*Compensation value*)
	END_STRUCT;
	McAGF3DCCompDatPtLstType : STRUCT (*Type mcAGF3DCCD_PT_LST settings*)
		Point : McCfgUnboundedArrayType;
	END_STRUCT;
	McAGF3DCCompDatCSVFType : STRUCT (*Type mcAGF3DCCD_CSV_F settings*)
		FileDevice : STRING[250]; (*File device*)
		FileName : STRING[250]; (*File name*)
	END_STRUCT;
	McAGF3DCCompDatType : STRUCT (*Compensation data*)
		Type : McAGF3DCCompDatEnum; (*Compensation data selector setting*)
		PointsList : McAGF3DCCompDatPtLstType; (*Type mcAGF3DCCD_PT_LST settings*)
		CSVFile : McAGF3DCCompDatCSVFType; (*Type mcAGF3DCCD_CSV_F settings*)
	END_STRUCT;
	McAGF3DCCompType : STRUCT
		ID : UINT; (*Compensation ID*)
		Type : McAGF3DCCompTypType; (*Type of compensation*)
		Data : McAGF3DCCompDatType; (*Compensation data*)
	END_STRUCT;
	McCfgAxGrpFeat3DCompType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_AXGRP_FEAT_3D_COMP*)
		ModalDataBehaviour : McAGFModalDatBxType; (*Defines the modal data behaviour of the feature.*)
		Compensation : McCfgUnboundedArrayType;
	END_STRUCT;
	McMSCNEnum :
		( (*Coordinates names selector setting*)
		mcMSCN_DEF := 0, (*Default*)
		mcMSCN_USR := 1 (*User*)
		);
	McMS2ACXYCoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
	END_STRUCT;
	McMS2ACXYCoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS2ACXYCoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS2ACXYWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS2ACXYWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMSFrmMdlStdEdgeEnum :
		( (*Flange to TCP selector setting*)
		mcMSFMSE_CXN_LIN := 0, (*Connection line - Edge is considered as a whole connection line*)
		mcMSFMSE_PT := 1, (*Point - Only the end point of the edge is considered*)
		mcMSFMSE_NOT_USE := 2 (*Not used - Edge is not considered*)
		);
	McMSFrmMdlStdEdgeCxnLinType : STRUCT (*Type mcMSFMSE_CXN_LIN settings*)
		Distance : LREAL; (*Edge distance to prevent collisions [measurement units]*)
	END_STRUCT;
	McMSFrmMdlStdEdgePtType : STRUCT (*Type mcMSFMSE_PT settings*)
		Distance : LREAL; (*Edge distance to prevent collisions [measurement units]*)
	END_STRUCT;
	McMSFrmMdlStdEdgeType : STRUCT (*Wire frame model edge*)
		Type : McMSFrmMdlStdEdgeEnum; (*Flange to TCP selector setting*)
		ConnectionLine : McMSFrmMdlStdEdgeCxnLinType; (*Type mcMSFMSE_CXN_LIN settings*)
		Point : McMSFrmMdlStdEdgePtType; (*Type mcMSFMSE_PT settings*)
	END_STRUCT;
	McMS2ACXYWFrmMdlStdType : STRUCT (*Type mcMS2ACXYWFM_STD settings*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS2ACXYWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS2ACXYWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS2ACXYWFrmMdlStdType; (*Type mcMS2ACXYWFM_STD settings*)
	END_STRUCT;
	McMSCplg2LinCplgSrcAxEnum :
		( (*Index of the axis which influences the joint axis*)
		mcMSC2LCSA_AX_1 := 0, (*Axis 1 - Axis 1*)
		mcMSC2LCSA_AX_2 := 1 (*Axis 2 - Axis 2*)
		);
	McMSCplg2LinCplgTgtJntAxEnum :
		( (*Index of the joint axis which is influenced*)
		mcMSC2LCTJA_JNT_AX_1 := 0, (*Joint axis 1 - Joint axis 1*)
		mcMSC2LCTJA_JNT_AX_2 := 1 (*Joint axis 2 - Joint axis 2*)
		);
	McMSCplg2LinCplgType : STRUCT (*Linear coupling*)
		SourceAxis : McMSCplg2LinCplgSrcAxEnum; (*Index of the axis which influences the joint axis*)
		SourceAxisUnits : LREAL; (*Units of the axis which influences the joint axis [measurement units]*)
		TargetJointAxis : McMSCplg2LinCplgTgtJntAxEnum; (*Index of the joint axis which is influenced*)
		TargetJointAxisUnits : LREAL; (*Units of the joint axis due to influence [measurement units]*)
	END_STRUCT;
	McMS2ACXYCplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling*)
	END_STRUCT;
	McMSJntAxPosLimEnum :
		( (*Joint axis 1-2 selector setting*)
		mcMSJAPL_USE_AX_LIM := 0, (*Use axis limits - Use position limits already configured for the single axes*)
		mcMSJAPL_CFG_JNT_AX_LIM := 1 (*Configure joint axes limits - Configure position limits*)
		);
	McMSJntAxPosLimCfgJntAxLimType : STRUCT (*Type mcMSJAPL_CFG_JNT_AX_LIM settings*)
		LowerLimit : LREAL; (*Lower position limit [measurement units]*)
		UpperLimit : LREAL; (*Upper position limit [measurement units]*)
	END_STRUCT;
	McMSJntAxPosLimType : STRUCT (*Limits for joint axis*)
		Type : McMSJntAxPosLimEnum; (*Joint axis 1-2 selector setting*)
		ConfigureJointAxesLimits : McMSJntAxPosLimCfgJntAxLimType; (*Type mcMSJAPL_CFG_JNT_AX_LIM settings*)
	END_STRUCT;
	McMSJnt2AxPosLimType : STRUCT (*Position limits for joint axis*)
		JointAxis : ARRAY[0..1] OF McMSJntAxPosLimType; (*Limits for joint axis*)
	END_STRUCT;
	McCfgMS2AxCncXYType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_2AX_CNC_XY*)
		CoordinatesNames : McMS2ACXYCoorNameType; (*Coordinates names*)
		WireFrameModel : McMS2ACXYWFrmMdlType; (*Wire frame model of mechanical system*)
		Couplings : McMS2ACXYCplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt2AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS2ACXZCoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
	END_STRUCT;
	McMS2ACXZCoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS2ACXZCoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS2ACXZWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS2ACXZWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS2ACXZWFrmMdlStdType : STRUCT (*Type mcMS2ACXZWFM_STD settings*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS2ACXZWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS2ACXZWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS2ACXZWFrmMdlStdType; (*Type mcMS2ACXZWFM_STD settings*)
	END_STRUCT;
	McMS2ACXZCplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling*)
	END_STRUCT;
	McCfgMS2AxCncXZType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_2AX_CNC_XZ*)
		CoordinatesNames : McMS2ACXZCoorNameType; (*Coordinates names*)
		WireFrameModel : McMS2ACXZWFrmMdlType; (*Wire frame model of mechanical system*)
		Couplings : McMS2ACXZCplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt2AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS2ACYZCoorNameCmnType : STRUCT (*Common settings for all Type values*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
	END_STRUCT;
	McMS2ACYZCoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS2ACYZCoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS2ACYZWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS2ACYZWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS2ACYZWFrmMdlStdType : STRUCT (*Type mcMS2ACYZWFM_STD settings*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS2ACYZWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS2ACYZWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS2ACYZWFrmMdlStdType; (*Type mcMS2ACYZWFM_STD settings*)
	END_STRUCT;
	McMS2ACYZCplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling*)
	END_STRUCT;
	McCfgMS2AxCncYZType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_2AX_CNC_YZ*)
		CoordinatesNames : McMS2ACYZCoorNameType; (*Coordinates names*)
		WireFrameModel : McMS2ACYZWFrmMdlType; (*Wire frame model of mechanical system*)
		Couplings : McMS2ACYZCplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt2AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS3ACXYZCoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
	END_STRUCT;
	McMS3ACXYZCoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS3ACXYZCoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS3ACXYZWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS3ACXYZWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS3ACXYZWFrmMdlStdType : STRUCT (*Type mcMS3ACXYZWFM_STD settings*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS3ACXYZWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS3ACXYZWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS3ACXYZWFrmMdlStdType; (*Type mcMS3ACXYZWFM_STD settings*)
	END_STRUCT;
	McMSCplg3LinCplgSrcAxEnum :
		( (*Index of the axis which influences the joint axis*)
		mcMSC3LCSA_AX_1 := 0, (*Axis 1 - Axis 1*)
		mcMSC3LCSA_AX_2 := 1, (*Axis 2 - Axis 2*)
		mcMSC3LCSA_AX_3 := 2 (*Axis 3 - Axis 3*)
		);
	McMSCplg3LinCplgTgtJntAxEnum :
		( (*Index of the joint axis which is influenced*)
		mcMSC3LCTJA_JNT_AX_1 := 0, (*Joint axis 1 - Joint axis 1*)
		mcMSC3LCTJA_JNT_AX_2 := 1, (*Joint axis 2 - Joint axis 2*)
		mcMSC3LCTJA_JNT_AX_3 := 2 (*Joint axis 3 - Joint axis 3*)
		);
	McMSCplg3LinCplgType : STRUCT (*Linear coupling*)
		SourceAxis : McMSCplg3LinCplgSrcAxEnum; (*Index of the axis which influences the joint axis*)
		SourceAxisUnits : LREAL; (*Units of the axis which influences the joint axis [measurement units]*)
		TargetJointAxis : McMSCplg3LinCplgTgtJntAxEnum; (*Index of the joint axis which is influenced*)
		TargetJointAxisUnits : LREAL; (*Units of the joint axis due to influence [measurement units]*)
	END_STRUCT;
	McMS3ACXYZCplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling*)
	END_STRUCT;
	McMSJnt3AxPosLimType : STRUCT (*Position limits for joint axis*)
		JointAxis : ARRAY[0..2] OF McMSJntAxPosLimType; (*Limits for joint axis*)
	END_STRUCT;
	McCfgMS3AxCncXYZType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_3AX_CNC_XYZ*)
		CoordinatesNames : McMS3ACXYZCoorNameType; (*Coordinates names*)
		WireFrameModel : McMS3ACXYZWFrmMdlType; (*Wire frame model of mechanical system*)
		Couplings : McMS3ACXYZCplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt3AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS4ACXYZBDescEnum :
		( (*Description selector setting*)
		mcMS4ACXYZBD_STD := 0 (*Standard - Standard description*)
		);
	McMS4ACXYZBDSDimType : STRUCT (*Dimensions of the mechanical system*)
		TranslationFromBaseToQX : McCfgTransXType; (*Translation from base of the mechanical system to QX*)
		TranslationFromQXToQY : McCfgTransYType; (*Translation from QX to QY*)
		TranslationFromQYToQZ : McCfgTransZType; (*Translation from QY to QZ*)
		TranslationFromQZToQB : McCfgTransXYZType; (*Translation from QZ to QB*)
		TranslationFromQBToFlange : McCfgTransXYZType; (*Translation from QB to flange*)
	END_STRUCT;
	McMSMdl4ZeroPosOffType : STRUCT (*Offsets between desired and internal zero position*)
		JointAxis : ARRAY[0..3] OF LREAL; (*Offset for joint axis [measurement units]*)
	END_STRUCT;
	McMSMdl4CntDirJntAxEnum :
		( (*Count direction for joint axis*)
		mcMSM4CDJA_STD := 0, (*Standard - Equal to the mechanical system definition*)
		mcMSM4CDJA_INV := 1 (*Inverse - Inverse to the mechanical system definition*)
		);
	McMSMdl4CntDirType : STRUCT (*Count direction for joint axes relative to the internal model*)
		JointAxis : ARRAY[0..3] OF McMSMdl4CntDirJntAxEnum; (*Count direction for joint axis*)
	END_STRUCT;
	McMS4ACXYZBDSType : STRUCT (*Type mcMS4ACXYZBD_STD settings*)
		Dimensions : McMS4ACXYZBDSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl4ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl4CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS4ACXYZBDescType : STRUCT (*Description of the mechanical system*)
		Type : McMS4ACXYZBDescEnum; (*Description selector setting*)
		Standard : McMS4ACXYZBDSType; (*Type mcMS4ACXYZBD_STD settings*)
	END_STRUCT;
	McMS4ACXYZBCoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		BCoordinateName : STRING[250]; (*B coordinate name*)
	END_STRUCT;
	McMS4ACXYZBCoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS4ACXYZBCoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS4ACXYZBWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS4ACXYZBWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS4ACXYZBWFrmMdlStdType : STRUCT (*Type mcMS4ACXYZBWFM_STD settings*)
		QZToQB : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		QBToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS4ACXYZBWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS4ACXYZBWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS4ACXYZBWFrmMdlStdType; (*Type mcMS4ACXYZBWFM_STD settings*)
	END_STRUCT;
	McMSCplg4LinCplgSrcAxEnum :
		( (*Index of the axis which influences the joint axis*)
		mcMSC4LCSA_AX_1 := 0, (*Axis 1 - Axis 1*)
		mcMSC4LCSA_AX_2 := 1, (*Axis 2 - Axis 2*)
		mcMSC4LCSA_AX_3 := 2, (*Axis 3 - Axis 3*)
		mcMSC4LCSA_AX_4 := 3 (*Axis 4 - Axis 4*)
		);
	McMSCplg4LinCplgTgtJntAxEnum :
		( (*Index of the joint axis which is influenced*)
		mcMSC4LCTJA_JNT_AX_1 := 0, (*Joint axis 1 - Joint axis 1*)
		mcMSC4LCTJA_JNT_AX_2 := 1, (*Joint axis 2 - Joint axis 2*)
		mcMSC4LCTJA_JNT_AX_3 := 2, (*Joint axis 3 - Joint axis 3*)
		mcMSC4LCTJA_JNT_AX_4 := 3 (*Joint axis 4 - Joint axis 4*)
		);
	McMSCplg4LinCplgType : STRUCT (*Linear coupling*)
		SourceAxis : McMSCplg4LinCplgSrcAxEnum; (*Index of the axis which influences the joint axis*)
		SourceAxisUnits : LREAL; (*Units of the axis which influences the joint axis [measurement units]*)
		TargetJointAxis : McMSCplg4LinCplgTgtJntAxEnum; (*Index of the joint axis which is influenced*)
		TargetJointAxisUnits : LREAL; (*Units of the joint axis due to influence [measurement units]*)
	END_STRUCT;
	McMS4ACXYZBCplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling*)
	END_STRUCT;
	McMSJnt4AxPosLimType : STRUCT (*Position limits for joint axis*)
		JointAxis : ARRAY[0..3] OF McMSJntAxPosLimType; (*Limits for joint axis*)
	END_STRUCT;
	McCfgMS4AxCncXYZBType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_4AX_CNC_XYZB*)
		Description : McMS4ACXYZBDescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS4ACXYZBCoorNameType; (*Coordinates names*)
		WireFrameModel : McMS4ACXYZBWFrmMdlType; (*Wire frame model of mechanical system*)
		Couplings : McMS4ACXYZBCplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt4AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS4ACXYZCDescEnum :
		( (*Description selector setting*)
		mcMS4ACXYZCD_STD := 0 (*Standard - Standard description*)
		);
	McMS4ACXYZCDSDimType : STRUCT (*Dimensions of the mechanical system*)
		TranslationFromBaseToQX : McCfgTransXType; (*Translation from base of the mechanical system to QX*)
		TranslationFromQXToQY : McCfgTransYType; (*Translation from QX to QY*)
		TranslationFromQYToQZ : McCfgTransZType; (*Translation from QY to QZ*)
		TranslationFromQZToQC : McCfgTransXYZType; (*Translation from QZ to QC*)
		TranslationFromQCToFlange : McCfgTransXYZType; (*Translation from QC to flange*)
	END_STRUCT;
	McMS4ACXYZCDSType : STRUCT (*Type mcMS4ACXYZCD_STD settings*)
		Dimensions : McMS4ACXYZCDSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl4ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl4CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS4ACXYZCDescType : STRUCT (*Description of the mechanical system*)
		Type : McMS4ACXYZCDescEnum; (*Description selector setting*)
		Standard : McMS4ACXYZCDSType; (*Type mcMS4ACXYZCD_STD settings*)
	END_STRUCT;
	McMS4ACXYZCCoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		CCoordinateName : STRING[250]; (*C coordinate name*)
	END_STRUCT;
	McMS4ACXYZCCoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS4ACXYZCCoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS4ACXYZCWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS4ACXYZCWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS4ACXYZCWFrmMdlStdType : STRUCT (*Type mcMS4ACXYZCWFM_STD settings*)
		QZToQC : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		QCToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS4ACXYZCWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS4ACXYZCWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS4ACXYZCWFrmMdlStdType; (*Type mcMS4ACXYZCWFM_STD settings*)
	END_STRUCT;
	McMS4ACXYZCCplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling*)
	END_STRUCT;
	McCfgMS4AxCncXYZCType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_4AX_CNC_XYZC*)
		Description : McMS4ACXYZCDescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS4ACXYZCCoorNameType; (*Coordinates names*)
		WireFrameModel : McMS4ACXYZCWFrmMdlType; (*Wire frame model of mechanical system*)
		Couplings : McMS4ACXYZCCplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt4AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS5ACXYZCADescEnum :
		( (*Description selector setting*)
		mcMS5ACXYZCAD_STD := 0 (*Standard - Standard description*)
		);
	McMS5ACXYZCADSDimType : STRUCT (*Dimensions of the mechanical system*)
		TranslationFromBaseToQX : McCfgTransXType; (*Translation from base of the mechanical system to QX*)
		TranslationFromQXToQY : McCfgTransYType; (*Translation from QX to QY*)
		TranslationFromQYToQZ : McCfgTransZType; (*Translation from QY to QZ*)
		TranslationFromQZToQC : McCfgTransXYZType; (*Translation from QZ to QC*)
		TranslationFromQCToQA : McCfgTransXYZType; (*Translation from QC to QA*)
		TranslationFromQAToFlange : McCfgTransXYZType; (*Translation from QA to flange*)
	END_STRUCT;
	McMSMdl5ZeroPosOffType : STRUCT (*Offsets between desired and internal zero position*)
		JointAxis : ARRAY[0..4] OF LREAL; (*Offset for joint axis [measurement units]*)
	END_STRUCT;
	McMSMdl5CntDirJntAxEnum :
		( (*Count direction for joint axis*)
		mcMSM5CDJA_STD := 0, (*Standard - Equal to the mechanical system definition*)
		mcMSM5CDJA_INV := 1 (*Inverse - Inverse to the mechanical system definition*)
		);
	McMSMdl5CntDirType : STRUCT (*Count direction for joint axes relative to the internal model*)
		JointAxis : ARRAY[0..4] OF McMSMdl5CntDirJntAxEnum; (*Count direction for joint axis*)
	END_STRUCT;
	McMS5ACXYZCADSType : STRUCT (*Type mcMS5ACXYZCAD_STD settings*)
		Dimensions : McMS5ACXYZCADSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl5ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl5CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS5ACXYZCADescType : STRUCT (*Description of the mechanical system*)
		Type : McMS5ACXYZCADescEnum; (*Description selector setting*)
		Standard : McMS5ACXYZCADSType; (*Type mcMS5ACXYZCAD_STD settings*)
	END_STRUCT;
	McMS5ACXYZCACoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		CCoordinateName : STRING[250]; (*C coordinate name*)
		ACoordinateName : STRING[250]; (*A coordinate name*)
	END_STRUCT;
	McMS5ACXYZCACoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS5ACXYZCACoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS5ACXYZCAWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS5ACXYZCAWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS5ACXYZCAWFrmMdlStdType : STRUCT (*Type mcMS5ACXYZCAWFM_STD settings*)
		QZToQC : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		QCToQA : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		QAToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS5ACXYZCAWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS5ACXYZCAWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS5ACXYZCAWFrmMdlStdType; (*Type mcMS5ACXYZCAWFM_STD settings*)
	END_STRUCT;
	McMSCplg5LinCplgSrcAxEnum :
		( (*Index of the axis which influences the joint axis*)
		mcMSC5LCSA_AX_1 := 0, (*Axis 1 - Axis 1*)
		mcMSC5LCSA_AX_2 := 1, (*Axis 2 - Axis 2*)
		mcMSC5LCSA_AX_3 := 2, (*Axis 3 - Axis 3*)
		mcMSC5LCSA_AX_4 := 3, (*Axis 4 - Axis 4*)
		mcMSC5LCSA_AX_5 := 4 (*Axis 5 - Axis 5*)
		);
	McMSCplg5LinCplgTgtJntAxEnum :
		( (*Index of the joint axis which is influenced*)
		mcMSC5LCTJA_JNT_AX_1 := 0, (*Joint axis 1 - Joint axis 1*)
		mcMSC5LCTJA_JNT_AX_2 := 1, (*Joint axis 2 - Joint axis 2*)
		mcMSC5LCTJA_JNT_AX_3 := 2, (*Joint axis 3 - Joint axis 3*)
		mcMSC5LCTJA_JNT_AX_4 := 3, (*Joint axis 4 - Joint axis 4*)
		mcMSC5LCTJA_JNT_AX_5 := 4 (*Joint axis 5 - Joint axis 5*)
		);
	McMSCplg5LinCplgType : STRUCT (*Linear coupling*)
		SourceAxis : McMSCplg5LinCplgSrcAxEnum; (*Index of the axis which influences the joint axis*)
		SourceAxisUnits : LREAL; (*Units of the axis which influences the joint axis [measurement units]*)
		TargetJointAxis : McMSCplg5LinCplgTgtJntAxEnum; (*Index of the joint axis which is influenced*)
		TargetJointAxisUnits : LREAL; (*Units of the joint axis due to influence [measurement units]*)
	END_STRUCT;
	McMS5ACXYZCACplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling*)
	END_STRUCT;
	McMSJnt5AxPosLimType : STRUCT (*Position limits for joint axis*)
		JointAxis : ARRAY[0..4] OF McMSJntAxPosLimType; (*Limits for joint axis*)
	END_STRUCT;
	McCfgMS5AxCncXYZCAType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_5AX_CNC_XYZCA*)
		Description : McMS5ACXYZCADescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS5ACXYZCACoorNameType; (*Coordinates names*)
		WireFrameModel : McMS5ACXYZCAWFrmMdlType; (*Wire frame model of mechanical system*)
		Couplings : McMS5ACXYZCACplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt5AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS6ACZXYBCADescEnum :
		( (*Description selector setting*)
		mcMS6ACZXYBCAD_STD := 0 (*Standard - Standard description*)
		);
	McMS6ACZXYBCADSDimType : STRUCT (*Dimensions of the mechanical system*)
		TranslationFromBaseToQZ : McCfgTransZType; (*Translation from base of the mechanical system to QZ*)
		TranslationFromQZToQX : McCfgTransXType; (*Translation from QZ to QX*)
		TranslationFromQXToQY : McCfgTransYType; (*Translation from QX to QY*)
		TranslationFromQYToQB : McCfgTransXYZType; (*Translation from QY to QB*)
		TranslationFromQBToQC : McCfgTransXYZType; (*Translation from QB to QC*)
		TranslationFromQCToQA : McCfgTransXYZType; (*Translation from QC to QA*)
		TranslationFromQAToFlange : McCfgTransXYZType; (*Translation from QA to flange*)
	END_STRUCT;
	McMSMdl6ZeroPosOffType : STRUCT (*Offsets between desired and internal zero position*)
		JointAxis : ARRAY[0..5] OF LREAL; (*Offset for joint axis [measurement units]*)
	END_STRUCT;
	McMSMdl6CntDirJntAxEnum :
		( (*Count direction for joint axis*)
		mcMSM6CDJA_STD := 0, (*Standard - Equal to the mechanical system definition*)
		mcMSM6CDJA_INV := 1 (*Inverse - Inverse to the mechanical system definition*)
		);
	McMSMdl6CntDirType : STRUCT (*Count direction for joint axes relative to the internal model*)
		JointAxis : ARRAY[0..5] OF McMSMdl6CntDirJntAxEnum; (*Count direction for joint axis*)
	END_STRUCT;
	McMS6ACZXYBCADSType : STRUCT (*Type mcMS6ACZXYBCAD_STD settings*)
		Dimensions : McMS6ACZXYBCADSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl6ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl6CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS6ACZXYBCADescType : STRUCT (*Description of the mechanical system*)
		Type : McMS6ACZXYBCADescEnum; (*Description selector setting*)
		Standard : McMS6ACZXYBCADSType; (*Type mcMS6ACZXYBCAD_STD settings*)
	END_STRUCT;
	McMS6ACZXYBCACoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		ACoordinateName : STRING[250]; (*A coordinate name*)
		BCoordinateName : STRING[250]; (*B coordinate name*)
		CCoordinateName : STRING[250]; (*C coordinate name*)
	END_STRUCT;
	McMS6ACZXYBCACoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS6ACZXYBCACoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS6ACZXYBCAWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS6ACZXYBCAWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS6ACZXYBCAWFrmMdlStdType : STRUCT (*Type mcMS6ACZXYBCAWFM_STD settings*)
		QYToQB : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		QBToQC : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		QCToQA : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		QAToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS6ACZXYBCAWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS6ACZXYBCAWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS6ACZXYBCAWFrmMdlStdType; (*Type mcMS6ACZXYBCAWFM_STD settings*)
	END_STRUCT;
	McMSCplg6LinCplgSrcAxEnum :
		( (*Index of the axis which influences the joint axis*)
		mcMSC6LCSA_AX_1 := 0, (*Axis 1 - Axis 1*)
		mcMSC6LCSA_AX_2 := 1, (*Axis 2 - Axis 2*)
		mcMSC6LCSA_AX_3 := 2, (*Axis 3 - Axis 3*)
		mcMSC6LCSA_AX_4 := 3, (*Axis 4 - Axis 4*)
		mcMSC6LCSA_AX_5 := 4, (*Axis 5 - Axis 5*)
		mcMSC6LCSA_AX_6 := 5 (*Axis 6 - Axis 6*)
		);
	McMSCplg6LinCplgTgtJntAxEnum :
		( (*Index of the joint axis which is influenced*)
		mcMSC6LCTJA_JNT_AX_1 := 0, (*Joint axis 1 - Joint axis 1*)
		mcMSC6LCTJA_JNT_AX_2 := 1, (*Joint axis 2 - Joint axis 2*)
		mcMSC6LCTJA_JNT_AX_3 := 2, (*Joint axis 3 - Joint axis 3*)
		mcMSC6LCTJA_JNT_AX_4 := 3, (*Joint axis 4 - Joint axis 4*)
		mcMSC6LCTJA_JNT_AX_5 := 4, (*Joint axis 5 - Joint axis 5*)
		mcMSC6LCTJA_JNT_AX_6 := 5 (*Joint axis 6 - Joint axis 6*)
		);
	McMSCplg6LinCplgType : STRUCT (*Linear coupling*)
		SourceAxis : McMSCplg6LinCplgSrcAxEnum; (*Index of the axis which influences the joint axis*)
		SourceAxisUnits : LREAL; (*Units of the axis which influences the joint axis [measurement units]*)
		TargetJointAxis : McMSCplg6LinCplgTgtJntAxEnum; (*Index of the joint axis which is influenced*)
		TargetJointAxisUnits : LREAL; (*Units of the joint axis due to influence [measurement units]*)
	END_STRUCT;
	McMS6ACZXYBCACplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling*)
	END_STRUCT;
	McMSJnt6AxPosLimType : STRUCT (*Position limits for joint axis*)
		JointAxis : ARRAY[0..5] OF McMSJntAxPosLimType; (*Limits for joint axis*)
	END_STRUCT;
	McCfgMS6AxCncZXYBCAType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_6AX_CNC_ZXYBCA*)
		Description : McMS6ACZXYBCADescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS6ACZXYBCACoorNameType; (*Coordinates names*)
		WireFrameModel : McMS6ACZXYBCAWFrmMdlType; (*Wire frame model of mechanical system*)
		Couplings : McMS6ACZXYBCACplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt6AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS4ASADescEnum :
		( (*Description selector setting*)
		mcMS4ASAD_STD := 0 (*Standard - Standard description*)
		);
	McMS4ASADSDimTransFromQ1ToQ2Type : STRUCT (*Translation from Q1 to Q2*)
		XY : LREAL; (*Distance in the plane XY [measurement units]*)
		Z : LREAL; (*Translation in Z direction [measurement units]*)
	END_STRUCT;
	McMS4ASADSDimTransFromQ2ToQZType : STRUCT (*Translation from Q2 to QZ*)
		XY : LREAL; (*Distance in the plane XY [measurement units]*)
		Z : LREAL; (*Translation in Z direction [measurement units]*)
	END_STRUCT;
	McMS4ASADSDimType : STRUCT (*Dimensions of the mechanical system*)
		TranslationFromBaseToQ1 : McCfgTransXYZType; (*Translation from base to Q1*)
		TranslationFromQ1ToQ2 : McMS4ASADSDimTransFromQ1ToQ2Type; (*Translation from Q1 to Q2*)
		TranslationFromQ2ToQZ : McMS4ASADSDimTransFromQ2ToQZType; (*Translation from Q2 to QZ*)
		TranslationFromQZToQC : McCfgTransZType; (*Translation from QZ to QC*)
		TranslationFromQCToFlange : McCfgTransXYZType; (*Translation from QC to flange*)
	END_STRUCT;
	McMS4ASADSType : STRUCT (*Type mcMS4ASAD_STD settings*)
		Dimensions : McMS4ASADSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl4ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl4CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS4ASADescType : STRUCT (*Description of the mechanical system*)
		Type : McMS4ASADescEnum; (*Description selector setting*)
		Standard : McMS4ASADSType; (*Type mcMS4ASAD_STD settings*)
	END_STRUCT;
	McMS4ASACoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		CCoordinateName : STRING[250]; (*C coordinate name*)
	END_STRUCT;
	McMS4ASACoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS4ASACoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS4ASAWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS4ASAWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS4ASAWFrmMdlStdType : STRUCT (*Type mcMS4ASAWFM_STD settings*)
		Q1ToQ2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q2ToQZ : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		QZToQC : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		QCToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS4ASAWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS4ASAWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS4ASAWFrmMdlStdType; (*Type mcMS4ASAWFM_STD settings*)
	END_STRUCT;
	McMSDynMdlEnum :
		( (*Dynamic model selector setting*)
		mcMSDM_DYNPARTABLE := 0 (*DynParTable - Table definition of dynamic model parameters*)
		);
	McMSDynMdlDynParTableType : STRUCT (*Type mcMSDM_DYNPARTABLE settings*)
		TableReference : McCfgReferenceType; (*Name of the table reference*)
	END_STRUCT;
	McMSDynMdlType : STRUCT (*Dynamic model of the mechanical system*)
		Type : McMSDynMdlEnum; (*Dynamic model selector setting*)
		DynParTable : McMSDynMdlDynParTableType; (*Type mcMSDM_DYNPARTABLE settings*)
	END_STRUCT;
	McMS4ASACplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling*)
	END_STRUCT;
	McCfgMS4AxScaraAType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_4AX_SCARA_A*)
		Description : McMS4ASADescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS4ASACoorNameType; (*Coordinates names*)
		WireFrameModel : McMS4ASAWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMSDynMdlType; (*Dynamic model of the mechanical system*)
		Couplings : McMS4ASACplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt4AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS2ADADescEnum :
		( (*Description selector setting*)
		mcMS2ADAD_STD := 0 (*Standard - Standard description*)
		);
	McMS2ADADSDBPltArmLinkPtType : STRUCT (*Geometrical resource to define the position of a joint*)
		X : LREAL; (*X-offset from the center [measurement units]*)
		Z : LREAL; (*Z-offset from the center [measurement units]*)
	END_STRUCT;
	McMS2ADADSDBPltType : STRUCT (*Fixed platform*)
		Center : McCfgTransXZType; (*Center of the base platform*)
		ArmLinkPoint : ARRAY[0..1] OF McMS2ADADSDBPltArmLinkPtType; (*Geometrical resource to define the position of a joint*)
	END_STRUCT;
	McMSDeltaDSDArmType : STRUCT (*Serial kinematic chain connecting base platform and end-effector platform*)
		UpperArmLength : LREAL; (*Length of the upper arm [measurement units]*)
		LowerArmLength : LREAL; (*Length of the lower arm [measurement units]*)
	END_STRUCT;
	McMS2ADADSDimArmType : STRUCT (*Description of arms*)
		Arm : ARRAY[0..1] OF McMSDeltaDSDArmType; (*Serial kinematic chain connecting base platform and end-effector platform*)
	END_STRUCT;
	McMS2ADADSDEEPltArmLinkPtType : STRUCT (*Point where the arm is linked to the end-effector platform*)
		X : LREAL; (*X-offset from the center of the end-effector platform [measurement units]*)
		Z : LREAL; (*Z-offset from the center of the end-effector platform [measurement units]*)
	END_STRUCT;
	McMS2ADADSDEEPltType : STRUCT (*Moving platform*)
		ArmLinkPoint : ARRAY[0..1] OF McMS2ADADSDEEPltArmLinkPtType; (*Point where the arm is linked to the end-effector platform*)
		TranslationToFlange : McCfgTransXZType; (*Translation from the center of the end-effector platform to flange*)
	END_STRUCT;
	McMS2ADADSDimType : STRUCT (*Dimensions of the mechanical system*)
		BasePlatform : McMS2ADADSDBPltType; (*Fixed platform*)
		Arms : McMS2ADADSDimArmType; (*Description of arms*)
		EndEffectorPlatform : McMS2ADADSDEEPltType; (*Moving platform*)
	END_STRUCT;
	McMSMdl2ZeroPosOffType : STRUCT (*Offsets between desired and internal zero position*)
		JointAxis : ARRAY[0..1] OF LREAL; (*Offset for joint axis [measurement units]*)
	END_STRUCT;
	McMSMdl2CntDirJntAxEnum :
		( (*Count direction for joint axis*)
		mcMSM2CDJA_STD := 0, (*Standard - Equal to the mechanical system definition*)
		mcMSM2CDJA_INV := 1 (*Inverse - Inverse to the mechanical system definition*)
		);
	McMSMdl2CntDirType : STRUCT (*Count direction for joint axes relative to the internal model*)
		JointAxis : ARRAY[0..1] OF McMSMdl2CntDirJntAxEnum; (*Count direction for joint axis*)
	END_STRUCT;
	McMS2ADADSType : STRUCT (*Type mcMS2ADAD_STD settings*)
		Dimensions : McMS2ADADSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl2ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl2CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS2ADADescType : STRUCT (*Description of the mechanical system*)
		Type : McMS2ADADescEnum; (*Description selector setting*)
		Standard : McMS2ADADSType; (*Type mcMS2ADAD_STD settings*)
	END_STRUCT;
	McMS2ADACoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
	END_STRUCT;
	McMS2ADACoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS2ADACoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS2ADAWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS2ADAWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS2ADAWFrmMdlStdType : STRUCT (*Type mcMS2ADAWFM_STD settings*)
		UpperArm1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LowerArm1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		UpperArm2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LowerArm2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		EndEffectorPlatformToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS2ADAWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS2ADAWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS2ADAWFrmMdlStdType; (*Type mcMS2ADAWFM_STD settings*)
	END_STRUCT;
	McMS2ADACplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling*)
	END_STRUCT;
	McCfgMS2AxDeltaAType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_2AX_DELTA_A*)
		Description : McMS2ADADescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS2ADACoorNameType; (*Coordinates names*)
		WireFrameModel : McMS2ADAWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMSDynMdlType; (*Dynamic model of the mechanical system*)
		Couplings : McMS2ADACplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt2AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS3ADADescEnum :
		( (*Description selector setting*)
		mcMS3ADAD_STD := 0 (*Standard - Standard description*)
		);
	McMSDeltaDSDBPArmLinkPtType : STRUCT (*Geometrical resource to define the position of a joint*)
		Angle : LREAL; (*Angular distance from the center (starting from zero) [measurement units]*)
		Radius : LREAL; (*Distance from the center [measurement units]*)
		Z : LREAL; (*Z-offset from the center [measurement units]*)
	END_STRUCT;
	McMS3ADADSDBPltType : STRUCT (*Fixed platform*)
		Center : McCfgTransXYZType; (*Center of the base platform*)
		ArmLinkPoint : ARRAY[0..2] OF McMSDeltaDSDBPArmLinkPtType; (*Geometrical resource to define the position of a joint*)
	END_STRUCT;
	McMS3ADADSDimArmType : STRUCT (*Description of arms*)
		Arm : ARRAY[0..2] OF McMSDeltaDSDArmType; (*Serial kinematic chain connecting base platform and end-effector platform*)
	END_STRUCT;
	McMSDeltaDSDEEPArmLinkPtType : STRUCT (*Point where the arm is linked to the end-effector platform*)
		Radius : LREAL; (*Distance from the center of the end-effector platform [measurement units]*)
		Z : LREAL; (*Z-offset from the center of the end-effector platform [measurement units]*)
	END_STRUCT;
	McMSTransXYZType : STRUCT (*Translation from the center of the end-effector platform to flange*)
		X : LREAL; (*Translation in X direction [measurement units]*)
		Y : LREAL; (*Translation in Y direction [measurement units]*)
		Z : LREAL; (*Translation in Z direction [measurement units]*)
	END_STRUCT;
	McMS3ADADSDEEPltType : STRUCT (*Moving platform*)
		ArmLinkPoint : ARRAY[0..2] OF McMSDeltaDSDEEPArmLinkPtType; (*Point where the arm is linked to the end-effector platform*)
		TranslationToFlange : McMSTransXYZType; (*Translation from the center of the end-effector platform to flange*)
	END_STRUCT;
	McMS3ADADSDimType : STRUCT (*Dimensions of the mechanical system*)
		BasePlatform : McMS3ADADSDBPltType; (*Fixed platform*)
		Arms : McMS3ADADSDimArmType; (*Description of arms*)
		EndEffectorPlatform : McMS3ADADSDEEPltType; (*Moving platform*)
	END_STRUCT;
	McMSMdl3ZeroPosOffType : STRUCT (*Offsets between desired and internal zero position*)
		JointAxis : ARRAY[0..2] OF LREAL; (*Offset for joint axis [measurement units]*)
	END_STRUCT;
	McMSMdl3CntDirJntAxEnum :
		( (*Count direction for joint axis*)
		mcMSM3CDJA_STD := 0, (*Standard - Equal to the mechanical system definition*)
		mcMSM3CDJA_INV := 1 (*Inverse - Inverse to the mechanical system definition*)
		);
	McMSMdl3CntDirType : STRUCT (*Count direction for joint axes relative to the internal model*)
		JointAxis : ARRAY[0..2] OF McMSMdl3CntDirJntAxEnum; (*Count direction for joint axis*)
	END_STRUCT;
	McMS3ADADSType : STRUCT (*Type mcMS3ADAD_STD settings*)
		Dimensions : McMS3ADADSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl3ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl3CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS3ADADescType : STRUCT (*Description of the mechanical system*)
		Type : McMS3ADADescEnum; (*Description selector setting*)
		Standard : McMS3ADADSType; (*Type mcMS3ADAD_STD settings*)
	END_STRUCT;
	McMS3ADACoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
	END_STRUCT;
	McMS3ADACoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS3ADACoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS3ADAWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS3ADAWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS3ADAWFrmMdlStdType : STRUCT (*Type mcMS3ADAWFM_STD settings*)
		UpperArm1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LowerArm1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		UpperArm2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LowerArm2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		UpperArm3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LowerArm3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		EndEffectorPlatformToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS3ADAWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS3ADAWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS3ADAWFrmMdlStdType; (*Type mcMS3ADAWFM_STD settings*)
	END_STRUCT;
	McMS3ADACplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling*)
	END_STRUCT;
	McCfgMS3AxDeltaAType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_3AX_DELTA_A*)
		Description : McMS3ADADescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS3ADACoorNameType; (*Coordinates names*)
		WireFrameModel : McMS3ADAWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMSDynMdlType; (*Dynamic model of the mechanical system*)
		Couplings : McMS3ADACplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt3AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS3ADXZBDescEnum :
		( (*Description selector setting*)
		mcMS3ADXZBD_STD := 0 (*Standard - Standard description*)
		);
	McMS3ADXZBDSDBPltArmLinkPtType : STRUCT (*Geometrical resource to define the position of a joint*)
		X : LREAL; (*X-offset from the center [measurement units]*)
		Z : LREAL; (*Z-offset from the center [measurement units]*)
	END_STRUCT;
	McMS3ADXZBDSDBPltType : STRUCT (*Fixed platform*)
		Center : McCfgTransXZType; (*Center of the base platform*)
		ArmLinkPoint : ARRAY[0..1] OF McMS3ADXZBDSDBPltArmLinkPtType; (*Geometrical resource to define the position of a joint*)
	END_STRUCT;
	McMS3ADXZBDSDimArmType : STRUCT (*Description of arms*)
		Arm : ARRAY[0..1] OF McMSDeltaDSDArmType; (*Serial kinematic chain connecting base platform and end-effector platform*)
	END_STRUCT;
	McMS3ADXZBDSDEEPltType : STRUCT (*Moving platform*)
		TranslationToFlange : McCfgTransXZType; (*Translation from the center of the end-effector platform to flange*)
	END_STRUCT;
	McMS3ADXZBDSDPPMBrktMntArmEnum :
		( (*Specifies which arm is the passive parallel mechanism mounted to*)
		mcMS3ADXZBDSDPPMBMA_ARM_1 := 0, (*Arm 1*)
		mcMS3ADXZBDSDPPMBMA_ARM_2 := 1 (*Arm 2*)
		);
	McMS3ADXZBDSDPPMType : STRUCT (*Description of the passive parallel mechanism between Q3 and B*)
		TranslationFromBaseToQ3 : McCfgTransXZType; (*Translation from base to Q3*)
		Q3Radius : LREAL; (*Radius of Q3 [measurement units]*)
		BracketLength : LREAL; (*Length of the upper part of the bracket [measurement units]*)
		BracketMountingArm : McMS3ADXZBDSDPPMBrktMntArmEnum; (*Specifies which arm is the passive parallel mechanism mounted to*)
	END_STRUCT;
	McMS3ADXZBDSDimType : STRUCT (*Dimensions of the mechanical system*)
		BasePlatform : McMS3ADXZBDSDBPltType; (*Fixed platform*)
		Arms : McMS3ADXZBDSDimArmType; (*Description of arms*)
		EndEffectorPlatform : McMS3ADXZBDSDEEPltType; (*Moving platform*)
		PassiveParallelMechanism : McMS3ADXZBDSDPPMType; (*Description of the passive parallel mechanism between Q3 and B*)
	END_STRUCT;
	McMS3ADXZBDSType : STRUCT (*Type mcMS3ADXZBD_STD settings*)
		Dimensions : McMS3ADXZBDSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl3ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl3CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS3ADXZBDescType : STRUCT (*Description of the mechanical system*)
		Type : McMS3ADXZBDescEnum; (*Description selector setting*)
		Standard : McMS3ADXZBDSType; (*Type mcMS3ADXZBD_STD settings*)
	END_STRUCT;
	McMS3ADXZBCoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		BCoordinateName : STRING[250]; (*B coordinate name*)
	END_STRUCT;
	McMS3ADXZBCoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS3ADXZBCoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS3ADXZBWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS3ADXZBWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS3ADXZBWFrmMdlStdType : STRUCT (*Type mcMS3ADXZBWFM_STD settings*)
		UpperArm1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LowerArm1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		UpperArm2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LowerArm2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		EndEffectorPlatformToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q3ToBracket : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		BracketToArm : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS3ADXZBWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS3ADXZBWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS3ADXZBWFrmMdlStdType; (*Type mcMS3ADXZBWFM_STD settings*)
	END_STRUCT;
	McMS3ADXZBCplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling*)
	END_STRUCT;
	McCfgMS3AxDeltaXZBType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_3AX_DELTA_XZB*)
		Description : McMS3ADXZBDescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS3ADXZBCoorNameType; (*Coordinates names*)
		WireFrameModel : McMS3ADXZBWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMSDynMdlType; (*Dynamic model of the mechanical system*)
		Couplings : McMS3ADXZBCplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt3AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS4ADADescEnum :
		( (*Description selector setting*)
		mcMS4ADAD_STD := 0 (*Standard - Standard description*)
		);
	McMS4ADADSDBPltType : STRUCT (*Fixed platform*)
		Center : McCfgTransXYZType; (*Center of the base platform*)
		ArmLinkPoint : ARRAY[0..2] OF McMSDeltaDSDBPArmLinkPtType; (*Geometrical resource to define the position of a joint*)
	END_STRUCT;
	McMS4ADADSDimArmType : STRUCT (*Description of arms*)
		Arm : ARRAY[0..2] OF McMSDeltaDSDArmType; (*Serial kinematic chain connecting base platform and end-effector platform*)
	END_STRUCT;
	McMS4ADADSDEEPltType : STRUCT (*Moving platform*)
		ArmLinkPoint : ARRAY[0..2] OF McMSDeltaDSDEEPArmLinkPtType; (*Point where the arm is linked to the end-effector platform*)
		TranslationToFlange : McCfgTransXYZType; (*Translation from the center of the end-effector platform to flange*)
	END_STRUCT;
	McMS4ADADSDimType : STRUCT (*Dimensions of the mechanical system*)
		BasePlatform : McMS4ADADSDBPltType; (*Fixed platform*)
		Arms : McMS4ADADSDimArmType; (*Description of arms*)
		EndEffectorPlatform : McMS4ADADSDEEPltType; (*Moving platform*)
	END_STRUCT;
	McMS4ADADSType : STRUCT (*Type mcMS4ADAD_STD settings*)
		Dimensions : McMS4ADADSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl4ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl4CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS4ADADescType : STRUCT (*Description of the mechanical system*)
		Type : McMS4ADADescEnum; (*Description selector setting*)
		Standard : McMS4ADADSType; (*Type mcMS4ADAD_STD settings*)
	END_STRUCT;
	McMS4ADACoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		CCoordinateName : STRING[250]; (*C coordinate name*)
	END_STRUCT;
	McMS4ADACoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS4ADACoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS4ADAWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS4ADAWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS4ADAWFrmMdlStdType : STRUCT (*Type mcMS4ADAWFM_STD settings*)
		UpperArm1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LowerArm1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		UpperArm2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LowerArm2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		UpperArm3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LowerArm3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		EndEffectorPlatformToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS4ADAWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS4ADAWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS4ADAWFrmMdlStdType; (*Type mcMS4ADAWFM_STD settings*)
	END_STRUCT;
	McMS4ADACplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling*)
	END_STRUCT;
	McCfgMS4AxDeltaAType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_4AX_DELTA_A*)
		Description : McMS4ADADescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS4ADACoorNameType; (*Coordinates names*)
		WireFrameModel : McMS4ADAWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMSDynMdlType; (*Dynamic model of the mechanical system*)
		Couplings : McMS4ADACplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt4AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS4ADBDescEnum :
		( (*Description selector setting*)
		mcMS4ADBD_STD := 0 (*Standard - Standard description*)
		);
	McMS4ADBDSDBPltType : STRUCT (*Fixed platform*)
		Center : McCfgTransXYZType; (*Center of the base platform*)
		ArmLinkPoint : ARRAY[0..2] OF McMSDeltaDSDBPArmLinkPtType; (*Geometrical resource to define the position of a joint*)
	END_STRUCT;
	McMSDeltaDSDArmLinType : STRUCT (*Serial kinematic chain connecting base platform and end-effector platform*)
		ArmLength : LREAL; (*Length of the arm [measurement units]*)
		Z : LREAL; (*Z-offset from the arm link point [measurement units]*)
	END_STRUCT;
	McMS4ADBDSDimArmType : STRUCT (*Description of arms*)
		Arm : ARRAY[0..2] OF McMSDeltaDSDArmLinType; (*Serial kinematic chain connecting base platform and end-effector platform*)
	END_STRUCT;
	McMS4ADBDSDEEPltType : STRUCT (*Moving platform*)
		ArmLinkPoint : ARRAY[0..2] OF McMSDeltaDSDEEPArmLinkPtType; (*Point where the arm is linked to the end-effector platform*)
		TranslationToFlange : McCfgTransXYZType; (*Translation from the center of the end-effector platform to flange*)
	END_STRUCT;
	McMS4ADBDSDimType : STRUCT (*Dimensions of the mechanical system*)
		BasePlatform : McMS4ADBDSDBPltType; (*Fixed platform*)
		Arms : McMS4ADBDSDimArmType; (*Description of arms*)
		EndEffectorPlatform : McMS4ADBDSDEEPltType; (*Moving platform*)
	END_STRUCT;
	McMS4ADBDSType : STRUCT (*Type mcMS4ADBD_STD settings*)
		Dimensions : McMS4ADBDSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl4ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl4CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS4ADBDescType : STRUCT (*Description of the mechanical system*)
		Type : McMS4ADBDescEnum; (*Description selector setting*)
		Standard : McMS4ADBDSType; (*Type mcMS4ADBD_STD settings*)
	END_STRUCT;
	McMS4ADBCoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		CCoordinateName : STRING[250]; (*C coordinate name*)
	END_STRUCT;
	McMS4ADBCoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS4ADBCoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS4ADBWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS4ADBWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS4ADBWFrmMdlStdType : STRUCT (*Type mcMS4ADBWFM_STD settings*)
		LinkPointToArm1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Arm1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LinkPointToArm2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Arm2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LinkPointToArm3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Arm3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		EndEffectorPlatformToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS4ADBWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS4ADBWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS4ADBWFrmMdlStdType; (*Type mcMS4ADBWFM_STD settings*)
	END_STRUCT;
	McMS4ADBCplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling*)
	END_STRUCT;
	McCfgMS4AxDeltaBType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_4AX_DELTA_B*)
		Description : McMS4ADBDescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS4ADBCoorNameType; (*Coordinates names*)
		WireFrameModel : McMS4ADBWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMSDynMdlType; (*Dynamic model of the mechanical system*)
		Couplings : McMS4ADBCplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt4AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS5ADADescEnum :
		( (*Description selector setting*)
		mcMS5ADAD_STD := 0 (*Standard - Standard description*)
		);
	McMS5ADADSDimBasePltType : STRUCT (*Fixed platform*)
		Center : McCfgTransXYZType; (*Center of the base platform*)
		ArmLinkPoint : ARRAY[0..2] OF McMSDeltaDSDBPArmLinkPtType; (*Geometrical resource to define the position of a joint*)
	END_STRUCT;
	McMS5ADADSDimArmType : STRUCT (*Description of arms*)
		Arm : ARRAY[0..2] OF McMSDeltaDSDArmType; (*Serial kinematic chain connecting base platform and end-effector platform*)
	END_STRUCT;
	McMS5ADADSDimEndEffPltType : STRUCT (*Moving platform*)
		ArmLinkPoint : ARRAY[0..2] OF McMSDeltaDSDEEPArmLinkPtType; (*Point where the arm is linked to the end-effector platform*)
		TranslationToQC : McCfgTransXYZType; (*Translation from the center of the end-effector platform to QC*)
		TranslationFromQCToQA : McCfgTransXYZType; (*Translation from QC to QA*)
		TranslationFromQAToFlange : McCfgTransXYZType; (*Translation from QA to flange*)
	END_STRUCT;
	McMS5ADADSDimType : STRUCT (*Dimensions of the mechanical system*)
		BasePlatform : McMS5ADADSDimBasePltType; (*Fixed platform*)
		Arms : McMS5ADADSDimArmType; (*Description of arms*)
		EndEffectorPlatform : McMS5ADADSDimEndEffPltType; (*Moving platform*)
	END_STRUCT;
	McMS5ADADSType : STRUCT (*Type mcMS5ADAD_STD settings*)
		Dimensions : McMS5ADADSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl5ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl5CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS5ADADescType : STRUCT (*Description of the mechanical system*)
		Type : McMS5ADADescEnum; (*Description selector setting*)
		Standard : McMS5ADADSType; (*Type mcMS5ADAD_STD settings*)
	END_STRUCT;
	McMS5ADACoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		CCoordinateName : STRING[250]; (*C coordinate name*)
		ACoordinateName : STRING[250]; (*A coordinate name*)
	END_STRUCT;
	McMS5ADACoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS5ADACoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS5ADAWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS5ADAWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS5ADAWFrmMdlStdType : STRUCT (*Type mcMS5ADAWFM_STD settings*)
		UpperArm1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LowerArm1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		UpperArm2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LowerArm2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		UpperArm3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		LowerArm3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		EndEffectorPlatformToQC : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		QCToQA : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		QAToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS5ADAWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS5ADAWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS5ADAWFrmMdlStdType; (*Type mcMS5ADAWFM_STD settings*)
	END_STRUCT;
	McMS5ADADynMdlEnum :
		( (*Dynamic model selector setting*)
		mcMS5ADADM_DYNPARTABLE := 0 (*DynParTable - Table definition of dynamic model parameters*)
		);
	McMS5ADADynMdlDynParTableType : STRUCT (*Type mcMS5ADADM_DYNPARTABLE settings*)
		TableReference : McCfgReferenceType; (*Name of the table reference*)
	END_STRUCT;
	McMS5ADADynMdlType : STRUCT (*Dynamic model of the mechanical system*)
		Type : McMS5ADADynMdlEnum; (*Dynamic model selector setting*)
		DynParTable : McMS5ADADynMdlDynParTableType; (*Type mcMS5ADADM_DYNPARTABLE settings*)
	END_STRUCT;
	McMS5ADACplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling*)
	END_STRUCT;
	McCfgMS5AxDeltaAType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_5AX_DELTA_A*)
		Description : McMS5ADADescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS5ADACoorNameType; (*Coordinates names*)
		WireFrameModel : McMS5ADAWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMS5ADADynMdlType; (*Dynamic model of the mechanical system*)
		Couplings : McMS5ADACplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt5AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS4ARADescEnum :
		( (*Description selector setting*)
		mcMS4ARAD_STD := 0 (*Standard - Standard description*)
		);
	McMS4ARADSDimType : STRUCT (*Dimensions of the mechanical system*)
		TranslationFromBaseToQ1 : McCfgTransXYZType; (*Translation from base to Q1*)
		TranslationFromQ1ToQ2 : McCfgTransXYZType; (*Translation from Q1 to Q2*)
		TranslationFromQ2ToQ3 : McCfgTransXYZType; (*Translation from Q2 to Q3*)
		TranslationFromQ3ToPQ1 : McCfgTransXYZType; (*Translation from Q3 to PQ1*)
		TranslationFromPQ1ToQ4 : McCfgTransXYZType; (*Translation from PQ1 to Q4*)
		TranslationFromQ4ToFlange : McCfgTransXYZType; (*Translation from Q4 to flange*)
	END_STRUCT;
	McMS4ARADSType : STRUCT (*Type mcMS4ARAD_STD settings*)
		Dimensions : McMS4ARADSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl4ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl4CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS4ARADescType : STRUCT (*Description of the mechanical system*)
		Type : McMS4ARADescEnum; (*Description selector setting*)
		Standard : McMS4ARADSType; (*Type mcMS4ARAD_STD settings*)
	END_STRUCT;
	McMS4ARACoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		CCoordinateName : STRING[250]; (*C coordinate name*)
	END_STRUCT;
	McMS4ARACoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS4ARACoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS4ARAWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS4ARAWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS4ARAWFrmMdlStdType : STRUCT (*Type mcMS4ARAWFM_STD settings*)
		Q1ToQ2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q2ToQ3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q3ToPQ1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		PQ1ToQ4 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q4ToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS4ARAWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS4ARAWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS4ARAWFrmMdlStdType; (*Type mcMS4ARAWFM_STD settings*)
	END_STRUCT;
	McMS4ARACplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling*)
	END_STRUCT;
	McCfgMS4AxRobAType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_4AX_ROB_A*)
		Description : McMS4ARADescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS4ARACoorNameType; (*Coordinates names*)
		WireFrameModel : McMS4ARAWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMSDynMdlType; (*Dynamic model of the mechanical system*)
		Couplings : McMS4ARACplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt4AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS4ARBDescEnum :
		( (*Description selector setting*)
		mcMS4ARBD_STD := 0 (*Standard - Standard description*)
		);
	McMS4ARBDSDimQ2CylinderType : STRUCT (*Q2 cylinder*)
		TranslationFromQ1ToAnchor : McCfgTransXYZType; (*Translation from Q1 to anchor*)
		TranslationFromQ2ToActuator : McCfgTransXYZType; (*Translation from Q2 to actuator*)
	END_STRUCT;
	McMS4ARBDSDimQ3CylinderType : STRUCT (*Q3 cylinder*)
		TranslationFromQ2ToAnchor : McCfgTransXYZType; (*Translation from Q2 to anchor*)
		TranslationFromQ3ToActuator : McCfgTransXYZType; (*Translation from Q3 to actuator*)
	END_STRUCT;
	McMS4ARBDSDimType : STRUCT (*Dimensions of the mechanical system*)
		TranslationFromBaseToQ1 : McCfgTransXYZType; (*Translation from base to Q1*)
		TranslationFromQ1ToQ2 : McCfgTransXYZType; (*Translation from Q1 to Q2*)
		TranslationFromQ2ToQ3 : McCfgTransXYZType; (*Translation from Q2 to Q3*)
		TranslationFromQ3ToPQ1 : McCfgTransXYZType; (*Translation from Q3 to PQ1*)
		TranslationFromPQ1ToQ4 : McCfgTransXYZType; (*Translation from PQ1 to Q4*)
		TranslationFromQ4ToFlange : McCfgTransXYZType; (*Translation from Q4 to flange*)
		Q2Cylinder : McMS4ARBDSDimQ2CylinderType; (*Q2 cylinder*)
		Q3Cylinder : McMS4ARBDSDimQ3CylinderType; (*Q3 cylinder*)
	END_STRUCT;
	McMS4ARBDSType : STRUCT (*Type mcMS4ARBD_STD settings*)
		Dimensions : McMS4ARBDSDimType; (*Dimensions of the mechanical system*)
	END_STRUCT;
	McMS4ARBDescType : STRUCT (*Description of the mechanical system*)
		Type : McMS4ARBDescEnum; (*Description selector setting*)
		Standard : McMS4ARBDSType; (*Type mcMS4ARBD_STD settings*)
	END_STRUCT;
	McMS4ARBCoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		CCoordinateName : STRING[250]; (*C coordinate name*)
	END_STRUCT;
	McMS4ARBCoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS4ARBCoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS4ARBWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS4ARBWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS4ARBWFrmMdlStdType : STRUCT (*Type mcMS4ARBWFM_STD settings*)
		Q1ToQ2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q2ToQ3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q3ToPQ1 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		PQ1ToQ4 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q4ToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q2AnchorToQ2Actuator : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q3AnchorToQ3Actuator : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS4ARBWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS4ARBWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS4ARBWFrmMdlStdType; (*Type mcMS4ARBWFM_STD settings*)
	END_STRUCT;
	McCfgMS4AxRobBType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_4AX_ROB_B*)
		Description : McMS4ARBDescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS4ARBCoorNameType; (*Coordinates names*)
		WireFrameModel : McMS4ARBWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMSDynMdlType; (*Dynamic model of the mechanical system*)
		JointAxesPositionLimits : McMSJnt4AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS5ARADescEnum :
		( (*Description selector setting*)
		mcMS5ARAD_STD := 0 (*Standard - Standard description*)
		);
	McMS5ARADSDimType : STRUCT (*Dimensions of the mechanical system*)
		TranslationFromBaseToQ1 : McCfgTransXYZType; (*Translation from base to Q1*)
		TranslationFromQ1ToQ2 : McCfgTransXYZType; (*Translation from Q1 to Q2*)
		TranslationFromQ2ToQ3 : McCfgTransXYZType; (*Translation from Q2 to Q3*)
		TranslationFromQ3ToQ4 : McCfgTransXYZType; (*Translation from Q3 to Q4*)
		TranslationFromQ4ToQ5 : McCfgTransXYZType; (*Translation from Q4 to Q5*)
		TranslationFromQ5ToFlange : McCfgTransXYZType; (*Translation from Q5 to flange*)
	END_STRUCT;
	McMS5ARADSType : STRUCT (*Type mcMS5ARAD_STD settings*)
		Dimensions : McMS5ARADSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl5ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl5CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS5ARADescType : STRUCT (*Description of the mechanical system*)
		Type : McMS5ARADescEnum; (*Description selector setting*)
		Standard : McMS5ARADSType; (*Type mcMS5ARAD_STD settings*)
	END_STRUCT;
	McMS5ARACoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		BCoordinateName : STRING[250]; (*B coordinate name*)
		CCoordinateName : STRING[250]; (*C coordinate name*)
	END_STRUCT;
	McMS5ARACoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS5ARACoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS5ARAWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS5ARAWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS5ARAWFrmMdlStdType : STRUCT (*Type mcMS5ARAWFM_STD settings*)
		Q1ToQ2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q2ToQ3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q3ToQ4 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q4ToQ5 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q5ToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS5ARAWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS5ARAWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS5ARAWFrmMdlStdType; (*Type mcMS5ARAWFM_STD settings*)
	END_STRUCT;
	McMS5ARACplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling*)
	END_STRUCT;
	McCfgMS5AxRobAType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_5AX_ROB_A*)
		Description : McMS5ARADescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS5ARACoorNameType; (*Coordinates names*)
		WireFrameModel : McMS5ARAWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMSDynMdlType; (*Dynamic model of the mechanical system*)
		Couplings : McMS5ARACplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt5AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS6ARADescEnum :
		( (*Description selector setting*)
		mcMS6ARAD_STD := 0 (*Standard - Standard description*)
		);
	McMS6ARADSDimType : STRUCT (*Dimensions of the mechanical system*)
		TranslationFromBaseToQ1 : McCfgTransXYZType; (*Translation from base to Q1*)
		TranslationFromQ1ToQ2 : McMSTransXYZType; (*Translation from Q1 to Q2*)
		TranslationFromQ2ToQ3 : McCfgTransXYZType; (*Translation from Q2 to Q3*)
		TranslationFromQ3ToQ4 : McCfgTransXYZType; (*Translation from Q3 to Q4*)
		TranslationFromQ4ToQ5 : McCfgTransXType; (*Translation from Q4 to Q5*)
		TranslationFromQ5ToQ6 : McCfgTransXType; (*Translation from Q5 to Q6*)
		TranslationFromQ6ToFlange : McCfgTransXYZType; (*Translation from Q6 to flange*)
	END_STRUCT;
	McMS6ARADSType : STRUCT (*Type mcMS6ARAD_STD settings*)
		Dimensions : McMS6ARADSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl6ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl6CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS6ARADescType : STRUCT (*Description of the mechanical system*)
		Type : McMS6ARADescEnum; (*Description selector setting*)
		Standard : McMS6ARADSType; (*Type mcMS6ARAD_STD settings*)
	END_STRUCT;
	McMS6ARACoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		ACoordinateName : STRING[250]; (*A coordinate name*)
		BCoordinateName : STRING[250]; (*B coordinate name*)
		CCoordinateName : STRING[250]; (*C coordinate name*)
	END_STRUCT;
	McMS6ARACoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS6ARACoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS6ARAWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS6ARAWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS6ARAWFrmMdlStdType : STRUCT (*Type mcMS6ARAWFM_STD settings*)
		Q1ToQ2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q2ToQ3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q3ToQ4 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q4ToQ5 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q5ToQ6 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q6ToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS6ARAWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS6ARAWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS6ARAWFrmMdlStdType; (*Type mcMS6ARAWFM_STD settings*)
	END_STRUCT;
	McMS6ARACplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling*)
	END_STRUCT;
	McCfgMS6AxRobAType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_6AX_ROB_A*)
		Description : McMS6ARADescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS6ARACoorNameType; (*Coordinates names*)
		WireFrameModel : McMS6ARAWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMSDynMdlType; (*Dynamic model of the mechanical system*)
		Couplings : McMS6ARACplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt6AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
	McMS6ARBDescEnum :
		( (*Description selector setting*)
		mcMS6ARBD_STD := 0 (*Standard - Standard description*)
		);
	McMS6ARBDSDimType : STRUCT (*Dimensions of the mechanical system*)
		TranslationFromBaseToQ1 : McCfgTransXYZType; (*Translation from base to Q1*)
		TranslationFromQ1ToQ2 : McCfgTransXYZType; (*Translation from Q1 to Q2*)
		TranslationFromQ2ToQ3 : McCfgTransXYZType; (*Translation from Q2 to Q3*)
		TranslationFromQ3ToQ4 : McCfgTransXYZType; (*Translation from Q3 to Q4*)
		TranslationFromQ4ToQ5 : McCfgTransZType; (*Translation from Q4 to Q5*)
		TranslationFromQ5ToQ6 : McCfgTransZType; (*Translation from Q5 to Q6*)
		TranslationFromQ6ToFlange : McCfgTransXYZType; (*Translation from Q6 to flange*)
	END_STRUCT;
	McMS6ARBDSType : STRUCT (*Type mcMS6ARBD_STD settings*)
		Dimensions : McMS6ARBDSDimType; (*Dimensions of the mechanical system*)
		ModelZeroPositionOffsets : McMSMdl6ZeroPosOffType; (*Offsets between desired and internal zero position*)
		ModelCountDirections : McMSMdl6CntDirType; (*Count direction for joint axes relative to the internal model*)
	END_STRUCT;
	McMS6ARBDescType : STRUCT (*Description of the mechanical system*)
		Type : McMS6ARBDescEnum; (*Description selector setting*)
		Standard : McMS6ARBDSType; (*Type mcMS6ARBD_STD settings*)
	END_STRUCT;
	McMS6ARBCoorNameCmnType : STRUCT (*Common settings for all Type values*)
		XCoordinateName : STRING[250]; (*X coordinate name*)
		YCoordinateName : STRING[250]; (*Y coordinate name*)
		ZCoordinateName : STRING[250]; (*Z coordinate name*)
		ACoordinateName : STRING[250]; (*A coordinate name*)
		BCoordinateName : STRING[250]; (*B coordinate name*)
		CCoordinateName : STRING[250]; (*C coordinate name*)
	END_STRUCT;
	McMS6ARBCoorNameType : STRUCT (*Coordinates names*)
		Type : McMSCNEnum; (*Coordinates names selector setting*)
		Common : McMS6ARBCoorNameCmnType; (*Common settings for all Type values*)
	END_STRUCT;
	McMS6ARBWFrmMdlEnum :
		( (*Wire frame model selector setting*)
		mcMS6ARBWFM_STD := 0 (*Standard - Standard wire-frame model*)
		);
	McMS6ARBWFrmMdlStdType : STRUCT (*Type mcMS6ARBWFM_STD settings*)
		Q1ToQ2 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q2ToQ3 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q3ToQ4 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q4ToQ5 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q5ToQ6 : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		Q6ToFlange : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
		FlangeToTCP : McMSFrmMdlStdEdgeType; (*Wire frame model edge*)
	END_STRUCT;
	McMS6ARBWFrmMdlType : STRUCT (*Wire frame model of mechanical system*)
		Type : McMS6ARBWFrmMdlEnum; (*Wire frame model selector setting*)
		Standard : McMS6ARBWFrmMdlStdType; (*Type mcMS6ARBWFM_STD settings*)
	END_STRUCT;
	McMS6ARBCplgType : STRUCT (*Couplings between selected axes and the joint axis*)
		LinearCoupling : McCfgUnboundedArrayType; (*Linear coupling*)
	END_STRUCT;
	McCfgMS6AxRobBType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_MS_6AX_ROB_B*)
		Description : McMS6ARBDescType; (*Description of the mechanical system*)
		CoordinatesNames : McMS6ARBCoorNameType; (*Coordinates names*)
		WireFrameModel : McMS6ARBWFrmMdlType; (*Wire frame model of mechanical system*)
		DynamicModel : McMSDynMdlType; (*Dynamic model of the mechanical system*)
		Couplings : McMS6ARBCplgType; (*Couplings between selected axes and the joint axis*)
		JointAxesPositionLimits : McMSJnt6AxPosLimType; (*Position limits for joint axis*)
	END_STRUCT;
END_TYPE