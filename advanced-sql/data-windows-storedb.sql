SELECT prod_id,
       price,
       category,
       first_value(price) OVER (
           PARTITION BY category ORDER BY price) AS "cheapest in category"
FROM products;