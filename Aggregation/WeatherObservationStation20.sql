SET @rowindex := -1;
 
SELECT ROUND(AVG(t1.lat), 4)
FROM
   (SELECT @rowindex:=@rowindex + 1 AS rowindex,
           lat_n AS lat
    FROM Station
    ORDER BY Station.lat_n) AS t1
WHERE
t1.rowindex IN (FLOOR(@rowindex / 2) , CEIL(@rowindex / 2));
