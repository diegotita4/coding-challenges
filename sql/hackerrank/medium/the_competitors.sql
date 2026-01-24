
/*
Title: The Competitors
Platform: HackerRank
Difficulty: Medium
SQL Dialect: MS SQL Server

Problem Summary:
Retrieve hackers who achieved full scores in more than one challenge and rank them by the number of full-score challenges completed.

Approach:
- Join hackers, submissions, challenges, and difficulty tables.
- Filter submissions where the score matches the challenge's full score.
- Group by hacker to count distinct fully solved challenges.
- Use HAVING to keep only hackers with more than one full score.
- Order results by challenge count descending and hacker_id ascending.
*/

SELECT
    H.hacker_id
    , H.name
FROM Hackers AS H
JOIN Submissions AS S
    ON S.hacker_id = H.hacker_id
JOIN Challenges AS C
    ON C.challenge_id = S.challenge_id
JOIN Difficulty AS D
    ON D.difficulty_level = C.difficulty_level
WHERE S.score = D.score
GROUP BY
    H.hacker_id
    , H.name
HAVING COUNT(DISTINCT C.challenge_id) > 1
ORDER BY
    COUNT(DISTINCT C.challenge_id) DESC
    , H.hacker_id ASC;
