-- Завдання до лабораторної №5

-- EX_1 Показати список всіх керівників MySQL Aliases.
USE company_test3;
SELECT
employee_id "Manager ID",
last_name "Manager Last Name",
first_name 'Manager First Name',
position 'Manager Title',
employment_date AS 'Manager Hire Date'
FROM
employee AS Managers
WHERE 
position IN ('CEO', 'Manager');

-- Ex_2 Показати список всіх працівників та їх керівників MySQL Self Join 
SELECT
    e.employee_id "Employee ID",
    e.last_name "Employee Last Name",
    e.first_name "Employee First Name",
    e.position "Employee Title",
    e.employment_date "Employee Hire Date",
    e.manager_id "Employee Manager ID",
    m.employee_id "Manager ID",
    m.last_name "Manager Last Name",
    m.first_name "Manager First Name",
    m.position "Manager Title",
    m.employment_date "Manager Hire Date"
FROM
	employee AS e,
    employee AS m
WHERE
	e.manager_id = m.employee_id;


-- Ex_3 Показати список всіх працівників та назви департаментів MySQL Equijoin
SELECT
    e.employee_id "Employee ID",
    e.last_name "Employee Last Name",
    e.first_name "Employee First Name",
    e.position "Employee Title",
    e.department_id "Employee Department ID",
    d.department_id "Department ID",
    d.department_name "Department name"
FROM 
    employee AS e, department AS d
WHERE
	e.department_id = d.department_id;


-- Ex_4 Показати список працівників які здійснювали продажі MySQL INNER JOIN
SELECT
    e.employee_id "Employee ID",
    e.last_name "Employee Last Name",
    e.first_name "Employee First Name",
    e.position "Employee Title",
    i.employee_id "Invoice Employee ID",
    i.invoice_id "Invoice",
    i.transaction_moment "Transaction moment"
FROM
	employee AS e
JOIN
	invoice AS i
ON 
	e.employee_id = i.employee_id
ORDER BY
	i.transaction_moment;


-- Ex_5 Показати список працівників які здійснювали продажі MySQL NATURAL JOIN
SELECT
    e.employee_id "Employee ID",
    e.last_name "Employee Last Name",
    e.first_name "Employee First Name",
    e.position "Employee Title",
    i.employee_id "Invoice Employee ID",
    i.invoice_id "Invoice",
    i.transaction_moment "Transaction moment"
FROM 
	employee AS e
NATURAL JOIN 
	invoice AS i
ORDER BY 
	i.transaction_moment;


-- Ex_6 Показати список працівників які здійснювали продажі та клієнтів MySQL JOIN many Tables
SELECT
    e.employee_id "Employee ID",
    e.last_name "Employee Last Name",
    e.first_name "Employee First Name",
    e.position "Employee Title",
    i.employee_id "Invoice Employee ID",
    i.invoice_id "Invoice",
    i.customer_id "Invoice Customer ID",
    i.transaction_moment "Transaction moment",
    c.customer_id "Customer ID",
    c.last_name "Customer Last Name",
    c.first_name "Customer First Name"
FROM 
	employee AS e
NATURAL JOIN
	invoice AS i
JOIN 
	customer AS c
USING (customer_id)
ORDER BY 
	transaction_moment;

-- Ex_7 Показати список працівників які здійснювали продажі для неавторизованих клієнтів MySQL LEFT/RIGHT JOIN
SELECT
    e.employee_id "Employee ID",
    e.last_name "Employee Last Name",
    e.first_name "Employee First Name",
    e.position "Employee Title",
    i.employee_id "Invoice Employee ID",
    i.invoice_id "Invoice",
    i.customer_id "Invoice Customer ID",
    i.transaction_moment "Transaction moment",
    c.customer_id "Customer ID",
    c.last_name "Customer Last Name",
    c.first_name "Customer First Name"
FROM 
	employee AS e
NATURAL JOIN
	invoice AS i
LEFT JOIN 
	customer AS c
USING (customer_id)
WHERE customer_id IS NULL
ORDER BY i.transaction_moment;

-- Ex_8 Показати організаційну структуру компані MySQL LEFT/RIGHT JOIN
SELECT
    e.employee_id "Employee ID",
    e.last_name "Employee Last Name",
    e.first_name "Employee First Name",
    e.position "Employee Title",
    i.employee_id "Invoice Employee ID",
    i.invoice_id "Invoice",
    i.customer_id "Invoice Customer ID",
    i.transaction_moment "Transaction moment",
    c.customer_id "Customer ID",
    c.last_name "Customer Last Name",
    c.first_name "Customer First Name"
FROM 
	employee AS e
NATURAL JOIN
	invoice AS i
LEFT JOIN 
	customer AS c
USING (customer_id)
WHERE customer_id IS NULL
ORDER BY i.transaction_moment;

-- Ex_9 Показати список працівників консультантів MySQL UNION Operator
SELECT
    employee_id,
    first_name,
    last_name,
    position,
    'Consulting' AS Responsibility
FROM 
	employee
WHERE
	position LIKE '%Consultant%'
UNION
SELECT
    employee_id,
    first_name,
    last_name,
    position,
    'Not Consulting' AS Responsibility
FROM
	employee
WHERE
	position NOT LIKE '%Consultant%'
ORDER BY last_name;