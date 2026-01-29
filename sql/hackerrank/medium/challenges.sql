
/*
Title: Challenges
Platform: HackerRank
Difficulty: Medium
SQL Dialect: MS SQL Server

Problem Summary:
Identify hackers based on the number of challenges they created, keeping only unique counts and the highest total challenge count.

Approach:
- Count total challenges created per hacker using aggregation.
- Use window functions to compute frequency of each challenge count.
- Use a window function to obtain the global maximum challenge count.
- Filter hackers whose challenge count is unique or equals the maximum.
- Order results by total challenges descending and hacker_id ascending.
*/

WITH challenges_per_hacker AS (
    SELECT
        H.hacker_id
        , H.name
        , COUNT(C.challenge_id) AS [total_challenges]
    FROM Hackers AS H
    JOIN Challenges AS C
        ON C.hacker_id = H.hacker_id
    GROUP BY
        H.hacker_id
        , H.name
),
ranked AS (
    SELECT
        hacker_id
        , name
        , total_challenges
        , COUNT(*) OVER (PARTITION BY total_challenges) AS [freq]
        , MAX(total_challenges) OVER () AS [max_challenges]
    FROM challenges_per_hacker
)
SELECT
    hacker_id
    , name
    , total_challenges
FROM ranked
WHERE freq = 1
    OR total_challenges = max_challenges
ORDER BY
    total_challenges DESC
    , hacker_id ASC;
