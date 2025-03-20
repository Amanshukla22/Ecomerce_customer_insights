
-- E-commerce Customer Analysis (SQL Project)
-- Dataset: olist_customers_dataset
-- Objective: Analyze customer distribution, retention, and behavior


SELECT * FROM ecomers.olist_customers_dataset;

-- step 1  count of customers
select count(customer_id) as total_customers from olist_customers_dataset;
-- number of total customer 81362

-- step 2  Count the number of unique customers
SELECT COUNT(DISTINCT customer_id) AS unique_customers 
FROM olist_customers_dataset;
-- conclusion: no unique customers


-- step 3  Count customers for each state
SELECT customer_state, COUNT(*) AS total_customers 
FROM olist_customers_dataset
GROUP BY customer_state
ORDER BY total_customers DESC;
--  SP (São Paulo) has the most customers: 34,068


-- step 5   Calculate percentage contribution of customers from each state
SELECT 
    customer_state, 
    COUNT(*) AS total_customers,
    ROUND((COUNT(*) / (SELECT COUNT(*) FROM olist_customers_dataset) * 100), 2) AS percentage_contribution
FROM olist_customers_dataset
GROUP BY customer_state
ORDER BY total_customers DESC;



--  6   Get top 10 cities with the highest number of customers
SELECT customer_city, COUNT(*) AS total_customers 
FROM olist_customers_dataset
GROUP BY customer_city
ORDER BY total_customers DESC
LIMIT 10;
-- Conclusion:
-- São Paulo has the highest number of customers (12,723) – a huge lead!


-- step 7  Counting the total number of orders for each customer
-- Sorting the result in descending order to get the top 10 customers
SELECT customer_id, COUNT(*) AS total_orders
FROM olist_customers_dataset
GROUP BY customer_id
ORDER BY total_orders DESC
LIMIT 10;

-- step 8  Find customers who have placed more than one order
SELECT customer_unique_id, COUNT(*) AS total_orders
FROM olist_customers_dataset
GROUP BY customer_unique_id
HAVING COUNT(*) > 1
ORDER BY total_orders DESC limit 10;


-- Count the number of customers in each state
SELECT 
    customer_state, 
    COUNT(customer_id) AS total_customers
FROM olist_customers_dataset
GROUP BY customer_state
ORDER BY total_customers DESC
LIMIT 1;


-- Count customers per city
SELECT customer_city, COUNT(*) AS total_customers
FROM olist_customers_dataset
GROUP BY customer_city
ORDER BY total_customers DESC
LIMIT 10;


-- Count distinct states
SELECT COUNT(DISTINCT customer_state) AS total_unique_states
FROM olist_customers_dataset;



-- Step 16: Find the top 5 states with the most customers
SELECT customer_state, COUNT(*) AS total_customers
FROM olist_customers_dataset
GROUP BY customer_state
ORDER BY total_customers DESC
LIMIT 5;

-- Step 17: Identify customers with multiple orders
SELECT customer_id, COUNT(*) AS order_count
FROM olist_customers_dataset
GROUP BY customer_id
HAVING order_count > 1
ORDER BY order_count DESC


-- 🔍 Conclusion:
-- 1️⃣ São Paulo has the highest number of customers, followed by Rio de Janeiro.
-- 2️⃣ Most customers make only one order, but some repeat customers exist.
-- 3️⃣ Customer retention rate is low, meaning most customers are one-time buyers.
--  4️⃣ The average number of customers per state gives insight into demand distribution.



