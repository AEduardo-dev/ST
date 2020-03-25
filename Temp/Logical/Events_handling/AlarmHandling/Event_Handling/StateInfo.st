
ACTION StateInfo: 
	IF Set_Info_Messages THEN
		CASE gSuperTrak.state.stateMachine.operationalState OF
			ABORTING:
				
				IF ST_Last_Info_Written <> 27 THEN
					Event_Code := 27;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;

			ABORTED:
				
				IF ST_Last_Info_Written <> 28 THEN
					Event_Code := 28;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;
				
			STOPPING:
			
				IF ST_Last_Info_Written <> 25 THEN
					Event_Code := 25;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;
				
			STOPPED:
				
				IF ST_Last_Info_Written <> 26 THEN
					Event_Code := 26;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;
		
			CLEARING:
			
				IF ST_Last_Info_Written <> 29 THEN
					Event_Code := 29;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;

			IDLE:
				
				IF ST_Last_Info_Written <> 11 THEN
					Event_Code := 11;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;
			
			STARTING:
				
				IF ST_Last_Info_Written <> 12 THEN
					Event_Code := 12;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;

			COMPLETING:

				IF ST_Last_Info_Written <> 22 THEN
					Event_Code := 22;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;

			COMPLETE:

				IF ST_Last_Info_Written <> 23 THEN
					Event_Code := 23;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;

			RESETTING:

				IF ST_Last_Info_Written <> 24 THEN
					Event_Code := 24;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;

			HOLDING:

				IF ST_Last_Info_Written <> 19 THEN
					Event_Code := 19;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;

			SUSPENDING:

				IF ST_Last_Info_Written <> 16 THEN
					Event_Code := 16;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;

			HELD:

				IF ST_Last_Info_Written <> 20 THEN
					Event_Code := 20;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;

			UNHOLDING:

				IF ST_Last_Info_Written <> 21 THEN
					Event_Code := 21;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;

			SUSPENDED:

				IF ST_Last_Info_Written <> 17 THEN
					Event_Code := 17;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;

			UNSUSPENDING:

				IF ST_Last_Info_Written <> 18 THEN
					Event_Code := 18;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;

			PAUSING:

				IF ST_Last_Info_Written <> 14 THEN
					Event_Code := 14;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;
			
			PAUSED:

				IF ST_Last_Info_Written <> 15 THEN
					Event_Code := 15;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;

			RUNNING:

				IF ST_Last_Info_Written <> 13 THEN
					Event_Code := 13;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;

			
		END_CASE
		
		
		CASE gAssemblyModule.state.stateMachine.operationalState OF
			ABORTING:
				
				IF Assembly_Last_Info_Written <> 127 THEN
					Event_Code := 127;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;

			ABORTED:
				
				IF Assembly_Last_Info_Written <> 128 THEN
					Event_Code := 128;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;
				
			STOPPING:
			
				IF Assembly_Last_Info_Written <> 125 THEN
					Event_Code := 125;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;
				
			STOPPED:
				
				IF Assembly_Last_Info_Written <> 126 THEN
					Event_Code := 126;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;
		
			CLEARING:
			
				IF Assembly_Last_Info_Written <> 129 THEN
					Event_Code := 129;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;

			IDLE:
				
				IF Assembly_Last_Info_Written <> 111 THEN
					Event_Code := 111;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;
			
			STARTING:
				
				IF Assembly_Last_Info_Written <> 112 THEN
					Event_Code := 112;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;

			COMPLETING:

				IF Assembly_Last_Info_Written <> 122 THEN
					Event_Code := 122;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;

			COMPLETE:

				IF Assembly_Last_Info_Written <> 123 THEN
					Event_Code := 123;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;

			RESETTING:

				IF Assembly_Last_Info_Written <> 124 THEN
					Event_Code := 124;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;

			HOLDING:

				IF Assembly_Last_Info_Written <> 119 THEN
					Event_Code := 119;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;

			SUSPENDING:

				IF Assembly_Last_Info_Written <> 116 THEN
					Event_Code := 116;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;

			HELD:

				IF Assembly_Last_Info_Written <> 120 THEN
					Event_Code := 120;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;

			UNHOLDING:

				IF Assembly_Last_Info_Written <> 121 THEN
					Event_Code := 121;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;

			SUSPENDED:

				IF Assembly_Last_Info_Written <> 117 THEN
					Event_Code := 117;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;

			UNSUSPENDING:

				IF Assembly_Last_Info_Written <> 118 THEN
					Event_Code := 118;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;

			PAUSING:

				IF Assembly_Last_Info_Written <> 114 THEN
					Event_Code := 114;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;
			
			PAUSED:

				IF Assembly_Last_Info_Written <> 115 THEN
					Event_Code := 115;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;

			RUNNING:

				IF Assembly_Last_Info_Written <> 113 THEN
					Event_Code := 113;
					EventLog.Commands.WriteUserEvent := TRUE;
				END_IF;

			
		END_CASE
		
	END_IF;
	
END_ACTION
