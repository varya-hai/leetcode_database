-- Active: 1735022465152@@127.0.0.1@3306@leetcode_problems
-- Active: 1735047193341@@127.0.0.1@3306
-- SQL 1
SELECT MAX(salary) AS SecondHighestSalary
FROM employee
WHERE salary < (SELECT MAX(salary) FROM employee);

-- SQL 2
SELECT 
    (SELECT DISTINCT salary
     FROM (
         SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rank
         FROM employee
     )
     WHERE rank = 2
     LIMIT 1) AS SecondHighestSalary;