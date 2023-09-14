create database distributor_db;

use distributor_db;

CREATE TABLE Pieces (
 Code INTEGER PRIMARY KEY NOT NULL,
 Name TEXT NOT NULL
 );
CREATE TABLE Providers (
 Code VARCHAR(40) 
 PRIMARY KEY NOT NULL,  
 Name TEXT NOT NULL 
 );
CREATE TABLE Provides (
 Piece INTEGER, 
 FOREIGN KEY (Piece) REFERENCES Pieces(Code),
 Provider VARCHAR(40), 
 FOREIGN KEY (Provider) REFERENCES Providers(Code),  
 Price INTEGER NOT NULL,
 PRIMARY KEY(Piece, Provider) 
 );
 
-- alternative one for SQLite
  /* 
 CREATE TABLE Provides (
 Piece INTEGER,
 Provider VARCHAR(40),  
 Price INTEGER NOT NULL,
 PRIMARY KEY(Piece, Provider) 
 );
 */
 
 
INSERT INTO Providers(Code, Name) VALUES('HAL','Clarke Enterprises');
INSERT INTO Providers(Code, Name) VALUES('RBT','Susan Calvin Corp.');
INSERT INTO Providers(Code, Name) VALUES('TNBC','Skellington Supplies');

INSERT INTO Pieces(Code, Name) VALUES(1,'Sprocket');
INSERT INTO Pieces(Code, Name) VALUES(2,'Screw');
INSERT INTO Pieces(Code, Name) VALUES(3,'Nut');
INSERT INTO Pieces(Code, Name) VALUES(4,'Bolt');

INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'HAL',10);
INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'RBT',15);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'HAL',20);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'RBT',15);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'TNBC',14);
INSERT INTO Provides(Piece, Provider, Price) VALUES(3,'RBT',50);
INSERT INTO Provides(Piece, Provider, Price) VALUES(3,'TNBC',45);
INSERT INTO Provides(Piece, Provider, Price) VALUES(4,'HAL',5);
INSERT INTO Provides(Piece, Provider, Price) VALUES(4,'RBT',7);


/* *************************************************************
********************** ANSWER ******************************* */

select name from pieces;

select * from providers;

select piece, avg(price) from provides
group by piece;

select name from providers
where code in (select provider from provides where piece = 1); 

select name from pieces
where code in (select piece from provides where provider = "HAL");

select pieces.name, providers.name, price from pieces 
inner join provides on pieces.code = piece
inner join providers on providers.code = provider
where price =(select max(price) from provides
			  where piece = pieces.code);

insert into provides(piece, provider, price) value (1, 'TNBC', 7);

update provides
set price = price + 1;

delete from provides 
where provider = 'RBT' and piece = 4;

delete from provides
where provider = 'RBT';

