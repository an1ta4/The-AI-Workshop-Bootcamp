-- Classwork 1 — Query the Views

-- Used `vw_sales_summary` to answer each question.

-- ============================================================
-- DROP then CREATE — run both together each time you update
-- ============================================================
DROP VIEW IF EXISTS vw_orders;
GO

CREATE VIEW vw_orders AS
SELECT *
FROM (
    VALUES
    -- order_id  customer  product    order_date     qty  unit_price  promo_code
        (1,  'Alice',   'Latte',       '2024-01-05',   2,   3.50,  'SAVE10'),
        (2,  'Bob',     'Espresso',    '2024-01-12',   1,   2.00,   NULL   ),
        (3,  'Clara',   'Cappuccino',  '2024-02-03',   3,   3.20,  'SAVE10'),
        (4,  'David',   'Latte',       '2024-02-18',   1,   3.50,   NULL   ),
        (5,  'Eve',     'Tea',         '2024-03-07',   4,   1.80,   NULL   ),
        (6,  'Frank',   'Espresso',    '2024-03-22',   2,   2.00,  'VIP20' ),
        (7,  'Grace',   'Cappuccino',  '2024-04-10',   1,   3.20,   NULL   ),
        (8,  'Henry',   'Latte',       '2024-04-25',   5,   3.50,  'VIP20' ),
        (9,  'Isla',    'Tea',         '2024-05-01',   2,   1.80,   NULL   ),
        (10, 'James',   'Espresso',    '2024-05-14',   3,   2.00,  'SAVE10')
) AS t(order_id, customer, product, order_date, qty, unit_price, promo_code);
GO

-- Quick check
SELECT * FROM vw_orders;


-- **Q1.** Find all orders for `'Latte'` or `'Cappuccino'` where the quantity is greater than 1.  
-- Return the customer name, product, and quantity.

SELECT customer, product, qty
FROM vw_orders
WHERE (product = 'Latte' OR product = 'Cappuccino') AND qty > 1;


-- **Q2.** Find all orders placed between `'2024-02-01'` and `'2024-04-30'` where a promo code was used.  
-- Return the customer, product, order date, and promo code.

SELECT customer, product, order_date, promo_code
FROM vw_orders
WHERE order_date BETWEEN '2024-02-01' AND '2024-04-30' AND promo_code IS NOT NULL;


-- **Q3.** Find all customers whose name starts with the letters `A`, `E`, or `I`. 

SELECT customer
FROM vw_orders
WHERE customer LIKE 'A%' OR customer LIKE 'E%' OR customer LIKE 'I%';


--**Q4.** Find all orders where the promo code is `NULL` **or** the quantity is exactly `1`.

SELECT *
FROM vw_orders
WHERE promo_code IS NULL OR qty = 1;


-- **Q5.** Using `vw_sales_summary`, show only the products whose **total revenue across all months** is greater than `£200`. 
-- *(Hint: `GROUP BY` + `HAVING`)*

-- ============================================================
-- DROP then CREATE — run both together each time you update
-- ============================================================
DROP VIEW IF EXISTS vw_sales_summary;
GO

CREATE VIEW vw_sales_summary AS
SELECT *
FROM (
    VALUES
    --  sale_id  product        month        units_sold  revenue
        (1,  'Latte',       'January',    45,   157.50),
        (2,  'Espresso',    'January',    30,    60.00),
        (3,  'Cappuccino',  'January',    20,    64.00),
        (4,  'Tea',         'January',    10,    18.00),
        (5,  'Latte',       'February',   50,   175.00),
        (6,  'Espresso',    'February',   25,    50.00),
        (7,  'Cappuccino',  'February',   15,    48.00),
        (8,  'Tea',         'February',    5,     9.00),
        (9,  'Latte',       'March',      60,   210.00),
        (10, 'Espresso',    'March',      40,    80.00),
        (11, 'Cappuccino',  'March',      30,    96.00),
        (12, 'Tea',         'March',       8,    14.40)
) AS t(sale_id, product, month, units_sold, revenue);
GO

-- Quick check
SELECT * FROM vw_sales_summary;

SELECT product, SUM (revenue) AS total_revenue
From vw_sales_summary
GROUP BY product
HAVING  SUM (revenue)  > 200;


-- Classwork 2 — Build Your Own View

-- Create a view from scratch — no tables, just `VALUES`.

--Create a view called `vw_my_data` that meets these requirements:

--Once your view is created, write **three queries** against it that each use at least one of:

-- - A `WHERE` clause with `AND` / `OR` and parentheses
-- `BETWEEN` or `IN`
-- `IS NULL` or `IS NOT NULL`

-- Task 2: VIEW for fast_food_consumption and health metrics

DROP VIEW IF EXISTS vw_my_data;
GO

CREATE VIEW vw_my_data AS

SELECT *
FROM (
    VALUES 
    -- Person_id   age     gender   fast_food_per_wk    bmi      phy_activity_per_wk    energy_level
        (1,        56,     'Male',        1,            28.4,           4.5,              9),
        (2,        46,     'Male',        12,           22.8,           9.6,              2),
        (3,        32,     'Female',       8,           21.5,           4.5,              NULL),
        (4,        25,     'Female',        6,          26.8,           8.4,              6),
        (5,        38,     'Female',       14,          18.1,           1.9,              NULL)
) AS d(person_id, age, gender, fast_food_per_wk, bmi, phy_activity_per_wk, energy_level);
GO

SELECT * FROM vw_my_data;

-- Show gender, whose fast food consumption per week exceeds 6 and BMI is greater than 21
SELECT gender, fast_food_per_wk, bmi 
FROM vw_my_data
WHERE fast_food_per_wk > 6 AND bmi > 21;


-- Show age, fast food consumption per week, and physical activity per week 
-- for people whose fast food consumption is between 6 and 12 OR physical activity is less than 6.

SELECT age, fast_food_per_wk, phy_activity_per_wk     
FROM vw_my_data
WHERE fast_food_per_wk BETWEEN  6 AND 12 OR phy_activity_per_wk < 6;


-- Show gender, age and energy level for people whose bmi is 22.8, 26.8, or 28.4 and energy level is not null.
SELECT gender, age, energy_level
FROM vw_my_data
WHERE bmi IN (22.8, 26.8, 28.4) AND energy_level IS NOT NULL
ORDER BY age;

