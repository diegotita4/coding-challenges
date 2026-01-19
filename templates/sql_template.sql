
/*
Title: 
Platform: 
Category: 
Difficulty: 
SQL Dialect: MS SQL Server

Problem Summary:
Brief description of the problem.

Approach:
High-level explanation of the solution logic.
*/

SELECT
    T1.column_name_1 AS "alias_name_1"
    , COUNT(T1.column_name_2) AS "alias_name_2"
FROM table_name_1 AS T1
INNER JOIN table_name_2 AS T2
    ON T1.ID = T2.foreign_ID
WHERE
    T1.column_name_1 = some_condition
GROUP BY
    T1.column_name_1
    , T1.column_name_2
HAVING
    COUNT(T1.column_name_2) = some_value
ORDER BY
    T1.column_name_1 ASC/DESC;
