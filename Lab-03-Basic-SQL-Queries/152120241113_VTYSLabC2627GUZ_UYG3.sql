USE BikeStores;
GO

-- Soru 1
SELECT DISTINCT discount
FROM sales.order_items;
-- Soru 2
SELECT product_name, brand_id, model_year, list_price
FROM production.products
WHERE category_id = 3
AND NOT brand_id = 1
AND (model_year = 2016 OR model_year = 2017);
-- Soru 3
SELECT first_name, last_name, email
FROM sales.customers
WHERE phone IS NULL
AND city = 'Ballston Spa';
-- Soru 4
SELECT products.product_name, brands.brand_name, products.list_price
FROM production.products, production.brands
WHERE products.brand_id = brands.brand_id
AND brands.brand_name = 'Haro'
AND products.model_year = 2017;
-- Soru 5
SELECT DISTINCT customers.city
FROM sales.customers, sales.orders, sales.stores
WHERE customers.customer_id = orders.customer_id
AND orders.store_id = stores.store_id
AND stores.store_name = 'Santa Cruz Bikes'
AND orders.order_status = 3;
-- Soru 6

-- Eklemeden önce kontrol
SELECT *
FROM sales.customers
WHERE email = 'mehmet.demir@example.com';
-- Yeni müşteri ekleme
INSERT INTO sales.customers
(first_name, last_name, phone, email, street, city, state, zip_code)
VALUES
('Mehmet', 'Demir', '(222) 239-3700',
'mehmet.demir@example.com', NULL,
'Eskisehir', 'ES', '26480');
-- Eklendikten sonra kontrol
SELECT *
FROM sales.customers
WHERE email = 'mehmet.demir@example.com';
-- Soru 7

-- Musterinin ID numarasini bul
SELECT customer_id
FROM sales.customers
WHERE email = 'mehmet.demir@example.com';

-- Personelin ID ve magaza numarasini bul
SELECT staff_id, store_id
FROM sales.staffs
WHERE first_name = 'Layla'
AND last_name = 'Terrell';
-- Yeni siparis ekleme
INSERT INTO sales.orders
(customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id)
VALUES
(1446, 2, '2026-11-03', '2026-11-10', NULL, 3, 9);
-- Siparis eklendikten sonra kontrol
SELECT orders.order_id, customers.first_name,
       customers.last_name, orders.order_status,
       orders.order_date, orders.required_date,
       orders.shipped_date
FROM sales.orders, sales.customers
WHERE orders.customer_id = customers.customer_id
AND customers.email = 'mehmet.demir@example.com';

-- Soru 8

-- Guncellemeden once fiyatlari kontrol et
SELECT product_id, product_name, list_price
FROM production.products
WHERE brand_id = 8 AND category_id = 4;
-- Fiyatlari %20 indir
UPDATE production.products
SET list_price = list_price * 0.80
WHERE brand_id = 8 AND category_id = 4;
-- Indirimden sonra fiyatlari kontrol et
SELECT product_id, product_name, list_price
FROM production.products
WHERE brand_id = 8 AND category_id = 4;
-- Soru 9

-- Guncellemeden once kontrol
SELECT order_id, order_status, required_date, shipped_date
FROM sales.orders
WHERE order_id = 1601;
-- Siparis durumunu ve teslim tarihini guncelle
UPDATE sales.orders
SET order_status = 2,
    required_date = '2018-05-06'
WHERE order_id = 1601
AND order_status = 1
AND shipped_date IS NULL;
-- Guncellemeden sonra kontrol
SELECT order_id, order_status, required_date, shipped_date
FROM sales.orders
WHERE order_id = 1601;
-- Soru 10

-- Silmeden once kontrol
SELECT *
FROM production.products
WHERE brand_id = 1
AND (model_year = 2016 OR model_year = 2017);
-- Urunleri sil
DELETE FROM production.products
WHERE brand_id = 1
AND (model_year = 2016 OR model_year = 2017);
-- Silme isleminden sonra kontrol
SELECT *
FROM production.products
WHERE brand_id = 1
AND (model_year = 2016 OR model_year = 2017);