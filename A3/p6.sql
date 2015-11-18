CREATE OR REPLACE FUNCTION p6() RETURNS TABLE (
 nVname VARCHAR,
 fee NUMERIC(10,2),
 nVbalance NUMERIC(10,2))
AS $$
DECLARE
fee REAL;
BEGIN
  RETURN QUERY
  SELECT Vendor.vName, CAST((Vendor.Vbalance *.04) AS NUMERIC(10,2)), CAST (Vendor.Vbalance - (Vendor.Vbalance * .04) AS NUMERIC(10,2))
  FROM Vendor;
  UPDATE Vendor
  SET Vbalance = Vbalance - Vbalance * .04;

END;
$$ LANGUAGE plpgsql;
