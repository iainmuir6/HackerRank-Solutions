SELECT N,
CASE
    WHEN P IS NULL THEN "Root"
    WHEN N IN (SELECT N 
               FROM BST 
               WHERE N IN (SELECT P 
                           FROM BST) AND P IS NOT NULL) THEN "Inner"
    ELSE "Leaf"
END
FROM BST
ORDER BY N;
