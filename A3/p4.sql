CREATE OR REPLACE FUNCTION  p4() returns void as $$
    DECLARE
    c1 cursor for SELECT cName FROM Customer;
    nVname VARCHAR;
    nTDate Date;
    nTAmount REAL;
    nCName VARCHAR;
    nANum VARCHAR;
    BEGIN
      open c1;
      loop
        fetch c1 into nCName;
        exit when not found;
        SELECT vendor.Vname, max(transaction.TDate), transaction.TAmount,transaction.Account into nVname, nTDate, nTAmount,nANum
        FROM Customer
        JOIN Transaction
        ON Customer.Account=Transaction.Account JOIN Vendor
        ON Vendor.Vno=Transaction.Vno
          WHERE customer.Cname = nCName and transaction.Account = customer.Account and vendor.Vno = transaction.Vno
          GROUP BY vendor.Vname, transaction.TAmount, transaction.Account;
        IF nVname IS NOT NULL THEN
        RAISE NOTICE'';
        RAISE NOTICE'-----------------';
        RAISE NOTICE'Account Name: %', nCName;
        RAISE NOTICE'Vendor Name: %', nVname;
        RAISE NOTICE'Transaction Date: %', nTDate;
        RAISE NOTICE'Transaction Amount: %', CAST(nTAmount AS NUMERIC(10,2));
        RAISE NOTICE'-----------------';
        ELSE
          RAISE NOTICE'Account Name: %', nCName;
          RAISE NOTICE'NO TRANSACTIONS';
        END IF;
        exit when not found;
      end loop;
      close c1;
    end;
$$ language plpgsql;
