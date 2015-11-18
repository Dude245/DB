CREATE OR REPLACE FUNCTION p1(name char) RETURNS TABLE (
 Vname VARCHAR,
 TDate date,
 amount REAL)
AS $$
BEGIN
  RETURN QUERY
  SELECT Vendor.Vname, Transaction.TDate, Transaction.TAmount
  FROM Customer
  JOIN Transaction
  ON Customer.Account=Transaction.Account JOIN Vendor
  ON Vendor.Vno=Transaction.Vno
  WHERE LOWER(Customer.Cname) = LOWER(name);
END;
$$ LANGUAGE plpgsql;
