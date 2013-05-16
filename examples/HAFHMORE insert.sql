CREATE TABLE manager
(	managerid   	CHAR(4)		NOT NULL,
  	mfname		VARCHAR(15) 	NOT NULL,
	mlname		VARCHAR(15) 	NOT NULL,
	mbdate		DATE		NOT NULL,
	msalary		NUMERIC(9,2) 	NOT NULL,
	mbonus		NUMERIC(9,2),
	mresbuildingid	CHAR(3),		
	PRIMARY KEY (managerid) );

CREATE TABLE managerphone
(	managerid   	CHAR(4)		NOT NULL,
  	mphone		CHAR(11) 	NOT NULL,
	PRIMARY KEY (managerid, mphone), 
	FOREIGN KEY (managerid) REFERENCES manager(managerid) );

CREATE TABLE building
(	buildingid	CHAR(3)		NOT NULL,
	bnooffloors	INT		NOT NULL,
  	bmanagerid   	CHAR(4)		NOT NULL,
	PRIMARY KEY (buildingid),
	FOREIGN KEY (bmanagerid) REFERENCES manager(managerid) );

CREATE TABLE inspector
(	insid		CHAR(3) 	NOT NULL, 
  	insname		VARCHAR(15) 	NOT NULL,
	PRIMARY KEY (insid) );

CREATE TABLE inspecting
(	insid		CHAR(3) 	NOT NULL,
  	buildingid	CHAR(3)		NOT NULL,
	datelast	DATE		NOT NULL,
	datenext	DATE		NOT NULL,
	PRIMARY KEY (insid, buildingid),
	FOREIGN KEY (insid) REFERENCES inspector(insid),
	FOREIGN KEY (buildingid) REFERENCES building(buildingid) );

CREATE TABLE corpclient
(	ccid   		CHAR(4)		NOT NULL, 
  	ccname		VARCHAR(25) 	NOT NULL,
	ccindustry	VARCHAR(25) 	NOT NULL,
	cclocation	VARCHAR(25) 	NOT NULL,
	ccidreferredby	CHAR(4),
	PRIMARY KEY (ccid),
	UNIQUE (ccname),  
	FOREIGN KEY (ccidreferredby) REFERENCES corpclient(ccid) );

CREATE TABLE apartment
(	buildingid   	CHAR(3) 	NOT NULL,
  	aptno		CHAR(5) 	NOT NULL,
	anoofbedrooms  	INT		NOT NULL,
	ccid   		CHAR(4),
	PRIMARY KEY (buildingid, aptno),
	FOREIGN KEY (buildingid) REFERENCES building(buildingid),
	FOREIGN KEY (ccid) REFERENCES corpclient(ccid) );

CREATE TABLE staffmember
(	smemberid   	CHAR(4) 	NOT NULL, 
  	smembername	VARCHAR(15) 	NOT NULL,
	PRIMARY KEY (smemberid) );

CREATE TABLE cleaning
(	buildingid   	CHAR(3) 	NOT NULL, 
  	aptno		CHAR(5) 	NOT NULL,
	smemberid   	CHAR(4) 	NOT NULL,	
	CONSTRAINT cleaningpk PRIMARY KEY (buildingid, aptno, smemberid  ),
	CONSTRAINT cleaningfk FOREIGN KEY (buildingid, aptno) 
	REFERENCES apartment(buildingid, aptno)  );

INSERT INTO manager VALUES ('M12', 'Boris', 'Grant', '1980-06-20', 60000, null, null);
INSERT INTO manager VALUES ('M23', 'Austin', 'Lee', '1975-10-30', 50000, 5000, null);
INSERT INTO manager VALUES ('M34', 'George', 'Sherman',	'1976-01-11', 52000, 2000, null);
INSERT INTO manager VALUES ('M45','Mariana','Gonzalez','1980-12-27',54000,null,null);
INSERT INTO manager VALUES ('M56','Fiona', 'Keane','1977-10-04',57000,2000,null);
INSERT INTO manager VALUES ('M67','Alexander','Sanborn','1953-08-17',62000,3000,null);

