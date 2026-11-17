
USE BikeStores;

-- Soru 1
SELECT
    first_name,
    last_name,
    email
FROM sales.customers
WHERE first_name LIKE 'R____'
AND email LIKE '%@hotmail.com';


-- Soru 2
SELECT
    product_name AS [Urun Adi],
    list_price AS [Liste Fiyati]
FROM production.products
WHERE category_id IN (2, 4, 5)
AND list_price BETWEEN 2000 AND 3000;


-- Soru 3
SELECT
    first_name,
    last_name,
    phone,
    email
FROM sales.customers
WHERE state NOT IN ('NY', 'CA')
AND phone IS NOT NULL
AND email NOT LIKE '%@hotmail.com';


-- Soru 4
SELECT
    first_name,
    last_name,
    city,
    zip_code
FROM sales.customers
WHERE state = 'NY'
AND last_name LIKE '[T-W]%'
AND zip_code LIKE '11[34]%';


-- Soru 5
SELECT TOP 5
    product_name,
    list_price
FROM production.products
WHERE category_id = 6
AND model_year = 2017
ORDER BY list_price DESC;


-- Soru 6
SELECT
    COUNT(*) AS Musteri_Sayisi,
    COUNT(phone) AS Telefonu_Olan,
    COUNT(DISTINCT city) AS Sehir_Sayisi
FROM sales.customers
WHERE state = 'TX';


-- Soru 7
SELECT
    COUNT(*) AS Siparis_Sayisi,
    MIN(order_date) AS Ilk_Siparis,
    MAX(order_date) AS Son_Siparis
FROM sales.orders
WHERE store_id = 3
AND order_date BETWEEN '2017-08-01' AND '2017-10-12';


-- Soru 8
SELECT
    p.product_name,
    c.category_name,
    p.model_year,
    p.list_price
FROM production.products AS p,
     production.categories AS c
WHERE p.category_id = c.category_id
AND c.category_name IN (
    'Cyclocross Bicycles',
    'Electric Bikes'
)
AND p.list_price BETWEEN 1500 AND 3000;


-- Soru 9
SELECT
    COUNT(DISTINCT o.order_id) AS Siparis_Sayisi,
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS Net_Tutar
FROM sales.order_items AS oi,
     sales.orders AS o
WHERE oi.order_id = o.order_id
AND o.store_id = 3
AND o.order_date BETWEEN '2016-10-01' AND '2016-10-31';


-- Soru 10
SELECT
    COUNT(DISTINCT o.customer_id) AS Musteri_Sayisi
FROM sales.orders AS o,
     sales.order_items AS oi,
     production.products AS p
WHERE o.order_id = oi.order_id
AND oi.product_id = p.product_id
AND o.store_id = 1
AND p.product_name LIKE '%Boy%';


-- Soru 11
SELECT TOP 3
    o.order_id,
    c.first_name,
    c.last_name,
    oi.quantity * oi.list_price * (1 - oi.discount) AS Net_Tutar
FROM sales.orders AS o,
     sales.order_items AS oi,
     sales.customers AS c
WHERE o.order_id = oi.order_id
AND o.customer_id = c.customer_id
AND c.state = 'NY'
AND o.order_date BETWEEN '2018-01-01' AND '2018-12-31'
ORDER BY Net_Tutar DESC;


-- Soru 12 - Birinci sorgu
SELECT
    AVG(list_price) AS Ortalama_Fiyat
FROM production.products
WHERE category_id = 5
AND model_year = 2018;

-- Soru 12 - Ikinci sorgu
SELECT
    product_name,
    list_price
FROM production.products
WHERE category_id = 5
AND model_year = 2018
AND list_price > 3295.228095;


-- Soru 13 - Verilen
SELECT
    product_id,
    product_name,
    list_price
FROM production.products
WHERE product_name IN (
    'Haro Shredder Pro 20 - 2017',
    'Surly ECR 27.5 - 2018'
);

-- Soru 13 - Verilen
INSERT INTO sales.orders (
    customer_id,
    order_status,
    order_date,
    required_date,
    shipped_date,
    store_id,
    staff_id
)
VALUES (
    190,
    1,
    '2026-11-11',
    '2026-11-18',
    NULL,
    2,
    6
);

-- Soru 13 - Verilen
SELECT
    MAX(order_id) AS Yeni_Siparis
FROM sales.orders
WHERE customer_id = 190;

-- Soru 13 - Sizin yazacaginiz
INSERT INTO sales.order_items (
    order_id,
    item_id,
    product_id,
    quantity,
    list_price,
    discount
)
VALUES
    (1624, 1, 94, 3, 249.99, 0.05),
    (1624, 2, 128, 1, 1899.00, 0);

-- Soru 13 - Verilen kontrol
SELECT
    COUNT(*) AS Kalem_Sayisi,
    SUM(quantity * list_price * (1 - discount)) AS Net_Tutar
FROM sales.order_items
WHERE order_id = 1624;


-- Soru 14 - Verilen
SELECT
    product_id,
    product_name,
    list_price
FROM production.products
WHERE brand_id IN (7, 8)
AND product_name LIKE '%Frameset%';

-- Soru 14 - Sizin yazacaginiz
UPDATE production.products
SET list_price = list_price * 1.08
WHERE brand_id IN (7, 8)
AND product_name LIKE '%Frameset%'
AND list_price BETWEEN 500 AND 2000;

-- Soru 14 - Verilen kontrol
SELECT
    product_id,
    product_name,
    list_price
FROM production.products
WHERE brand_id IN (7, 8)
AND product_name LIKE '%Frameset%';


-- Soru 15 - Verilen
SELECT
    product_id
FROM production.products
WHERE product_name LIKE '%Townie Go%';

-- Soru 15 - Verilen
SELECT
    COUNT(*) AS Stok_Kaydi
FROM production.stocks
WHERE store_id = 1;

-- Soru 15 - Sizin yazacaginiz
DELETE FROM production.stocks
WHERE store_id = 1
AND quantity BETWEEN 0 AND 10
AND product_id IN (192, 195, 250, 253, 303);

-- Soru 15 - Verilen kontrol
SELECT
    COUNT(*) AS Stok_Kaydi
FROM production.stocks
WHERE store_id = 1;

