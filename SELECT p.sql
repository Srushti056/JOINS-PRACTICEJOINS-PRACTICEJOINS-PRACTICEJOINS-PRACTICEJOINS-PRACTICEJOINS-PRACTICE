SELECT p.product_name, 
       SUM(s.amount) AS total_sales
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC;

SELECT customer_id, 
       COUNT(sale_id) AS number_of_sales, 
       AVG(amount) AS avg_sale_amount
FROM Sales
GROUP BY customer_id
HAVING COUNT(sale_id) > 1  -- Filter customers with more than 1 sale
ORDER BY number_of_sales DESC;

SELECT p.product_name, 
       SUM(s.amount) AS total_sales
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
WHERE s.sale_date BETWEEN '2025-03-01' AND '2025-03-07'
GROUP BY p.product_name
ORDER BY total_sales DESC
LIMIT 1;
SELECT customer_id, 
       COUNT(DISTINCT product_id) AS number_of_products
FROM Sales
GROUP BY customer_id
HAVING COUNT(DISTINCT product_id) > 1;
SELECT p.category, 
       MAX(s.amount) AS highest_sale
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.category;
SELECT customer_id, 
       amount AS highest_purchase
FROM Sales
WHERE amount = (SELECT MAX(amount) FROM Sales);