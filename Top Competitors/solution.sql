SELECT 
A.hacker_id, A.name
FROM hackers A 
JOIN Submissions B  ON A.hacker_id=B.hacker_id
JOIN Challenges C   ON C.challenge_id=B.challenge_id
JOIN Difficulty D   ON D.difficulty_level=C.difficulty_level
WHERE B.score=D.score
GROUP BY A.hacker_id,A.name
HAVING COUNT(B.challenge_id) > 1
ORDER BY COUNT(B.challenge_id) Desc,A.hacker_id ASC;