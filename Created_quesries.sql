-- Madhu sudhan K N
-- 6/10/2023 

USE sql_store;
SELECT * FROM customers 
WHERE customer_id=1 
ORDER BY first_name;

-- creating another sub column for points with some changes
SELECT first_name,
		last_name,
        points,
        (points + 10) AS Discount
FROM customers;

-- changing column values using Select clause
SELECT state
FROM customers;

-- USING DISTINCT Retrive unique list alter
SELECT DISTINCT state
FROM customers;

-- Retrieving all the product details  
SELECT *
FROM products;

-- Returning only name unit price and new price (unit price * 1.1)
SELECT name,
		unit_price,
        (unit_price * 1.1) AS 'New Unit price'
FROM products;

-- Filtering Data using where clause
SELECT *
FROM products
WHERE quantity_in_stock > 50;

SELECT *
FROM customers
WHERE state = 'VA';

SELECT * 
FROM customers
WHERE birth_date = '1990-01-01'; 

SELECT *
FROM orders
WHERE order_date >= '2019-01-30';

-- Combine multiple conditions using AND OR , NOT operators
SELECT * 
FROM products
WHERE quantity_in_stock > 50 AND quantity_in_stock< 100;

SELECT * 
FROM products
WHERE quantity_in_stock = 50 OR quantity_in_stock < 60;

SELECT * 
FROM products
WHERE quantity_in_stock = 50 OR 
	(quantity_in_stock < 60 AND unit_price = 3.35);
    
SELECT * 
FROM products
WHERE NOT (quantity_in_stock = 50 AND quantity_in_stock > 70) OR unit_price = 3.35;


-- From the order of items tables 
-- Fetch the order no 6 where the total price is >30
SELECT * 
FROM order_items
WHERE order_id = 6 AND (unit_price * quantity) > 30;


-- Use of IN Operator
-- IN operator is used when query contains multiple OR operators
SELECT * 
FROM products
WHERE quantity_in_stock IN (70,94,14);   -- IT display only passed values

SELECT * 
FROM products
WHERE quantity_in_stock NOT IN (70,94,14); -- IT display data except passed values 

-- Get the products with quantity in stocks equal to  49,38,72
SELECT * 
FROM products
WHERE quantity_in_stock IN (49,38,72);

-- Use of BETWEEN OPERATOR 
SELECT * 
FROM customers
WHERE points BETWEEN 1000 AND 2000;

-- Returning customer born between 1/1/1990 and 1/1/2000
SELECT *
FROM customers
WHERE birth_date BETWEEN '1990/1/1' AND '2000/1/1'; 

-- Retrive rows and that match specific string pattern using like operator
SELECT * 
FROM customers
WHERE last_name LIKE '%B%';

SELECT * 
FROM customers
WHERE first_name LIKE 'y%';

SELECT * 
FROM customers
WHERE last_name LIKE '_____y';

SELECT * 
FROM customers
WHERE last_name LIKE 'b____y';

SELECT * 
FROM customers
WHERE last_name LIKE '_____a';

-- Fetch the customers whose city contain 
-- TRAIL or NASHVILLE  phno end with 9
SELECT *
FROM customers
WHERE city IN ('Trail','Nashville') 
AND phone LIKE "%9";

-- Use of REGEXP operator
 SELECT *
 FROM customers
 WHERE last_name REGEXP 'field|mac|rose';
 
 SELECT * 
 FROM customers
 WHERE last_name REGEXP '[GIM]E';
 
 SELECT *
 FROM customers
 WHERE last_name REGEXP 'E[LAH]';
 
 SELECT *
 FROM customers 
 WHERE last_name REGEXP '[A-Z]E';
 
 SELECT * 
 FROM customers
 WHERE first_name REGEXP '[A-M]E';
 
 -- Get the Customer whose
 -- Firstname are ELKA OR AMBUR
 -- lastname ends with EY or on
 -- lastname starts with MY or contains SE 
 -- last name contains B followed by R or U
 SELECT *
 FROM customers
 WHERE first_name REGEXP 'ELKA|AMBUR';
 
 SELECT *
 FROM customers
 WHERE last_name REGEXP '[A-Z]EY|[A-Z]ON';
 
SELECT *
 FROM customers
 WHERE last_name REGEXP 'MY[A-Z]' 
 OR last_name LIKE '%SE%';
 
 SELECT *
 FROM customers
 WHERE last_name LIKE 'BR|BU';
 
 -- Use of NULL Opeartor
 SELECT *
 FROM customers
 WHERE phone is NULL;
 
SELECT *
 FROM customers
 WHERE phone is NOT NULL;
 
 -- Get the orders are not shipped yet
 SELECT *
 FROM orders
 WHERE shipped_date IS NULL;
 
 -- Get the orders are shipped details
  SELECT *
 FROM orders
 WHERE shipped_date IS NOT NULL;
 
 -- Use of Order By clause
 -- When we use order by it will give data in asc order
 SELECT *
 FROM customers
ORDER BY first_name DESC;

SELECT first_name, last_name, 10+points AS points
FROM customers
ORDER BY points,first_name;

SELECT first_name, last_name, birth_date
FROM customers
ORDER BY birth_date;

-- Select all the items with id2 and sort them by total price in desc order 
SELECT *,quantity * unit_price AS 'Total price'
FROM order_items
WHERE order_id=2 
ORDER BY 'Total price';

-- Use of LIMIT Clause
SELECT * 
FROM customers
LIMIT 3 , 6;

-- Get top 3 customers
SELECT *
 FROM customers
 ORDER BY points DESC
 LIMIT 3;
 
--  // Inner JOINS
-- here inner keyword is optional 
SELECT *
FROM orders 
JOIN customers
ON customers.customer_id = orders.customer_id; 

SELECT order_id,o.customer_id AS 'order table customer id',
	c.customer_id AS 'Customer table customer_id'
FROM orders o
JOIN customers c
	ON c.customer_id = o.customer_id;

-- Join the product and order table 
-- return product id and name , quantity and unitprice from order items table
SELECT *
FROM order_items;

SELECT *
FROM products;

SELECT *
FROM order_items o
JOIN products p 
	ON o.product_id = p.product_id;
    
SELECT order_id,o.product_id,p.name,o.quantity,o.unit_price
FROM order_items o
JOIN products p
	ON o.product_id = p.product_id;
 
-- // JOining across database
-- // COmbine column from multiple databases 
SELECT *
FROM sql_store.products AS db1
JOIN sql_inventory.products AS db2
ON db1.product_id = db2.product_id;

-- // Self JOINS
SELECT E.employee_id,
	   M.first_name
FROM employees AS E
JOIN employees AS M 
	ON E.reports_to = M.employee_id;
    
-- JOining Multiple tables
 