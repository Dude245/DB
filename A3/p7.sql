CREATE OR REPLACE FUNCTION p7() RETURNS TABLE (
 nName VARCHAR,
 nCbalance NUMERIC(10,2))
AS $$
DECLARE
newBal REAL;
BEGIN

UPDATE Customer
SET CBalance = CBalance- (CBalance - CLimit) *.10
WHERE CBalance > CLimit;

  RETURN QUERY
  SELECT Customer.Cname, CAST (Customer.CBalance AS NUMERIC(10,2))
  FROM Customer
  WHERE CBalance > CLimit;

END;
$$ LANGUAGE plpgsql;
