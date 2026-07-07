WITH RANKWANDS AS(
    SELECT A.ID,
    B.Age,A.coins_needed,A.power,
    ROW_NUMBER() OVER(Partition by B.age, A.power 
    Order by A.coins_needed) AS ROW_NUM
    FROM Wands A 
    JOIN Wands_Property B 
    ON A.code=B.code
    where B.is_evil=0
)

SELECT ID,AGE,Coins_needed,POWER from Rankwands 
WHERE ROW_NUM=1
ORDER BY POWER DESC,AGE DESC;