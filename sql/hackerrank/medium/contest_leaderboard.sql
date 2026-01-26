
/*
Title: Contest Leaderboard
Platform: HackerRank
Difficulty: Medium
SQL Dialect: MS SQL Server

Problem Summary:
Compute the total score for each hacker by summing their highest score achieved in each challenge and rank them accordingly.

Approach:
- Aggregate submissions to obtain the maximum score per hacker and challenge.
- Join the aggregated results with the hackers table.
- Sum the maximum scores to compute the total score per hacker.
- Exclude hackers with a total score of zero.
- Order results by total score descending and hacker_id ascending.
*/

SELECT
    H.hacker_id
    , H.name
    , SUM(QS.max_score) AS [total_score]
FROM Hackers AS H
JOIN (
    SELECT
        hacker_id
        , challenge_id
        , MAX(score) AS [max_score]
    FROM Submissions
    GROUP BY
        hacker_id
        , challenge_id
) AS QS
    ON H.hacker_id = QS.hacker_id
GROUP BY
    H.hacker_id
    , H.name
HAVING SUM(QS.max_score) > 0
ORDER BY
    total_score DESC
    , H.hacker_id ASC;
