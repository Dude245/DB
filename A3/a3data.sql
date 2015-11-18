CREATE OR REPLACE FUNCTION a3data() RETURNS VOID as $$
BEGIN
  CREATE TABLE Vendor(
    Vno VARCHAR NOT NULL,
    Vname VARCHAR NOT NULL,
    City VARCHAR NOT NULL,
    Vbalance REAL NOT NULL
  );
  CREATE TABLE Customer(
    Account VARCHAR NOT NULL,
    Cname VARCHAR NOT NULL,
    Province VARCHAR NOT NULL,
    CBalance REAL NOT NULL,
    CLimit REAL NOT NULL
  );
  CREATE TABLE Transaction(
    Tno VARCHAR NOT NULL,
    Vno VARCHAR NOT NULL,
    Account VARCHAR NOT NULL,
    TDate date NOT NULL, --Maybe change
    TAmount REAL NOT NULL
  );

  insert into Vendor values ('V1', 'Sears', 'Toronto', 200.00);
  insert into Vendor values ('V2', 'Walmart', 'Waterloo', 671.05);
  insert into Vendor values ('V3', 'Esso', 'Windsor', 0.00);
  insert into Vendor values ('V4', 'Esso', 'Waterloo', 225.00);


  insert into Customer values ('A1', 'Smith', 'ONT', 2515.00, 2000.00);
  insert into Customer values ('A2', 'Jones', 'BC', 2014.00, 2500.00);
  insert into Customer values ('A3', 'Doc', 'ONT', 150.00, 1000.00);

  insert into Transaction values ('T1', 'V2', 'A1', '2015-07-15', 1325.00);
  insert into Transaction values ('T2', 'V2', 'A3', '2014-12-16', 1900.00);
  insert into Transaction values ('T3', 'V3', 'A1', '2015-09-01', 2500.00);
  insert into Transaction values ('T4', 'V4', 'A2', '2015-03-20', 1613.00);
  insert into Transaction values ('T5', 'V4', 'A3', '2015-07-31', 3312.00);
END;
$$ LANGUAGE plpgsql;
