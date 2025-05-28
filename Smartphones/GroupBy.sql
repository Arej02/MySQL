SHOW DATABASES;
USE practise;
SHOW TABLES;

SELECT * FROM smartphones;

-- 1) Group smartphones by brand and get the count,average price
SELECT brand_name, COUNT(*), AVG(price) as 'avg_price',
MAX(rating) as 'max_rating' FROM smartphones
GROUP BY brand_name;

-- 2) Find the top 5 costly phone brands:
SELECT brand_name, AVG(price) as 'avg_price' FROM smartphones
GROUP BY brand_name ORDER BY avg_price DESC LIMIT 5;

-- 3) Which brand makes the smallest screen samrtphones:
SELECT brand_name, MIN(screen_size) as 'min_screen_size' 
FROM smartphones
GROUP BY brand_name ORDER BY min_screen_size LIMIT 1;

-- 4) Group smartphones by the brand and find the brand with 
-- the highest number of models that have both NFC and an IR blaster
SELECT brand_name,COUNT(*) as 'count' FROM smartphones
WHERE has_nfc='True' AND has_ir_blaster='True'
GROUP BY brand_name ORDER BY count DESC LIMIT 1;

-- 5) Find the avg rating of smartphones brands which have more than 20 phones
SELECT brand_name,AVG(rating) as 'avg_rating',COUNT(*) as 'count'
FROM smartphones
GROUP BY brand_name HAVING count>20
ORDER BY avg_rating DESC;

-- 6) Find the top 3 brands with the highest RAM that have a 
-- refresh rate of at least 90 Hz and fast chraging available
-- and donot consider brand less than 10 phones:
SELECT brand_name,AVG(ram_capacity) as 'highest_ram',COUNT(*) as 'count' FROM smartphones
WHERE refresh_rate>90 AND fast_charging_available='1'
GROUP BY brand_name HAVING count>10
ORDER BY highest_ram DESC LIMIT 3;

-- 7) Find the average price of all the phone brands with 
-- avg rating>70 and num_phones more than 10 among all 5g enabled phones
SELECT brand_name,AVG(price) as 'avg_price' FROM smartphones
WHERE has_5g='True'
GROUP BY brand_name HAVING COUNT(*)>10 AND AVG(rating)>70
ORDER BY avg_price DESC;
