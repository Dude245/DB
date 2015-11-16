CREATE TABLE Vendor(
  Vno CHAR(5) NOT NULL,
  Vname CHAR(25) NOT NULL,
  City CHAR(25) NOT NULL,
  Vbalance REAL NOT NULL
);
CREATE TABLE Customer(
  Account CHAR(5) NOT NULL,
  Cname CHAR(20) NOT NULL,
  Province CHAR(5) NOT NULL,
  CBalance REAL NOT NULL,
  Amount REAL NOT NULL
);
CREATE TABLE Transaction(
  Tno CHAR(5) NOT NULL,
  Vno CHAR(5) NOT NULL,
  Account CHAR(5) NOT NULL,
  TDate CHAR(10) NOT NULL, --Maybe change
  Amount REAL NOT NULL
);

insert into Vendor values ('V1', 'Sears', 'Toronto', 200.00);
insert into Vendor values ('V2', 'Walmart', 'Waterloo', 671.05);
insert into Vendor values ('V3', 'Esso', 'Windsor', 0.00);
insert into Vendor values ('V4', 'Esso', 'Waterloo', 225.00);


insert into Customer values ('A1', 'Smith', 'ONT', 2515.00, 2000.00);
insert into Customer values ('A2', 'Jones', 'BC', 2014.00, 2500.00);
insert into Customer values ('A3', 'Doc', 'ONT', 1000.00, 1000.00);

insert into Transaction values ('T1', 'V2', 'A1', 2015-07-15, 1325.00);
insert into Transaction values ('T2', 'V2', 'A3', 2014-12-16, 1900.00);
insert into Transaction values ('T3', 'V3', 'A1', 2015-09-01, 2500.00);
insert into Transaction values ('T4', 'V4', 'A2', 2015-03-20, 1613.00);
insert into Transaction values ('T5', 'V4', 'A3', 2015-07-31, 3312.00);
