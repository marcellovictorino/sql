# SQL
This repository contains everything SQL related.

Following Udacity SQL Course. 
[PostgreSQL](https://www.postgresql.org/): very complete library for analytical functions

## Advantages
+ SQL commands are **easy to understand**
+ Traditional databases allow to **access data directly** - no need to work on a copy
+ It also allows to **audit** and **replicate** data
+ Possible to analyze **multiple tables at once** - very efficiently
+ Very **flexible**, possible to perform complex queries for data analysis
+ No **data overload** - possible to work with **billions** of rows, whereas Excel maxes at millions

> All data in a column have the exact same data type. Similar to *Numpy*.
Leading to excellent performance, running fast and over Billions of observations

## Good Practices
+ SQL commands in UPPER case
+ Everything else in lower case
+ Avoid spaces in table and variable names
    - In case of space: `"table name"` or `[table name]`
+ Use ; at the end of query
+ While writing queries, use `LIMIT 5` to avoid loading the entire dataset - similar to `df.head()`