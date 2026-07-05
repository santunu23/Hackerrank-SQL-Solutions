/*
যেহেতু সরাসরি কোনো MEDIAN() ফাংশন নেই, তাই আমরা উইন্ডো ফাংশন (ROW_NUMBER) ব্যবহার করে এই লজিকে সলভ করব:
১. প্রথমে প্রতিটি LAT_N-কে ছোট থেকে বড় ক্রমে সাজিয়ে ১, ২, ৩ এভাবে একটি রো নম্বর দেব।
২. এরপর ঠিক মাঝখানের রো নম্বরটিকে ফিল্টার করে তুলে আনব।
*/ 
WITH RankedStation as(
    SELECT LAT_N,
    ROW_NUMBER() OVER(ORDER BY LAT_N) AS row_num,
    COUNT(*) OVER () AS total_rows 
    FROM STATION
)

SELECT ROUND(AVG(LAT_N),4)
FROM RankedStation
WHERE row_num IN (FLOOR((total_rows + 1) / 2), CEIL((total_rows + 1) / 2));