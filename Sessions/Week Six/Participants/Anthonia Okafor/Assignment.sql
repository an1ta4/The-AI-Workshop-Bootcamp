

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
        (10, 'James',   'Espresso',    '2024-05-14',   3,   2.00,  'SAVE10')
) AS t(order_id, customer, product, order_date, qty, unit_price, promo_code);
GO

-- Quick check
SELECT * FROM vw_orders;

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

--- ### Classwork 1 — Query the Views
/*
Use `vw_orders` or `vw_sales_summary` to answer each question.

**Q1.** Find all orders for `'Latte'` or `'Cappuccino'` where the quantity is greater than 1.  
Return the customer name, product, and quantity.
*/

SELECT *
FROM vw_orders
WHERE (product = 'Latte' OR product = 'Cappuccino') AND qty > 1;

/*
**Q2.** Find all orders placed between `'2024-02-01'` and `'2024-04-30'` where a promo code was used.  
Return the customer, product, order date, and promo code.
*/

SELECT *
FROM vw_orders
WHERE (order_date BETWEEN '2024-02-01' AND '2024-04039') AND promo_code IS NOT NULL;

/*
**Q3.** Find all customers whose name starts with the letters `A`, `E`, or `I`.  
*(Hint: three `LIKE` conditions joined with `OR`)*
*/
SELECT customer
FROM vw_orders
WHERE customer LIKE 'A%' OR customer LIKE 'E%' OR customer LIKE 'I%';

/*
**Q4.** Find all orders where the promo code is `NULL` **or** the quantity is exactly `1`.
*/
SELECT *
FROM vw_orders
WHERE promo_code IS NULL OR qty = 1;


/*
**Q5.** Using `vw_sales_summary`, show only the products whose **total revenue across all months** is greater than `£200`.  
*(Hint: `GROUP BY` + `HAVING`)*
*/

SELECT product
FROM vw_sales_summary
GROUP BY product
HAVING SUM(revenue) > 200;


/*

### Classwork 2 — Build Your Own View

/*Your turn. Create a view from scratch — no tables, just `VALUES`.

**Pick any topic you like:** a playlist, a football table, a menu, a list of films, your favourite snacks — anything simple and easy to work with.
*/

Create a view called `vw_my_data` that meets these requirements:

| Requirement | Detail |
|---|---|
| At least 5 columns | Include at least one number, one text column, and one nullable column |
| At least 8 rows | Mix your values so filters produce interesting results |
| DROP + CREATE | Follow the same structure as the session views above |
*/

DROP VIEW IF EXISTS vw_my_data;
GO

CREATE VIEW vw_my_data AS
SELECT *
FROM (
    VALUES
    -- menu_id, menu, unit_price, available, promo_code
    (1, 'Jollof rice', 5000, 'Yes', 'Promo Jollof'),
    (2, 'Yam porridge', 4500, 'Yes','Promo Yam'),
    (3, 'Rice and beans with stew', 4500, 'No', 'Promo Beans'),
    (4, 'Spaghetti', 3500, 'Yes', 'Promo Spag'),
    (5, 'Boiled yam with egg sauce', 4000, 'No', NULL),
    (6, 'Fried rice', 4000, 'Yes', NULL),
    (7, 'Semovita/Fufu with soup', 4000, 'Yes', 'Promo Swallow'),
    (8, 'Beans and plantain/yam porridge', 4000, 'Yes', 'Promo Beans'),
    (9, 'Rice and vegetable sauce/stew', 4000, 'Yes', NULL),
    (10, 'Noodles', 3000, 'Yes','Promo Noodle')
) AS g(menu_id, menu, unit_price, available, promo_code);
GO

select *
FROM vw_my_data;


/*
Once your view is created, write **three queries** against it that each use at least one of:

- A `WHERE` clause with `AND` / `OR` and parentheses
- `BETWEEN` or `IN`
- `IS NULL` or `IS NOT NULL`
*/

--- Query 1 ( A `WHERE` clause with `AND` / `OR` and parentheses): Menu that has beans in it and is available
SELECT *
FROM vw_my_data
WHERE menu LIKE '%bean%' AND available = 'Yes';


--- Query 2 (`BETWEEN` or `IN`): Menu with price between 3500 and 4000
SELECT *
FROM vw_my_data
WHERE unit_price BETWEEN 3500 AND 4000;

---Query 3 (`IS NULL` or `IS NOT NULL`): Menu that has rice in it with a promo
SELECT *
FROM vw_my_data
WHERE menu LIKE '%rice%' AND promo_code IS NOT NULL;