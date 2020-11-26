SELECT x, y
FROM Functions f1
WHERE x != y AND 
      EXISTS(
        SELECT * 
        FROM Functions f2
        WHERE f1.x = f2.y AND f1.y = f2.x AND f1.x < f2.x
      )
        
UNION

SELECT x, y
FROM Functions f1
WHERE x = y AND 
      (SELECT COUNT(*) 
       FROM Functions
       WHERE x = f1.x AND y = f1.x) > 1
ORDER BY x;
