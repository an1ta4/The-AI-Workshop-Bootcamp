-- ============================================================
-- DROP then CREATE — run both together each time you update
-- ============================================================
DROP VIEW IF EXISTS vw_orders;
GO

CREATE VIEW vw_orders AS
SELECT *
FROM (
    VALUES
    --  order_id  customer   product        order_date     qty  unit_price  promo_code
        (1,  'Alice',   'Latte',       '2024-01-05',   2,   3.50,  'SAVE10'),
        (2,  'Bob',     'Espresso',    '2024-01-12',   1,   2.00,   NULL   ),
        (3,  'Clara',   'Cappuccino',  '2024-02-03',   3,   3.20,  'SAVE10'),
        (4,  'David',   'Latte',       '2024-02-18',   1,   3.50,   NULL   ),
        (5,  'Eve',     'Tea',         '2024-03-07',   4,   1.80,   NULL   ),
        (6,  'Frank',   'Espresso',    '2024-03-22',   2,   2.00,  'VIP20' ),
        (7,  'Grace',   'Cappuccino',  '2024-04-10',   1,   3.20,   NULL   ),
        (8,  'Henry',   'Latte',       '2024-04-25',   5,   3.50,  'VIP20' ),
        (9,  'Isla',    'Tea',         '2024-05-01',   2,   1.80,   NULL   ),
        (10, 'James',   'Espresso',    '2024-05-14',   3,   2.00,  'SAVE10'),
        (11, 'Karen',   'Cappuccino',  '2024-06-05',   2,   3.20,   NULL   ),
        (12, 'Leo',     'Latte',       '2024-06-20',   1,   3.50,  'VIP20' )
) AS t(order_id, customer, product, order_date, qty, unit_price, promo_code);
GO

-- Quick check
SELECT *
FROM vw_orders;

-- Q1
SELECT customer, product, qty
FROM vw_orders
WHERE (product = 'Latte' OR product = 'Cappuccino') AND qty > 1;

-- Q2
SELECT customer, product, order_date, promo_code
FROM vw_orders
WHERE (order_date BETWEEN '2024-02-01' AND '2024-04-30') AND promo_code IS NOT NULL;

-- Q3
SELECT *
FROM vw_orders
WHERE customer LIKE 'A%' OR customer LIKE 'E%' OR customer LIKE 'I%';

-- Q4
SELECT *
FROM vw_orders
WHERE promo_code IS NULL OR qty = 1;

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

-- Q5
SELECT product, SUM(revenue) AS total_revenue
FROM vw_sales_summary
GROUP BY product
HAVING SUM(revenue) > 200;

-- Classwork 2

DROP VIEW IF EXISTS vw_my_data;
GO

CREATE VIEW vw_my_data AS
SELECT *
FROM (
    VALUES
    --  id  name    category    price   in_stock    discount_code
        (1, 'Widget A', 'Gadget', 19.99, 100, 'SAVE10'),
        (2, 'Widget B', 'Gadget', 29.99, 50,  'VIP20' ),
        (3, 'Widget C', 'Tool',   9.99, 200, NULL   ),
        (4, 'Widget D', 'Tool',   14.99, 150, 'SAVE10'),
        (5, 'Widget E', 'Gadget', 24.99, 75,  'VIP20' ),
        (6, 'Widget F', 'Tool',   12.99, 120, NULL   ),
        (7, 'Widget G', 'Gadget', 34.99, 30,  'SAVE10'),
        (8, 'Widget H', 'Tool',   7.99, 250, NULL   ),
        (9, 'Widget I', 'Gadget', 27.99, 60,  'VIP20' ),
        (10,'Widget J', 'Tool',   19.99, 80,  'SAVE10')
) AS t(id, name, category, price, in_stock, discount_code);
GO

-- Quick check
SELECT * FROM vw_my_data;

-- Query 1
SELECT * FROM vw_my_data
WHERE category = 'Gadget' AND price > 25;

-- Query 2
SELECT name, price, discount_code
FROM vw_my_data
WHERE price BETWEEN 10 AND 20;

-- Query 3
SELECT category, COUNT(*) AS product_count
FROM vw_my_data
WHERE discount_code IS NOT NULL
GROUP BY category;