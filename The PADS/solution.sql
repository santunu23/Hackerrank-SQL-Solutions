SELECT concat(Name, '(',LEFT(Occupation,1),')') from occupations order by NAME ASC;

SELECT CONCAT('There are a total of ', COUNT(occupation), ' ', LOWER(occupation), 's.')
FROM occupations
GROUP BY occupation
ORDER BY COUNT(occupation) ASC, occupation ASC;