INSERT INTO managerphone VALUES ('M12','555-2222');
INSERT INTO managerphone VALUES ('M12','555-3232');
INSERT INTO managerphone VALUES ('M23','555-9988');
INSERT INTO managerphone VALUES ('M34','555-9999');
INSERT INTO managerphone VALUES ('M34','555-1003');
INSERT INTO managerphone VALUES ('M45','555-1216');
INSERT INTO managerphone VALUES ('M56','555-5180');
INSERT INTO managerphone VALUES ('M67','555-6767');
INSERT INTO managerphone VALUES ('M67','555-1327');
INSERT INTO managerphone VALUES ('M67','555-3794');

INSERT INTO building VALUES ('B1','5','M12');
INSERT INTO building VALUES ('B2','6','M23');
INSERT INTO building VALUES ('B3','4','M23');
INSERT INTO building VALUES ('B4','4','M34');
INSERT INTO building VALUES ('B5','3','M45');
INSERT INTO building VALUES ('B6','3','M45');
INSERT INTO building VALUES ('B7','2','M56');
INSERT INTO building VALUES ('B8','4','M67');
INSERT INTO building VALUES ('B9','3','M67');

INSERT INTO inspector VALUES ('I11','Jane');
INSERT INTO inspector VALUES ('I22','Niko');
INSERT INTO inspector VALUES ('I33','Mick');
INSERT INTO inspector VALUES ('I44','Bianca');
INSERT INTO inspector VALUES ('I55','Sergei');


INSERT INTO inspecting VALUES ('I11','B1','2012-05-15','2013-05-14');
INSERT INTO inspecting VALUES ('I11','B2','2013-02-17','2013-05-17');
INSERT INTO inspecting VALUES ('I11','B7','2012-04-08','2013-04-08');
INSERT INTO inspecting VALUES ('I22','B2','2013-02-17','2013-05-17');
INSERT INTO inspecting VALUES ('I22','B3','2013-01-11','2014-01-11');
INSERT INTO inspecting VALUES ('I22','B8','2013-03-19','2014-03-19');
INSERT INTO inspecting VALUES ('I33','B3','2013-01-12','2014-01-12');
INSERT INTO inspecting VALUES ('I33','B4','2013-01-11','2014-01-11');
INSERT INTO inspecting VALUES ('I33','B9','2013-05-12','2014-05-12');
INSERT INTO inspecting VALUES ('I44','B4','2013-01-11','2014-01-11');
INSERT INTO inspecting VALUES ('I44','B5','2013-07-23','2014-07-23');
INSERT INTO inspecting VALUES ('I55','B5','2013-08-15','2014-08-15');
INSERT INTO inspecting VALUES ('I55','B6','2013-07-26','2014-07-26');

INSERT INTO corpclient VALUES ('C111','BlingNotes','Music','Chicago',null);
INSERT INTO corpclient VALUES ('C222','SkyJet','Airline','Oak Park','C111');
INSERT INTO corpclient VALUES ('C333','Xilerate','Sports','Chicago',null);
INSERT INTO corpclient VALUES ('C444','NanoCorp','Broadcasting','Rosemont','C111');
INSERT INTO corpclient VALUES ('C555','EntertainUs','Broadcasting','Oak Brook',null);
INSERT INTO corpclient VALUES ('C666','DelishInc','Food Service','Oak Brook','C444');
INSERT INTO corpclient VALUES ('C777','WindyCT','Music','Chicago','C222');
INSERT INTO corpclient VALUES ('C888','SouthAlps','Sports','Rosemont','C777');
INSERT INTO corpclient VALUES ('C999','CommuteAir','Airline','Oak Brook','C111');

