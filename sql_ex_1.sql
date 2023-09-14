create database store_db;

use store_db;

CREATE TABLE Manufacturers (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL,
  PRIMARY KEY (Code)   
);

CREATE TABLE Products (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL ,
  Price DECIMAL NOT NULL ,
  Manufacturer INTEGER NOT NULL,
  PRIMARY KEY (Code), 
  FOREIGN KEY (Manufacturer) REFERENCES Manufacturers(Code)
) ENGINE=INNODB;

INSERT INTO Manufacturers(Code,Name) VALUES(1,'Sony');
INSERT INTO Manufacturers(Code,Name) VALUES(2,'Creative Labs');
INSERT INTO Manufacturers(Code,Name) VALUES(3,'Hewlett-Packard');
INSERT INTO Manufacturers(Code,Name) VALUES(4,'Iomega');
INSERT INTO Manufacturers(Code,Name) VALUES(5,'Fujitsu');
INSERT INTO Manufacturers(Code,Name) VALUES(6,'Winchester');

INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(1,'Hard drive',240,5);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(2,'Memory',120,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(3,'ZIP drive',150,4);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(4,'Floppy disk',5,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(5,'Monitor',240,1);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(6,'DVD drive',180,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(7,'CD drive',90,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(8,'Printer',270,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(9,'Toner cartridge',66,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(10,'DVD burner',180,2);



/* ***************************************************************************
*********************** ANSWER  ******************************************* */

select name from products;

select name, price from products;

select name, price from products
where price <= 200;

select name ,price from products
where price between 60 and 120;

select name, price*100 from products;

select avg(price) from products;

select avg(price) from products 
where  Manufacturer = 2;

select count(*) from products
where price >= 180;

select name, price from products 
where price >= 180 
order by price desc, name asc;

select * from products, manufacturers;

select a.name, a.price, b.name from products a 
join manufacturers b 
on(a.manufacturer = b.code);

select avg(price), Manufacturer from products
group by manufacturer;

select avg(a.price), b.name from products a 
join manufacturers b 
on a.manufacturer = b.code
group by b.name;

select avg(a.price), b.name 
from manufacturers b join products a 
on b.code = a.mmanufacturer
group by b.name
having avg(a.price)>=150;

select avg(a.price), b.name 
from manufacturers b join products a 
on b.code = a.manufacturer
group by b.name
having avg(a.price)>=150;

select avg(price), manufacturers.name from products, Manufacturers
where products.manufacturer = manufacturers.Code
group by manufacturers.name
having avg(price) >= 150;

select name, price from products 
where price = (select min(price) from products);

select max_price_mapping.name as manu_name, max_price_mapping.price, products_with_manu_name.name as product_name from 
(select manufacturers.name, max(price) price
from products, manufacturers
where manufacturer = manufacturers.Code
group by Manufacturers.name)
as max_price_mapping
left join
(select products.*, manufacturers.name manu_name
from products join manufacturers
on (products.manufacturer = manufacturers.code))
as products_with_manu_name
on (max_price_mapping.name = products_with_manu_name.manu_name
and max_price_mapping.price = products_with_manu_name.price); 

insert into Products values (11, 'Loudspeakers', 70, 2);

update products
set name = 'Laser Printer'
where code = 8;

update products
set price = price * 0.9;

update products
set price = price * 0.9;

