EXPLAIN ANALYZE
SELECT name, countrycode
FROM city
WHERE countrycode IN ('TUN', 'BE', 'NL', 'DZA');



-- DROP INDEX idx_countrycode;
-- Create an index on the country code column
CREATE INDEX idx_countrycode
ON city (countrycode);

-- DROP INDEX and then add a partial index on just the country codes that are in the query
DROP INDEX idx_countrycode;

CREATE INDEX idx_countrycode
ON city (countrycode) WHERE countrycode IN ('TUN', 'BE', 'NL');

-- ADD an index with the HASH algorithm
CREATE INDEX idx_countrycode
ON city USING hash(countrycode) ;
EXPLAIN ANALYZE
SELECT name, countrycode
FROM city
WHERE countrycode = 'BEL' OR countrycode = 'NLD' OR countrycode = 'NL';
-- WHERE countrycode IN ('TUN', 'BE', 'NL');