INSERT INTO apartment VALUES ('B1','11',1,'C111');
INSERT INTO apartment VALUES ('B1','21',1,'C111');
INSERT INTO apartment VALUES ('B1','31',1,'C333');
INSERT INTO apartment VALUES ('B1','41',1,null);
INSERT INTO apartment VALUES ('B1','51',1,null);
INSERT INTO apartment VALUES ('B2','11',2,'C222');
INSERT INTO apartment VALUES ('B2','21',2,'C222');
INSERT INTO apartment VALUES ('B2','31',2,null);
INSERT INTO apartment VALUES ('B2','41',2,null);
INSERT INTO apartment VALUES ('B2','51',2,'C111');
INSERT INTO apartment VALUES ('B2','61',2,'C111');
INSERT INTO apartment VALUES ('B3','11',2,'C777');
INSERT INTO apartment VALUES ('B3','21',2,'C777');
INSERT INTO apartment VALUES ('B3','31',2,'C555');
INSERT INTO apartment VALUES ('B3','41',2,'C555');
INSERT INTO apartment VALUES ('B4','11',2,'C777');
INSERT INTO apartment VALUES ('B4','21',2,'C777');
INSERT INTO apartment VALUES ('B4','31',2,'C222');
INSERT INTO apartment VALUES ('B4','41',2,'C222');
INSERT INTO apartment VALUES ('B5','11',3,'C555');
INSERT INTO apartment VALUES ('B5','21',3,null);
INSERT INTO apartment VALUES ('B5','31',3,'C111');
INSERT INTO apartment VALUES ('B6','11',1,'C111');
INSERT INTO apartment VALUES ('B6','12',1,'C111');
INSERT INTO apartment VALUES ('B6','21',1,'C444');
INSERT INTO apartment VALUES ('B6','22',1,'C444');
INSERT INTO apartment VALUES ('B6','31',1,'C555');
INSERT INTO apartment VALUES ('B6','32',1,'C333');
INSERT INTO apartment VALUES ('B7','11',3,'C999');
INSERT INTO apartment VALUES ('B7','12',3,'C999');
INSERT INTO apartment VALUES ('B7','13',3,'C999');
INSERT INTO apartment VALUES ('B7','21',3,null);
INSERT INTO apartment VALUES ('B7','22',3,'C222');
INSERT INTO apartment VALUES ('B7','23',3,'C111');
INSERT INTO apartment VALUES ('B8','11',2,'C777');
INSERT INTO apartment VALUES ('B8','12',2,'C777');
INSERT INTO apartment VALUES ('B8','21',2,'C444');
INSERT INTO apartment VALUES ('B8','22',2,'C444');
INSERT INTO apartment VALUES ('B8','31',2,null);
INSERT INTO apartment VALUES ('B8','32',2,null);
INSERT INTO apartment VALUES ('B8','41',2,'C666');
INSERT INTO apartment VALUES ('B8','42',2,'C666');
INSERT INTO apartment VALUES ('B9','11',2,'C111');
INSERT INTO apartment VALUES ('B9','21',2,'C222');
INSERT INTO apartment VALUES ('B9','31',2,'C222');

INSERT INTO staffmember VALUES ('5432','Brian');
INSERT INTO staffmember VALUES ('9876','Boris');
INSERT INTO staffmember VALUES ('7652','Caroline');
INSERT INTO staffmember VALUES ('2537','Howard');
INSERT INTO staffmember VALUES ('3984','Luis');
INSERT INTO staffmember VALUES ('4196','Arthur');
INSERT INTO staffmember VALUES ('8467','Mariana');
INSERT INTO staffmember VALUES ('1028','Franz');

