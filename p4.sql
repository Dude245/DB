CREATE OR REPLACE FUNCTION p4() RETURNS TABLE (
  --account number, customer name, amount, and vendor name
 Account VARCHAR,
 Cname VARCHAR,
 CBalance VARCHAR,
 Vname VARCHAR)
AS $$
BEGIN
  RETURN QUERY
  SELECT Customer.Account, Customer.Cname, Customer.CBalance, Vendor.Vname
  FROM Customer
  JOIN Transaction
  ON Customer.Account=Transaction.Account JOIN Vendor
  ON Vendor.Vno=Transaction.Vno
  WHERE
    SELECT MAX(Transaction.TDate)
    FROM Customer
    JOIN Transaction
    ON Customer.Account=Transaction.Account JOIN Vendor
    ON Vendor.Vno=Transaction.Vno;
END;
$$ LANGUAGE plpgsql;
