
-- ## Basic Commands

-- Basic selection, limiting output for performance
SELECT *
FROM table_name
LIMIT 5; -- limits number of rows to be returned

-- Specify order of results
SELECT *
FROM table_name
ORDER BY variable ASC, variable2 DESC -- Default: ascending order | DESC to reverse order
LIMIT 5;

-- Perform calculation and provide meaningful name
SELECT id, (price - cost) AS income
FROM table_name;

-- Filtering text
SELECT *
FROM table_name
WHERE email LIKE '%gmail%' -- wildcard % any digit, any times
    AND email NOT IN ('test@gmail.com', 'nope@cool.uk')

-- BETWEEN makes it cleaner. Include edge conditions
SELECT *
FROM accounts

WHERE date >= '2016-03-31' AND date <= '2017-04-01'
WHERE date BETWEEN '2016-03-31' AND '2017-04-01';

--> Important: when working with dates, it assumes time is at 00:00:00
-- Hence, when using BETWEEN, set day after desired
WHERE date BETWEEN '2016-01-01' AND '2017-01-01' -- Entire 2016

