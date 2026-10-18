create table customers (
customer_id int primary key,
customer_name varchar (100) not null,
email varchar (150),
city varchar(60),
state varchar(60),
singup_date date
);

create table products(
product_id int primary key,
product_name varchar (120)not null,
category varchar (60),
unit_price decimal (10,2),
stock_quantity int
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department VARCHAR(60),
    salary DECIMAL(10,2),
    hire_date DATE
);


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    employee_id INT REFERENCES employees(employee_id),
    order_date DATE,
    status VARCHAR(30),
    payment_method VARCHAR(50)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT,
    unit_price DECIMAL(10,2),
    discount DECIMAL(5,2)
);

CREATE TABLE returns (
    return_id INT PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    return_date DATE,
    return_reason VARCHAR(200)
);

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_type = 'BASE TABLE'
ORDER BY table_name;


INSERT INTO customers
(customer_id, customer_name, email, city, state, signup_date)
VALUES
(1001, 'Aarav Sharma', 'aarav.sharma@example.com', 'Lucknow', 'Uttar Pradesh', '2024-01-15'),
(1002, 'Diya Verma', 'diya.verma@example.com', 'Kanpur', 'Uttar Pradesh', '2024-02-10'),
(1003, 'Kabir Singh', 'kabir.singh@example.com', 'Delhi', 'Delhi', '2023-11-22'),
(1004, 'Meera Patel', 'meera.patel@example.com', 'Jaipur', 'Rajasthan', '2024-03-05'),
(1005, 'Ishaan Gupta', 'ishaan.gupta@example.com', 'Lucknow', 'Uttar Pradesh', '2023-08-19'),
(1006, 'Ananya Rao', 'ananya.rao@example.com', 'Bhopal', 'Madhya Pradesh', '2024-04-12'),
(1007, 'Reyansh Khan', 'reyansh.khan@example.com', 'Delhi', 'Delhi', '2024-05-01'),
(1008, 'Saanvi Joshi', 'saanvi.joshi@example.com', 'Pune', 'Maharashtra', '2023-12-09'),
(1009, 'Vivaan Mishra', 'vivaan.mishra@example.com', 'Lucknow', 'Uttar Pradesh', '2024-06-17'),
(1010, 'Aditi Das', 'aditi.das@example.com', 'Kolkata', 'West Bengal', '2024-07-02'),
(1011, 'Arjun Mehta', 'arjun.mehta@example.com', 'Jaipur', 'Rajasthan', '2023-09-14'),
(1012, 'Myra Nair', 'myra.nair@example.com', 'Mumbai', 'Maharashtra', '2024-08-21');

select * from customers;


INSERT INTO products
(product_id, product_name, category, unit_price, stock_quantity)
VALUES
(201, 'Wireless Mouse', 'Accessories', 799.00, 80),
(202, 'Mechanical Keyboard', 'Accessories', 2499.00, 35),
(203, 'USB-C Hub', 'Accessories', 1899.00, 42),
(204, '27-inch Monitor', 'Displays', 14999.00, 18),
(205, 'Laptop Stand', 'Accessories', 1299.00, 55),
(206, 'Webcam HD', 'Peripherals', 3299.00, 40),
(207, 'Noise-Cancelling Headphones', 'Audio', 5999.00, 20),
(208, 'Bluetooth Speaker', 'Audio', 2199.00, 60),
(209, 'External SSD 1TB', 'Storage', 7499.00, 16),
(210, 'Ergonomic Chair', 'Furniture', 11999.00, 12);

select * from products;


INSERT INTO employees
(employee_id, employee_name, department, salary, hire_date)
VALUES
(301, 'Rahul Verma', 'Sales', 35000.00, '2022-04-15'),
(302, 'Priya Sharma', 'Marketing', 40000.00, '2021-08-10'),
(303, 'Amit Singh', 'Sales', 32000.00, '2023-01-20'),
(304, 'Neha Gupta', 'IT', 50000.00, '2020-11-05'),
(305, 'Vikram Patel', 'HR', 38000.00, '2022-07-12'),
(306, 'Pooja Mishra', 'Sales', 36000.00, '2023-06-01'),
(307, 'Karan Mehta', 'IT', 48000.00, '2021-03-18'),
(308, 'Sneha Rao', 'Marketing', 42000.00, '2022-09-25');

select * from employees;


