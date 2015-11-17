CREATE OR REPLACE FUNCTION p3(acc char, name char, prov char, clim real) RETURNS TABLE (
  Account VARCHAR,
  Cname VARCHAR,
  Province VARCHAR,
  CBalance REAL,
  CLimit REAL)
AS $$
BEGIN
  insert into Customer values (acc, name, prov, 0, clim);
  RETURN QUERY
  SELECT *
  FROM Customer;
END;
$$ LANGUAGE plpgsql;
