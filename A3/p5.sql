CREATE OR REPLACE FUNCTION p5() RETURNS TABLE (
  nVno VARCHAR,
  nVname VARCHAR,
  nVbalance NUMERIC(10,2))
AS $$
DECLARE
c1 cursor for select Transaction.Tno,Transaction.Vno,Transaction.Account,Transaction.TAmount from Transaction;
TrTno VARCHAR;
TrVno VARCHAR;
TrAccount VARCHAR;
TrTAmount REAL;

BEGIN
  open c1;
  loop
    fetch c1 into TrTno,TrVno,TrAccount,TrTAmount;
    exit when not found;
      UPDATE Vendor
      SET Vbalance = Vbalance + TrTAmount
      WHERE Vno = TrVno;
  end loop;
  close c1;


  RETURN QUERY
  SELECT Vendor.Vno, Vendor.Vname, CAST(Vendor.Vbalance AS NUMERIC(10,2))
  FROM Vendor;
END;
$$ LANGUAGE plpgsql;