INSERT INTO orders
(order_id, customer_id, employee_id, order_date, status, payment_method)
VALUES
(10001, 1001, 301, '2024-09-01', 'Delivered', 'UPI'),
(10002, 1002, 302, '2024-09-02', 'Delivered', 'Credit Card'),
(10003, 1003, 303, '2024-09-03', 'Shipped', 'Debit Card'),
(10004, 1004, 301, '2024-09-04', 'Delivered', 'UPI'),
(10005, 1005, 304, '2024-09-05', 'Processing', 'Credit Card'),
(10006, 1006, 306, '2024-09-06', 'Delivered', 'Cash'),
(10007, 1007, 303, '2024-09-07', 'Cancelled', 'UPI'),
(10008, 1008, 307, '2024-09-08', 'Shipped', 'Debit Card'),
(10009, 1009, 301, '2024-09-09', 'Delivered', 'Credit Card'),
(10010, 1010, 306, '2024-09-10', 'Processing', 'UPI');

select * from orders;


INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price, discount)
VALUES
(1, 10001, 201, 2, 799.00, 0),
(2, 10001, 202, 1, 2499.00, 5),
(3, 10002, 204, 1, 14999.00, 10),
(4, 10003, 203, 2, 1899.00, 0),
(5, 10004, 205, 1, 1299.00, 0),
(6, 10005, 206, 1, 3299.00, 5),
(7, 10006, 208, 2, 2199.00, 0),
(8, 10007, 207, 1, 5999.00, 0),
(9, 10008, 209, 1, 7499.00, 10),
(10, 10009, 210, 1, 11999.00, 5);

select * from order_items;


INSERT INTO returns
(return_id, order_id, return_date, return_reason)
VALUES
(1, 10002, '2024-09-12', 'Damaged product'),
(2, 10004, '2024-09-13', 'Wrong item received'),
(3, 10007, '2024-09-14', 'Order cancelled'),
(4, 10009, '2024-09-15', 'Product not working');


(10, 10009, 210, 1, 11999.00, 5);



-----------------------------QUESTIONS/ANSWERS-----------------------


--Question 1: List delivered orders placed between 1 October 2024 and 31 March 2025. 
--Show order_id, order_date, customer_id, and payment_method. Sort by order_date descending.

SELECT order_id, order_date, customer_id, payment_method
FROM orders
WHERE status = 'Delivered'
  AND order_date >= '2024-10-01'
  AND order_date < '2025-04-01'
ORDER BY order_date DESC;


---Output---

--The result is 0 rows because all the sample orders you provided are dated in September 2024. The query only selects delivered orders placed between October 1, 2024,
-- and March 31, 2025.


---Question 2 :Display each delivered order with the customer’s name, order ID, 
--order date, employee’s name,and order status. Include only orders with matching customer 
--and employee records. 

SELECT
    c.customer_name,
    o.order_id,
    o.order_date,
    e.employee_name,
    o.status AS order_status
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
JOIN employees e ON e.employee_id = o.employee_id
WHERE o.status = 'Delivered';

---OUTPUT---

--The query returns five delivered orders:


--Question 3 : For each product category, calculate the total units sold and net revenue from 
--delivered orders. Show only categories with net revenue greater than ₹10,000, sorted by net
-- revenue from highest to lowest.  

SELECT
    p.category,
    SUM(oi.quantity) AS total_units_sold,
    SUM(oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)) AS net_revenue
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id
WHERE o.status = 'Delivered'
GROUP BY p.category
HAVING SUM(oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)) > 10000
ORDER BY net_revenue DESC;

---OUTPUT---
--The query returns two product categories with net revenue greater than ₹10,000:
-- Displays: 1 unit sold, with net revenue of ₹13,499.10.
--Furniture: 1 unit sold, with net revenue of ₹11,399.05.


--Question 4 : Find customers who have placed at least two delivered orders. Show the customer ID,
-- customer name, number of delivered orders, and total net spend.

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(DISTINCT o.order_id) AS delivered_order_count,
    SUM(oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)) AS total_net_spend
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
WHERE o.status = 'Delivered'
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(DISTINCT o.order_id) >= 2;

---OUTPUT---
--No customer in the provided sample data has placed two or more delivered orders.

--Question 5 : List every customer and the number of delivered orders they have
-- placed, including customers with no delivered orders.

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS delivered_order_count
FROM customers c
LEFT JOIN orders o
    ON o.customer_id = c.customer_id
   AND o.status = 'Delivered'
GROUP BY c.customer_id, c.customer_name
ORDER BY c.customer_id;