INSERT INTO cleaning VALUES ('B1','11','5432');
INSERT INTO cleaning VALUES ('B1','21','5432');
INSERT INTO cleaning VALUES ('B1','31','5432');
INSERT INTO cleaning VALUES ('B1','41','9876');
INSERT INTO cleaning VALUES ('B1','51','9876');
INSERT INTO cleaning VALUES ('B2','11','9876');
INSERT INTO cleaning VALUES ('B2','21','9876');
INSERT INTO cleaning VALUES ('B2','31','5432');
INSERT INTO cleaning VALUES ('B2','41','5432');
INSERT INTO cleaning VALUES ('B2','51','1028');
INSERT INTO cleaning VALUES ('B2','61','1028');
INSERT INTO cleaning VALUES ('B3','11','5432');
INSERT INTO cleaning VALUES ('B3','21','5432');
INSERT INTO cleaning VALUES ('B3','31','8467');
INSERT INTO cleaning VALUES ('B3','41','8467');
INSERT INTO cleaning VALUES ('B4','11','7652');
INSERT INTO cleaning VALUES ('B4','21','7652');
INSERT INTO cleaning VALUES ('B4','31','7652');
INSERT INTO cleaning VALUES ('B4','41','7652');
INSERT INTO cleaning VALUES ('B5','11','9876');
INSERT INTO cleaning VALUES ('B5','11','3984');
INSERT INTO cleaning VALUES ('B5','21','9876');
INSERT INTO cleaning VALUES ('B5','21','3984');
INSERT INTO cleaning VALUES ('B5','31','9876');
INSERT INTO cleaning VALUES ('B5','31','3984');
INSERT INTO cleaning VALUES ('B6','11','3984');
INSERT INTO cleaning VALUES ('B6','12','3984');
INSERT INTO cleaning VALUES ('B6','21','2537');
INSERT INTO cleaning VALUES ('B6','22','2537');
INSERT INTO cleaning VALUES ('B6','31','2537');
INSERT INTO cleaning VALUES ('B6','32','2537');
INSERT INTO cleaning VALUES ('B7','11','4196');
INSERT INTO cleaning VALUES ('B7','11','8467');
INSERT INTO cleaning VALUES ('B7','12','4196');
INSERT INTO cleaning VALUES ('B7','12','8467');
INSERT INTO cleaning VALUES ('B7','13','4196');
INSERT INTO cleaning VALUES ('B7','13','8467');
INSERT INTO cleaning VALUES ('B7','21','3984');
INSERT INTO cleaning VALUES ('B7','21','2537');
INSERT INTO cleaning VALUES ('B7','22','3984');
INSERT INTO cleaning VALUES ('B7','22','2537');
INSERT INTO cleaning VALUES ('B7','23','3984');
INSERT INTO cleaning VALUES ('B7','23','2537');
INSERT INTO cleaning VALUES ('B8','11','7652');
INSERT INTO cleaning VALUES ('B8','12','7652');
INSERT INTO cleaning VALUES ('B8','21','1028');
INSERT INTO cleaning VALUES ('B8','22','1028');
INSERT INTO cleaning VALUES ('B8','31','1028');
INSERT INTO cleaning VALUES ('B8','32','1028');
INSERT INTO cleaning VALUES ('B8','41','4196');
INSERT INTO cleaning VALUES ('B8','42','4196');
INSERT INTO cleaning VALUES ('B9','11','8467');
INSERT INTO cleaning VALUES ('B9','21','8467');
INSERT INTO cleaning VALUES ('B9','31','8467');

ALTER TABLE manager
ADD CONSTRAINT fkresidesin
FOREIGN KEY (mresbuildingid) REFERENCES building(buildingid);

UPDATE manager SET mresbuildingid = 'B1' WHERE managerid = 'M12';
UPDATE manager SET mresbuildingid = 'B2' WHERE managerid = 'M23';
UPDATE manager SET mresbuildingid = 'B4' WHERE managerid = 'M34';
UPDATE manager SET mresbuildingid = 'B5' WHERE managerid = 'M45';
UPDATE manager SET mresbuildingid = 'B7' WHERE managerid = 'M56';
UPDATE manager SET mresbuildingid = 'B8' WHERE managerid = 'M67';

ALTER TABLE manager
MODIFY mresbuildingid CHAR(3) NOT NULL;
