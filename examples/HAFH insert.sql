INSERT INTO manager VALUES ('M12', 'Boris', 'Grant', 
 '1980-06-20', 60000, null, null); 
INSERT INTO manager VALUES ('M23', 'Austin', 'Lee', 
 '1975-10-30', 50000, 5000, null); 
INSERT INTO manager VALUES ('M34', 'George', 'Sherman', 
 '1976-01-11', 52000, 2000, null); 
INSERT INTO managerphone VALUES ('M12', '555-2222'); 
INSERT INTO managerphone VALUES ('M12','555-3232'); 
INSERT INTO managerphone VALUES ('M23','555-9988'); 
INSERT INTO managerphone VALUES ('M34','555-9999'); 
INSERT INTO building VALUES ('B1', '5', 'M12'); 
INSERT INTO building VALUES ('B2', '6', 'M23'); 
INSERT INTO building VALUES ('B3', '4', 'M23'); 
INSERT INTO building VALUES ('B4', '4', 'M34'); 
INSERT INTO inspector VALUES ('I11', 'Jane'); 
INSERT INTO inspector VALUES ('I22', 'Niko'); 
INSERT INTO inspector VALUES ('I33', 'Mick'); 
INSERT INTO inspecting VALUES 
 ('I11','B1','2012-05-15','2013-05-14'); 
INSERT INTO inspecting VALUES 
 ('I11','B2','2013-02-17','2013-05-17'); 
INSERT INTO inspecting VALUES 
 ('I22','B2','2013-02-17','2013-05-17'); 
INSERT INTO inspecting VALUES 
 ('I22','B3','2013-01-11','2014-01-11'); 
INSERT INTO inspecting VALUES 
 ('I33','B3','2013-01-12','2014-01-12'); 
INSERT INTO inspecting VALUES 
 ('I33','B4','2013-01-11','2014-01-11');
INSERT INTO corpclient VALUES ('C111', 'BlingNotes', 'Music', 
 'Chicago', null); 
INSERT INTO corpclient VALUES ('C222', 'SkyJet', 'Airline', 
 'Oak Park', 'C111'); 
INSERT INTO corpclient VALUES ('C777', 'WindyCT', 'Music', 
 'Chicago', 'C222'); 
INSERT INTO corpclient VALUES ('C888', 'SouthAlps', 'Sports', 
 'Rosemont', 'C777'); 
INSERT INTO apartment VALUES ('B1', '21', 1, 'C111'); 
INSERT INTO apartment VALUES ('B1', '41', 1, null); 
INSERT INTO apartment VALUES ('B2', '11', 2, 'C222'); 
INSERT INTO apartment VALUES ('B2', '31', 2, null); 
INSERT INTO apartment VALUES ('B3', '11', 2, 'C777'); 
INSERT INTO apartment VALUES ('B4', '11', 2, 'C777'); 
INSERT INTO staffmember VALUES ('5432', 'Brian'); 
INSERT INTO staffmember VALUES ('9876', 'Boris'); 
INSERT INTO staffmember VALUES ('7652', 'Caroline'); 
INSERT INTO cleaning VALUES ('B1', '21', '5432'); 
INSERT INTO cleaning VALUES ('B1', '41', '9876'); 
INSERT INTO cleaning VALUES ('B2', '31', '5432'); 
INSERT INTO cleaning VALUES ('B2', '11', '9876'); 
INSERT INTO cleaning VALUES ('B3', '11', '5432'); 
INSERT INTO cleaning VALUES ('B4', '11', '7652'); 
