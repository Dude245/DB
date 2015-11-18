CREATE OR REPLACE FUNCTION p2(name char) RETURNS TABLE (
 Account VARCHAR,
 Cname VARCHAR,
 Province VARCHAR)
AS $$
BEGIN
  RETURN QUERY
  SELECT Customer.Account, Customer.Cname, Customer.Province
  FROM Customer
  JOIN Transaction
  ON Customer.Account=Transaction.Account JOIN Vendor
  ON Vendor.Vno=Transaction.Vno
  WHERE LOWER(Vendor.Vname) = LOWER(name);
END;
$$ LANGUAGE plpgsql;
