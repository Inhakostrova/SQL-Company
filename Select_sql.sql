USE company_test2;
SELECT
first_name 'First_name',
last_name 'Last name',


 birth_date 
BETWEEN '1990-01-01' 
 AND '2000-12-31'

FROM Customer;


-- EX_4
SELECT  
first_name 'First_name',
last_name 'Last name',
phone_number 'phone_number',
birth_date,
gender 
FROM Customer
WHERE gender = 'F'
AND birth_date > '1990-01-01' 
AND birth_date < '2000-12-31'
ORDER BY last_name ASC;



SELECT  *
FROM Customer
ORDER BY last_name;

SELECT 
last_name 'last_name'
FROM Customer
ORDER BY last_name ASC;




SELECT DISTINCT manufacture
FROM Product
ORDER BY manufacture ASC;





SELECT
category,
 product_type,
 price ,
 manufacture,
 REGEXP_REPLACE( product_name, '^DELL ', '')
 FROM Product

 WHERE 
  manufacture = 'DELL' 
  ORDER BY product_name ASC;
 
 
 
 
 

 SELECT 
 product_description,
 category
 FROM  Product
 WHERE category = 'NOTEBOOK'
 AND 
  product_description LIKE '%512GB%';




/*Отримати інформацію з таблиці товарів про наявні на складі ноутбуки або настільні комп'ютери, які
оснащені дисковими накопичувачами 512 ГБ або 1 ТБ. */

SELECT 
 product_description,
 category
 FROM  Product
 WHERE 
 (category = 'NOTEBOOK'
 OR 
 category = 'Desktops')
 AND 
  product_description 
  LIKE '%512GB%'  OR '%1TB%';
  
  
  
  
  
 /* Отримати інформацію з таблиці рахунків-фактур (invoice ) про всі покупки, зроблені неавторизованими
покупцями (customer_id NULL) */
  
  SELECT 
  customer_id 
  FROM Invoice
  WHERE customer_id IS NULL
  ;
   
  
  
  
  