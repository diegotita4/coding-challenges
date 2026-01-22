
/*
Title: Weather Observation Station 3
Platform: HackerRank
Category: Filtering & Modulo
Difficulty: Easy
SQL Dialect: MS SQL Server

Problem Summary:
Retrieve distinct city names where the station ID is an even number.

Approach:
- Use modulo operator to identify even IDs
- Select distinct city names
*/

SELECT DISTINCT
    CITY
FROM STATION
WHERE ID % 2 = 0;
