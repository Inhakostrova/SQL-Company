/*Відобразити інформацію про товари (ідентифікатор товару, назву товару, категорію). 
Перелік полів: Ідентифікатор "Product ID" повинен формуватися з ідентифікатора співробітника з додаванням "0" довжиною 4 символи.
Назва товару як "Назва товару" повинна містити назву виробника, не містити номер моделі (без крапки після "/" в полі
product_name), формат: [виробник] :: [назва_продукту]. Категорія в полі "Категорія" повинна мати формат:
[тип_продукту] - [категорія] у верхньому регістрі. Будь ласка, відсортуйте дані за виробником. */

-- Ex_1
Use company_test3;
SELECT
	LPAD(product_id, 4, '0') AS "Product ID",
    CONCAT_WS(" :: ", manufacture, product_name) AS "Product Name",
	UPPER(CONCAT(product_type, " - ", category)) AS "Category"
FROM product
ORDER BY manufacture;


/*Відобразити інформацію про пропродажі по місячно. Місяць "Month" повинен формуватися з місяця в якому
здійснювалися транзакції з додаванням "0" довжиною 2 символи. 
Загальна виручка as 'Total revenue' повинна містити загальну суму продажей за кожен місяць. 
Квартал продажів as 'Sales Period' повинен містити порядковий номер кварталу в році і відповідний рік, формат: 'Quater ' [квартал] - [рік]. Будь ласка, відсортуйте дані за датою
продажу*/

-- Ex_2
SELECT 
    LPAD(MONTH(order_datetime), 2, '0') AS "Month",
    SUM(quantity * price) AS "Total Revenue",
    CONCAT('Quarter ', QUARTER(order_datetime), ' - ', YEAR(order_datetime)) AS "Sales Period"
FROM orders
JOIN product ON orders.product_id = product.product_id
GROUP BY `Sales Period`, `Month`;
 

 /*Відображення аналітичної інформації про продажі.
 1) Відображення списку товарів, які принесли найбільшийlохід (більше 50000)
 2) Відображення ТОП-10 покупців, які принесли найбільший дохід. Будь ласка, відсортуйте ані по спаданні суми. */

-- Ex_3_1

 SELECT  
	p.product_id AS "Product ID",  
	p.product_name AS "Product name",     
    p.price AS "Product price",
    SUM(o.quantity) AS "Product Quantity",
	FORMAT(SUM(p.price * o.quantity),2) AS "Total amount" 
FROM orders AS o
JOIN product AS p ON o.product_id = p.product_id 
GROUP BY `Product ID`
HAVING SUM(o.quantity * p.price) > 50000
ORDER BY `Product ID`;



