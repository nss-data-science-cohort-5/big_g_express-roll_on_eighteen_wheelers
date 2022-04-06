
		-- big_g_express_sql_v1_RK.psql --
		

-- WILL NEED TO SAVE A .csv COPY OF Vehicle_Make.xlsx FOR IMPORT
CREATE TABLE Vehicle_Make
(
	  Truck_Number VARCHAR(3)
	, Year		   VARCHAR(4)
	, Make		   VARCHAR(10)
	, Serial	   VARCHAR(20)
);


CREATE TABLE VDOD
(
	  Id	  VARCHAR(10)
	, Name    TEXT
	, Value   VARCHAR(20)
	, FaultId VARCHAR(12)
);


-- WILL NEED TO SAVE A .csv COPY OF Service Fault Codes_1_0_0_167.xlsx FOR IMPORT
-- USE ' FOR BOTH ESCAPE AND QUOTE
CREATE TABLE Service_Fault_Codes
(
	  Published 		 CHAR(1)
	, Cummins_Fault_Code VARCHAR(5)
	, Revision			 VARCHAR(4)
	, PID			     VARCHAR(12)
	, SID			     VARCHAR(12)
	, MID			     VARCHAR(12)
	, J1587_FMI			 VARCHAR(5)
	, SPN				 VARCHAR(7)
	, J1939_FMI			 VARCHAR(5)	
	, J2012_Pcode		 VARCHAR(12)
	, Lamp_Color		 VARCHAR(15)
	, Lamp_Device		 VARCHAR(20)
	, Cummins_Desc		 TEXT
	, Algorithm_Desc	 TEXT
);


CREATE TABLE JFaults
(
	  RecordID				VARCHAR(10)
	, ESS_Id				VARCHAR(10)
	, EventTimeStamp		TIMESTAMP
	, eventDescription		TEXT
	, actionDescription		VARCHAR(5)
	, ecuSoftwareVersion	TEXT
	, ecuSerialNumber		TEXT
	, ecuModel				TEXT
	, ecuMake				VARCHAR(15)
	, ecuSource				VARCHAR(15)
	, spn					VARCHAR(15)
	, fmi					VARCHAR(15)
	, active				BOOL
	, activeTransitionCount INT
	, faultValue			VARCHAR(15)
	, EquipmentID			VARCHAR(15)
	, MCTNumber				VARCHAR(15)
	, Latitude				NUMERIC
	, Longitude				NUMERIC
	, LocationTimeStamp		TIMESTAMP
);


--

SELECT *
FROM JFaults
WHERE spn = '5246'
	AND LENGTH(EquipmentID) <= 5
	AND 
	(
		(
			latitude NOT BETWEEN (36.0666667 + 0.016667) AND (36.0666667 - 0.016667)
	 		AND
	 		longitude NOT BETWEEN (-86.4347222 + 0.016667) AND (-86.4347222 - 0.016667) 
	 	)
		AND
		(
			latitude NOT BETWEEN (35.5883333 + 0.016667) AND (35.5883333 - 0.016667)
			AND 
			longitude NOT BETWEEN (-86.4438888 + 0.016667) AND (-86.4438888 - 0.016667)
		)
		AND
		(
			latitude NOT BETWEEN (36.1950 + 0.016667) AND (36.1950 - 0.016667)
			AND 
			longitude NOT BETWEEN (-83.174722 + 0.016667) AND (-83.174722 - 0.016667)
		)
	)
LIMIT 100
;



