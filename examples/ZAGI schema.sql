CREATE TABLE vendor 
( vendorid CHAR(2) NOT NULL, 
 vendorname VARCHAR(25) NOT NULL, 
PRIMARY KEY (vendorid) ); 

CREATE TABLE category 
( categoryid CHAR(2) NOT NULL, 
categoryname VARCHAR(25) NOT NULL, 
PRIMARY KEY (categoryid) ); 

CREATE TABLE product 
( productid CHAR(3) NOT NULL, 
productname VARCHAR(25) NOT NULL, 
productprice NUMERIC (7,2) NOT NULL, 
vendorid CHAR(2) NOT NULL, 
categoryid CHAR(2) NOT NULL, 
PRIMARY KEY (productid), 
FOREIGN KEY (vendorid) REFERENCES vendor(vendorid), 
FOREIGN KEY (categoryid) REFERENCES 
category(categoryid) ); 

CREATE TABLE region 
( regionid CHAR NOT NULL, 
regionname VARCHAR(25) NOT NULL, 
PRIMARY KEY (regionid) ); 

CREATE TABLE store 
( storeid VARCHAR(3) NOT NULL, 
storezip CHAR(5) NOT NULL, 
regionid CHAR NOT NULL, 
PRIMARY KEY (storeid), 
FOREIGN KEY (regionid) REFERENCES region(regionid) ); 

CREATE TABLE customer 
( customerid CHAR(7) NOT NULL, 
customername VARCHAR(15) NOT NULL, 
customerzip CHAR(5) NOT NULL, 
PRIMARY KEY (customerid) ); 

CREATE TABLE salestransaction 
( tid VARCHAR(8) NOT NULL, 
customerid CHAR(7) NOT NULL, 
storeid VARCHAR(3) NOT NULL, 
tdate DATE NOT NULL, 
PRIMARY KEY (tid), 
FOREIGN KEY (customerid) REFERENCES 
customer(customerid), 
FOREIGN KEY (storeid) REFERENCES store(storeid)); 

CREATE TABLE soldvia 
( productid CHAR(3) NOT NULL, 
tid VARCHAR(8) NOT NULL, 
noofitems INT NOT NULL, 
PRIMARY KEY (productid, tid), 
FOREIGN KEY (productid) REFERENCES product(productid), 
FOREIGN KEY (tid) REFERENCES salestransaction(tid) ); 
