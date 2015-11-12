-- Vendor
--
-- Vno	Vname	  City	Vbalance
-- V1	Sears 	Toronto	200
-- V2	Walmart	Waterloo 	671.05
-- V3	Esso	Windsor	0
-- V4	Esso	Waterloo 	225
--
-- Customer
--
-- Account 	Cname 	Province 	Cbalance	 Crlimit
-- A1	Smith	ONT	2515	2000
-- A2	Jones	BC	2014	2500
-- A3	Doc	ONT	150	1000
--
-- Transaction
--
-- Tno	 Vno 	Account	 T Date	Amount
-- T1	V2	A1	2015-07-15	1325
-- T2	V2	A3	2014-12-16	1900
-- T3	V3	A1	2015-09-01	2500
-- T4	V4	A2	2015-03-20	1613
-- T5	V4	A3	2015-07-31	3312


-- insert into V values (’V1’, ’Sears’, ’Toronto', 200.00);
-- insert into V values (’V2’, 'Walmart', ’Waterloo', 671.05);
-- insert into V values (’V3’, 'Esso', ’Windsor', 0.00);
-- insert into V values (’V4’, ’Esso’, ’Waterloo', 225.00);


-- insert into C values (’A1’, ’Smith’, ’ONT’, 2515.00, 2000);
-- insert into C values (’A2’, ’Jones’, ’BC’, 2014.00, 2500);
-- insert into C values (’A3’, ’Doc’, ’ONT’, 1000.00, 1000);

-- insert into T values (’T1’, ’V2’, ’A1', 2015-07-15, 1325.00);
-- insert into T values (’T2’, 'V2', ’A3', 2014-12-16, 1900.00);
-- insert into T values (’T3’, 'V3', ’A1', 2015-09-01, 2500.00);
-- insert into T values (’T4’, ’V4’, ’A2', 2015-03-20, 1613.00);
-- insert into T values (’T5’, ’V4’, ’A3', 2015-07-31, 3312.00);
