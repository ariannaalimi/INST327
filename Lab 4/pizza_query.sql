USE pizza_db;
SELECT DISTINCT order_id, pizza_name, quantity, category, price, ingredients
FROM order_details
JOIN pizzas
USING (pizza_id)
JOIN pizza_types
USING (pizza_type_id)
WHERE order_id = 2;


USE pizza_db;
SELECT DISTINCT pizza_id, pizza_name, size, price AS 'price $12 or less', ingredients
FROM order_details
JOIN pizzas
USING (pizza_id)
JOIN pizza_types
USING (pizza_type_id)
WHERE price <= 12;

USE pizza_db;
SELECT DISTINCT pizza_name, ingredients
FROM order_details
JOIN pizzas
USING (pizza_id)
JOIN pizza_types
USING (pizza_type_id)
WHERE ingredients LIKE '%Kalamata Olives%'
ORDER BY pizza_name;

USE pizza_db;
SELECT DISTINCT CONCAT(pizza_name,
CASE
	WHEN ingredients LIKE '%mushrooms%' THEN ' contains mushrooms.'
	ELSE ' does not contain mushrooms.'
END ) 
AS mushrooms_in_pizza
FROM order_details
JOIN pizzas
USING (pizza_id)
JOIN pizza_types
USING (pizza_type_id)
ORDER BY mushrooms_in_pizza;

USE pizza_db;
SELECT DISTINCT CONCAT('Order #', order_id, ' was placed on ', 
	DATE_FORMAT(date, '%W, %M %d, %Y'), ' at ', 
    DATE_FORMAT(time, '%r')) AS orders_on_christmas_eve
FROM order_details
JOIN pizzas
USING (pizza_id)
JOIN pizza_types
USING (pizza_type_id)
JOIN orders
USING (order_id)
WHERE date = '2015-12-24'
ORDER BY orders_on_christmas_eve;