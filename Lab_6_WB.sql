use company_test3;
-- Завдання 6.1: Вивести інформацію про ідентифікатор співробітника, повне ім’я та email співробітника (MySQL String Functions)
SELECT 
	LPAD(employee_id,5,'0') AS 'Employee ID',
    CONCAT_WS(" ", last_name, first_name) AS 'Full name',
    CONCAT(LOWER(first_name), ".", LOWER(last_name), "@company.com" ) AS 'email' 
    FROM employee;
    
-- Завдання 6.2: Відобразити інформацію про працівника, дату його найму та стаж роботи (MySQL Date Functions)
SELECT
	first_name "First name",
    last_name "Last name",
    DATE_FORMAT(employment_date, "%d %M %Y") AS "Date of hiring",
    FORMAT(DATEDIFF(CURDATE(), employment_date)/365.22,1) "Lenght of service",
    TIMESTAMPDIFF(YEAR, employment_date, CURDATE()) AS "Years of service"
FROM
	employee;


-- Завдання 6.3: Відобразити інформацію про зарплати та премії співробітників(два окремих звіти) і (MySQL Aggregate (Numeric) Functions)

SELECT
	"Count of All employees" AS "Bonus eligible",
    COUNT(*) "Count of employees"
FROM
	employee
UNION
SELECT
	"Count of employees who received bonus" AS "Bonus eligible",
    COUNT(bonus) "Count of employees"
FROM 
	employee;
    
    SELECT
	MIN(rate) "Lowest salary",
    MAX(rate) "Highest salary",
    FORMAT(AVG(bonus),2) AS "Average Bonus by Employee",
    FORMAT(SUM(bonus)/COUNT(*),2) AS "Average Bonus by Company"
FROM
	employee;
    
    
    -- Завдання 6.4: Відобразити інформацію про список посад співробітників за відділами та представництвами (MySQL GROUP BY Statement)
    
    SELECT
	COUNT(*) AS "Count of Offices",
    COUNT(DISTINCT city) AS "Count of representative offices of cities"
FROM department;
    
SELECT
	position AS "Position",
    COUNT(*) AS "Count Employee by Position"
FROM employee
GROUP BY position;

SELECT
	department_id AS "Department id",
    COUNT(*) AS "Count of employees by Department"
FROM employee
GROUP BY department_id;

SELECT
	department_id AS "Department id",
    position AS "Positon",
    COUNT(*) AS "Count of employees by Position for each Department"
FROM employee
GROUP BY department_id, position
ORDER BY COUNT(*) DESC;
    
-- Завдання 6.5_1: Відобразити інформацію про список посад співробітників за відділами та представництвами (MySQL HAVING Clause)
    
SELECT
	department_id,
    position,
    COUNT(*) AS "Count employee"
FROM employee
GROUP BY department_id, position
HAVING COUNT(*) > 1;

SELECT
	d.department_name,
    e.position,
    COUNT(*) "Count Employee by Position"
FROM employee AS e
JOIN
	department AS d ON e.department_id = d.department_id
WHERE 
	city = "Lviv"
GROUP BY position, d.department_id
HAVING
	COUNT(*) = 1
ORDER BY d.department_name;

SELECT
	d.department_name,
    e.last_name,
    e.first_name,
    e.position,
    COUNT(invoice_id) "Employee by Sales"
FROM department AS d
JOIN
	employee AS e ON d.department_id = e.department_id
JOIN
	invoice AS i ON e.employee_id = i.employee_id
GROUP BY i.employee_id
HAVING COUNT(invoice_id) > 10
ORDER BY COUNT(invoice_id) DESC;








    