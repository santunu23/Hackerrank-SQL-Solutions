SELECT A.hacker_id, A.name, COUNT(B.challenge_id) AS total_challenges
FROM Hackers A
JOIN Challenges B ON A.hacker_id = B.hacker_id
GROUP BY A.hacker_id, A.name

HAVING total_challenges = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM Challenges GROUP BY hacker_id) AS t1)
    OR total_challenges IN (SELECT cnt FROM (SELECT COUNT(*) AS cnt FROM Challenges GROUP BY hacker_id) AS t2 GROUP BY cnt HAVING COUNT(cnt) = 1)
ORDER BY total_challenges DESC, A.hacker_id;