
/*
Title: Placements
Platform: HackerRank
Difficulty: Medium
SQL Dialect: MS SQL Server

Problem Summary:
List the names of students whose friends earn a higher salary than them, ordered by the friend's salary in ascending order.

Approach:
- Join students with their friends.
- Retrieve salary information for both students and their respective friends.
- Filter cases where the friend's salary is greater than the student's salary.
- Order the results by the friend's salary in ascending order.
*/

SELECT
    S.Name
FROM Students AS S
JOIN Friends AS F
    ON S.ID = F.ID
JOIN Packages AS PS
    ON S.ID = PS.ID
JOIN Packages AS PF
    ON F.Friend_ID = PF.ID
WHERE PF.Salary > PS.Salary
ORDER BY PF.Salary ASC;