---OUTPUT---

--The query returns all 12 customers and their delivered-order counts. Five customers have
-- one delivered order each: Aarav Sharma, Diya Verma, Meera Patel, Ananya Rao, and Vivaan 
--Mishra. The other seven customers have no delivered orders.


--Question 6 : Find products whose unit price is greater than the average unit price of all
-- products. Display the product name, category, unit price, and average price.

SELECT
    product_name,
    category,
    unit_price,
    (SELECT AVG(unit_price) FROM products) AS average_price
FROM products
WHERE unit_price > (SELECT AVG(unit_price) FROM products);

---OUTPUT---

--The average unit price of all products is ₹5,249.00. The products priced 
--above the average are


--Question 7 : Find customers who have never placed a delivered order. Show 
--their customer ID, name, and city.

SELECT c.customer_id, c.customer_name, c.city
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
      AND o.status = 'Delivered'
);

---OUTPUT---

---Seven customers have never placed a delivered order:


---Question 8 : Group delivered orders by year and month. Show the number of orders and net 
--revenue for each month, sorted chronologically.

SELECT
    EXTRACT(YEAR FROM o.order_date) AS order_year,
    EXTRACT(MONTH FROM o.order_date) AS order_month,
    COUNT(DISTINCT o.order_id) AS delivered_order_count,
    SUM(oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)) AS net_revenue
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
WHERE o.status = 'Delivered'
GROUP BY
    EXTRACT(YEAR FROM o.order_date),
    EXTRACT(MONTH FROM o.order_date)
ORDER BY order_year, order_month;


---OUTPUT---
--The sample data contains five delivered orders, all placed in September 2024.
-- Their combined net revenue is ₹34,567.20


--Question 9 : Classify each product as Low Stock when stock is below 20, Moderate Stock when stock
-- is between 20 and 40 inclusive, and High Stock when stock is above 40. Show the product name,
-- stock quantity, and stock label.

SELECT
    product_name,
    stock_quantity,
    CASE
        WHEN stock_quantity < 20 THEN 'Low Stock'
        WHEN stock_quantity BETWEEN 20 AND 40 THEN 'Moderate Stock'
        ELSE 'High Stock'
    END AS stock_label
FROM products;

---OUTPUT---

--The query classifies the products by stock level. Three products are Low Stock, 
--three are Moderate Stock, and four are High Stock.


--Question 10 : For each employee, calculate the number of delivered,
-- returned, and cancelled orders. Include employees who have no orders.


SELECT
    e.employee_id,
    e.employee_name,
    SUM(CASE WHEN o.status = 'Delivered' THEN 1 ELSE 0 END) AS delivered_order_count,
    SUM(CASE WHEN o.status = 'Returned' THEN 1 ELSE 0 END) AS returned_order_count,
    SUM(CASE WHEN o.status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_order_count
FROM employees e
LEFT JOIN orders o ON o.employee_id = e.employee_id
GROUP BY e.employee_id, e.employee_name
ORDER BY e.employee_id;


---OUTPUT---
--The query returns order counts for all eight employees. Rahul Verma has three delivered 
--orders. Priya Sharma and Pooja Mishra have one delivered order each. Amit Singh has one cancelled order. Neha Gupta,
-- Karan Mehta, and Sneha Rao have no orders. No returned orders appear in the sample data.


--Question 11 : Rank products within each category by net revenue from delivered orders,
-- highest first. Show the category, product name, net revenue, and rank. 
--Products with no delivered sales should also appear with zero revenue.

WITH product_revenue AS (
    SELECT
        p.product_id,
        p.category,
        p.product_name,
        COALESCE(
            SUM(
                CASE
                    WHEN o.status = 'Delivered'
                    THEN oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)
                    ELSE 0
                END
            ),
            0
        ) AS net_revenue
    FROM products p
    LEFT JOIN order_items oi ON oi.product_id = p.product_id
    LEFT JOIN orders o ON o.order_id = oi.order_id
    GROUP BY p.product_id, p.category, p.product_name
)
SELECT
    category,
    product_name,
    net_revenue,
    RANK() OVER (
        PARTITION BY category
        ORDER BY net_revenue DESC
    ) AS revenue_rank
FROM product_revenue
ORDER BY category, revenue_rank, product_name;


---OUTPUT---

