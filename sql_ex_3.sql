create database cargo_db;

use cargo_db;

CREATE TABLE Warehouses (
   Code INTEGER NOT NULL,
   Location VARCHAR(255) NOT NULL ,
   Capacity INTEGER NOT NULL,
   PRIMARY KEY (Code)
 );
CREATE TABLE Boxes (
    Code CHAR(4) NOT NULL,
    Contents VARCHAR(255) NOT NULL ,
    Value REAL NOT NULL ,
    Warehouse INTEGER NOT NULL,
    PRIMARY KEY (Code),
    FOREIGN KEY (Warehouse) REFERENCES Warehouses(Code)
 ) ENGINE=INNODB;
 
  INSERT INTO Warehouses(Code,Location,Capacity) VALUES(1,'Chicago',3);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(2,'Chicago',4);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(3,'New York',7);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(4,'Los Angeles',2);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(5,'San Francisco',8);
 
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('0MN7','Rocks',180,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4H8P','Rocks',250,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4RT3','Scissors',190,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('7G3H','Rocks',200,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8JN6','Papers',75,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8Y6U','Papers',50,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('9J6F','Papers',175,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('LL08','Rocks',140,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P0H6','Scissors',125,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P2T6','Scissors',150,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('TU55','Papers',90,5);



/* *****************************************************************************
*******************************	 	ANSWER  *********************************  */

select * from warehouses;

select * from boxes
where value >150;

select contents from boxes;

select avg(value) from boxes;

select warehouse, avg(value) from boxes
group by warehouse;

select warehouse, avg(value) from boxes
group by warehouse
having avg(value) > 150;

select boxes.code, warehouses.location from boxes
join warehouses
on boxes.Warehouse = Warehouses.code;

select warehouse, count(*) 
from boxes 
group by warehouse;

select  code
from warehouses
where capacity < (select count(*) from boxes
                    where warehouse = warehouses.code);
                    
select boxes.code from boxes 
join warehouses
on boxes.warehouse = warehouses.code
where warehouses.location = 'chicago';

insert into warehouses values (6,'new York', 3);

insert into boxes values ('H5RT', 'Papers', 200, 2);

update boxes
set value = value * 0.85;

delete from boxes 
where value < 100;

delete from boxes
where warehouse in (select code from warehouses
where capacity < (select count(*) from boxes where warehouse = warehouses.code));

create index index_werehouse on boxes (warehouse);

show index from boxes from cargo_db;

drop index index_werehouse;

















