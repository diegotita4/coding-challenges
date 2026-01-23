
/*
Title: The Report
Platform: HackerRank
Difficulty: Medium
SQL Dialect: MS SQL Server

Problem Summary:
Generate a report showing student name, grade, and marks, hiding names for students with grades below 8 and applying different sorting rules depending on grade level.

Approach:
- Join Students and Grades using mark ranges.
- Use CASE to conditionally display student names.
- Apply conditional ORDER BY logic to satisfy mixed sorting requirements.
*/

SELECT
    CASE
        WHEN G.Grade >= 8 THEN S.Name
        ELSE NULL
    END AS [Student_Name]
    , G.Grade
    , S.Marks
FROM Students AS S
JOIN Grades AS G
    ON S.Marks BETWEEN G.Min_Mark AND G.Max_Mark
ORDER BY
    G.Grade DESC
    , CASE 
        WHEN G.Grade >= 8 THEN S.Name
    END ASC
    , CASE
        WHEN G.Grade < 8 THEN S.Marks
    END ASC;