--The delivered products ranked by net revenue are: the 27-inch Monitor, ₹13,499.10; the 
--Ergonomic Chair, ₹11,399.05; the Bluetooth Speaker, ₹4,398.00; the Mechanical Keyboard, 
--₹2,374.05; the Wireless Mouse, ₹1,598.00; and the Laptop Stand, ₹1,299.00. The remaining 
--products had no delivered sales and a net revenue of ₹0.00. Rankings are within each product category.


--Question 12 : For each month, calculate delivered-order net revenue and a cumulative running 
--total in chronological order.

WITH monthly_revenue AS (
    SELECT
        EXTRACT(YEAR FROM o.order_date) AS order_year,
        EXTRACT(MONTH FROM o.order_date) AS order_month,
        SUM(
            oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)
        ) AS net_revenue
    FROM orders o
    JOIN order_items oi ON oi.order_id = o.order_id
    WHERE o.status = 'Delivered'
    GROUP BY
        EXTRACT(YEAR FROM o.order_date),
        EXTRACT(MONTH FROM o.order_date)
)
SELECT
    order_year,
    order_month,
    net_revenue,
    SUM(net_revenue) OVER (
        ORDER BY order_year, order_month
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM monthly_revenue
ORDER BY order_year, order_month;


---OUTPUT---

--All five delivered orders were placed in September 2024. The net revenue for that month 
--is ₹34,567.20, and the running total is also ₹34,567.20.


---Question 13 : List each returned order with the customer’s name, return date,
-- return reason, and the total pre-discount value of its order items.

SELECT
    o.order_id,
    c.customer_name,
    r.return_date,
    r.return_reason,
    SUM(oi.quantity * oi.unit_price) AS pre_discount_order_value
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
JOIN returns r ON r.order_id = o.order_id
JOIN order_items oi ON oi.order_id = o.order_id
WHERE o.status = 'Returned'
GROUP BY
    o.order_id,
    c.customer_name,
    r.return_date,
    r.return_reason;


---OUTPUT---

--The query returns no rows because the sample data you provided contains no returned orders.


--Question 14 : Using a CTE, calculate net revenue per customer from delivered orders,
-- then return customers whose net revenue is above the average customer net revenue.


WITH customer_revenue AS (
    SELECT
        c.customer_id,
        c.customer_name,
        COALESCE(
            SUM(
                CASE
                    WHEN o.status = 'Delivered'
                    THEN oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)
                    ELSE 0
                END
            ),
            0
        ) AS net_revenue
    FROM customers c
    LEFT JOIN orders o ON o.customer_id = c.customer_id
    LEFT JOIN order_items oi ON oi.order_id = o.order_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT
    customer_id,
    customer_name,
    net_revenue
FROM customer_revenue
WHERE net_revenue > (
    SELECT AVG(net_revenue)
    FROM customer_revenue
);


---OUTPUT---

--Four customers have net revenue above the average of ₹2,880.60: Diya Verma (₹13,499.10),
-- Vivaan Mishra (₹11,399.05), Ananya Rao (₹4,398.00), and Aarav Sharma (₹3,972.05). The 
--average is calculated across all 12 customers.



--Question 15 : Identify the top three customers by delivered net spend. Show each customer’s name,
-- number of delivered orders, net spend, and percentage contribution to total delivered net
-- revenue.


WITH customer_spend AS (
    SELECT
        c.customer_id,
        c.customer_name,
        COUNT(DISTINCT o.order_id) AS delivered_order_count,
        SUM(
            oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)
        ) AS net_spend
    FROM customers c
    JOIN orders o ON o.customer_id = c.customer_id
    JOIN order_items oi ON oi.order_id = o.order_id
    WHERE o.status = 'Delivered'
    GROUP BY c.customer_id, c.customer_name
),
ranked_customers AS (
    SELECT
        customer_name,
        delivered_order_count,
        net_spend,
        100.0 * net_spend / SUM(net_spend) OVER () AS revenue_contribution_percentage
    FROM customer_spend
)
SELECT
    customer_name,
    delivered_order_count,
    net_spend,
    revenue_contribution_percentage
FROM ranked_customers
ORDER BY net_spend DESC
FETCH FIRST 3 ROWS ONLY;


---OUTPUT---

--The top three customers by delivered net spend are Diya Verma, Vivaan Mishra, and
-- Ananya Rao. Their net spends are ₹13,499.10, ₹11,399.05, and ₹4,398.00, respectively. 
--Their percentage contributions are calculated from total delivered net revenue of ₹34,567.20.