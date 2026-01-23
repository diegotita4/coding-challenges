
/*
Title: Weather Observation Station 20
Platform: HackerRank
Difficulty: Medium
SQL Dialect: MS SQL Server

Problem Summary:
Compute the median of LAT_N and round the result to 4 decimal places.

Approach:
- Use PERCENTILE_CONT(0.5) to compute the median value.
- Apply it as a window function with OVER().
- Round the result to 4 decimal places and cast to DECIMAL.
*/

SELECT DISTINCT
    CAST(
        ROUND(
            PERCENTILE_CONT(0.5)
            WITHIN GROUP (ORDER BY LAT_N)
            OVER()
        , 4) AS DECIMAL(10, 4)
    ) AS [median]
FROM STATION;
