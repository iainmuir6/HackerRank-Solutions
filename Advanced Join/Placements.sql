SELECT t2.Name 
FROM Packages 
JOIN (SELECT t1.ID, t1.Name, t1.Friend_ID, Salary AS salary_a
      FROM 
        (SELECT Students.ID, Students.Name, Friends.Friend_ID
         FROM STUDENTS 
         JOIN FRIENDS 
         ON STUDENTS.ID = FRIENDS.ID) AS t1
      JOIN Packages
      ON t1.ID = Packages.ID) AS t2 
ON t2.Friend_ID = Packages.ID 
WHERE t2.salary_a < Salary 
ORDER BY Salary;
