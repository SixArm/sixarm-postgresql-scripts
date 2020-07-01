-- Generate random hexadecimal lowercase string
CREATE FUNCTION random_hex(len NUMERIC) 
RETURNS CHAR(len) AS $$
	SELECT string_agg(substr(chars, (random() * length(chars) + 1)::integer, 1), '') as id
	FROM (values('0123456789abcdef')) as symbols(chars)
	JOIN generate_series(1, len) on 1 = 1;
$$ LANGUAGE SQL VOLATILE;
