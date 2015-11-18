CREATE OR REPLACE FUNCTION p8(tNum char, vNum char, aNum char, amount real) RETURNS VOID AS $$
DECLARE
c1 cursor for select * from Vendor;
c2 cursor for select * from Customer;
c3 cursor for select * from Transaction;

Vno VARCHAR;
Vname VARCHAR;
City VARCHAR;
VVbalance REAL;

CAccount VARCHAR;
Cname VARCHAR;
Province VARCHAR;
CCBalance REAL;
CLimit REAL;

TTno VARCHAR;
TVno VARCHAR;
TAccount VARCHAR;
TDate date;
TAmount REAL;
BEGIN

  insert into Transaction values (tNum, vNum, aNum, current_date, amount);

    UPDATE Customer
    SET CBalance = CBalance + amount
    WHERE Customer.Account = aNum;

    UPDATE Vendor
    SET Vbalance = Vbalance + amount
    WHERE Vendor.Vno = vNum;

    open c1;
    loop
    fetch c1 into Vno,Vname,City,VVbalance;
    exit when not found;
    IF(Vno = vNum) then
      RAISE NOTICE'-----------------';
      RAISE NOTICE'Vendor Number Name: %', Vno;
      RAISE NOTICE'Vendor Name: %', Vname;
      RAISE NOTICE'City: %', City;
      RAISE NOTICE'Vendor Balance: %', CAST(VVbalance AS NUMERIC(10,2));
      RAISE NOTICE'-----------------';
    end if;
    end loop;
    close c1;


    open c2;
    loop
    fetch c2 into CAccount,Cname,Province,CCBalance,CLimit;
    exit when not found;
    IF(CAccount = aNum) then
      RAISE NOTICE'';
      RAISE NOTICE'';
      RAISE NOTICE'-----------------';
      RAISE NOTICE'Customer Account: %', CAccount;
      RAISE NOTICE'Customer Name: %', Cname;
      RAISE NOTICE'Province: %', Province;
      RAISE NOTICE'Customer Balance: %', CAST(CCBalance AS NUMERIC(10,2));
      RAISE NOTICE'Vendor Limit: %', CAST(CLimit AS NUMERIC(10,2));
      RAISE NOTICE'-----------------';
    end if;
    end loop;
    close c2;

    open c3;
    loop
    fetch c3 into TTno,TVno,TAccount,TDate,TAmount;
    exit when not found;
    IF(TTno = tNum) then
      RAISE NOTICE'';
      RAISE NOTICE'';
      RAISE NOTICE'-----------------';
      RAISE NOTICE'Transaction No: %', TTno;
      RAISE NOTICE'Transaction Vendor Numnber: %', TVno;
      RAISE NOTICE'Transaction Account: %', TAccount;
      RAISE NOTICE'Transaction Date : %', TDate;
      RAISE NOTICE'Transaction Amount: %', CAST(TAmount AS NUMERIC(10,2));
      RAISE NOTICE'-----------------';
    end if;
    end loop;
    close c3;


END;
$$ LANGUAGE plpgsql;
