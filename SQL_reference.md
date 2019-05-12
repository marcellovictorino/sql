
# SQL Basic Commands

+ **Basic selection**
limiting output for performance
```sql
SELECT *
FROM table_name
LIMIT 5; -- limits number of rows to be returned
```

+ **Specify order of results**
```sql
SELECT *
FROM table_name
ORDER BY variable ASC, variable2 DESC -- Default: ascending order | DESC to reverse order
LIMIT 5;
```

+ **Perform calculation and alias**
```sql
SELECT id, (price - cost) AS income
FROM table_name;
```

+ **Filtering text**
```sql
SELECT *
FROM table_name
WHERE email LIKE '%gmail%' -- wildcard % any digit, any times
    AND email NOT IN ('test@gmail.com', 'nope@cool.uk')
```

+ **Using BETWEEN**
Makes it cleaner. Include edge conditions.
```sql
SELECT *
FROM accounts

WHERE date >= '2016-03-31' AND date <= '2017-04-01'
----------- exact same
WHERE date BETWEEN '2016-03-31' AND '2017-04-01';
```

> **Important**: when working with dates, it assumes time is at 00:00:00
Hence, when using `BETWEEN`, set day after desired
```sql
WHERE date BETWEEN '2016-01-01' AND '2017-01-01' -- Entire 2016
```

# SQL Joining
+ **Basic Join** (INNER)
```sql
SELECT orders.*,
        accounts.* -- additional info from additional joined tables
FROM orders o
JOIN accounts ON orders.account_id = accounts.id;
-- Join which additional table, ON which PK = FK
```
+ **Using Alias for Table Names**
```sql
SELECT o.*,
        a.* -- additional info from additional joined tables
FROM orders o
JOIN accounts a ON o.account_id = a.id;
```
> **Important**: if columns from multiple joins have same name, necessary to create `alias` in order to separate and display results

### INNER Join:
Matches just the exact match between 2 tables
### LEFT Join:
All INNER results, plus all rows from LEFT table - even if no values (return as NULL)

```sql
SELECT o.*, a.*
FROM orders o
LEFT JOIN account a ON o.account_id = a.id
```

+ **Joining and Filtering**
For the special case of `LEFT JOIN`, it is possible to use `AND` clause after `ON` instead of `WHERE` in order to filter the desired results, but still keep all data from LEFT table
```sql
SELECT o.*, a.*
FROM orders o
LEFT JOIN accounts a ON o.account_id = a.id
AND a.sales_rep_id = 1251
-- will return all entries from orders, with matching values for sales rep id = 1251
-----------------------
WHERE a.sales_rep_id = 1251
-- would filter only those rows, after the join
-- defeating the purpose of the LEFT JOIN
```

# Advanced Commands
+ **CASE**: creates new column with results based on specific conditions (IF-THEN-ELSE)

```sql
SELECT *
CASE
        WHEN quantity > 30 THEN "greater than 30"
        WHEN quantity = 30 "equals 30"
        ELSE "under 30"
END AS quantityText -- alias for new columns result
FROM orders
```

+ **EXISTS**: test a sub-query, returning True if sub-query returns one or more results
> Works like a *mask* to filter results from a different dataframe

```sql
SELECT supplier_name
FROM suppliers
WHERE EXISTS -- mask to filter supplier names with the below sub-query True
        (SELECT * FROM products
        WHERE supplier_id = suppliers.id AND price < 20)
```

+ **GROUP BY**: group results using aggregate function, such as `SUM`, `COUNT`, `MAX`, `MIN`, `AVG`

```sql
SELECT COUNT(customer_id), country
FROM customers
GROUP BY country
        HAVING COUNT(customer_id) >5 -- filter for aggregation conditions (instead of WHERE)
ORDER BY COUNT(customer_id) DESC -- sorting in reverse order;
```