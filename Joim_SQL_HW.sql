/* Відобразити список усіх замовлених найменувань товарів разом з іменами та прізвищами клієнтів і моментом
проведення транзакції по інвойсу. Будь ласка, відсортуйте дані за ідентифікатором замовлення Orders ID.
Застосувати різні методи запитів з кількох таблиць. Перелік полів: (orders.orders_id AS 'Orders ID',
product.product_name AS 'Product name',product.category AS 'Product category',invoice.invoice_id AS 'Invoice
ID',invoice.transaction_moment AS 'Transaction moment',customer.last_name AS 'Customer last
name',customer.first_name AS 'Customer first name’)*/

-- Ex_1 Inner Join
use company_test3;
SELECT 
    orders.orders_id AS 'Orders ID',
    product.product_name AS 'Product name',
    product.category AS 'Product category',
    invoice.invoice_id AS 'Invoice ID',
    invoice.transaction_moment AS 'Transaction moment',
    customer.last_name AS 'Customer last name',
    customer.first_name AS 'Customer first name'
FROM orders
JOIN product ON orders.product_id = product.product_id
JOIN invoice ON orders.invoice_id = invoice.invoice_id
JOIN customer ON invoice.customer_id = customer.customer_id
ORDER BY orders.orders_id;



/*Відобразити імена співробітників, які працюють у відділі "Меркурій", і список всіх товарів, замовлених з '2023-07-
01' по '2023-10-01’. Будь ласка, відсортуйте дані за ідентифікатором замовлення Orders ID. Перелік полів:
(orders.orders_id AS 'Orders ID', product.product_name AS 'Product name',product.category AS 'Product
category',invoice.invoice_id AS 'Invoice ID',invoice.transaction_moment AS 'Transaction moment',customer.last_name
AS 'Customer last name',customer.first_name AS 'Customer first name’)*/

-- Ex_2 INNER JOIN LEFT JOIN
SELECT
    o.orders_id "Orders ID",
    d.department_name "Department name",
    e.user_name "User name",
    p.product_name "Product name",
    p.category "Product category",
    i.invoice_id "Invoice ID",
    i.transaction_moment "Transaction moment",
    c.last_name "Customer last name",
    c.first_name "Customer first name"

FROM orders AS o 
JOIN product AS p ON o.product_id = p.product_id
JOIN invoice AS i ON o.invoice_id = i.invoice_id
LEFT JOIN customer AS c ON i.customer_id = c.customer_id
JOIN employee AS e ON i.employee_id = e.employee_id
JOIN department AS d ON e.department_id = d.department_id
WHERE department_name = "Mercury"
AND transaction_moment BETWEEN "2023-07-01" AND "2023-10-01"
ORDER BY orders_id;


/*Показати імена та прізвища всіх клієнтів з таблиці клієнтів, а також клієнтів без замовлень і замовлень без клієнтів
(якщо такі є). Будь ласка, відсортуйте дані за ID інвойсу.Перелік полів: (c.customer_id AS 'Customer ID',
c.last_name AS 'Last Name', c.first_name AS 'First Name', i.invoice_id AS 'Invoice ID', i.transaction_moment AS
'Transaction Moment')*/

-- Ex_3  LEFT JOIN RIGHT JOIN
SELECT 
    c.customer_id AS 'Customer ID',
    c.last_name AS 'Last Name',
    c.first_name AS 'First Name',
    i.invoice_id AS 'Invoice ID',
    i.transaction_moment AS 'Transaction Moment'
FROM  customer AS c LEFT JOIN invoice AS i ON c.customer_id = i.customer_id
UNION

	
-- Ex_3  RIGHT JOIN	
SELECT 
    c.customer_id AS 'Customer ID',
    c.last_name AS 'Last Name',
    c.first_name AS 'First Name',
    i.invoice_id AS 'Invoice ID',
    i.transaction_moment AS 'Transaction Moment'
FROM customer AS c RIGHT JOIN invoice AS i ON c.customer_id = i.customer_id
ORDER BY `Invoice ID`;
