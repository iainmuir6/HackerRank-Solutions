SELECT t1.contest_id, t1.hacker_id, t1.name, 
       SUM(ts) as ts, SUM(tas) as tas, SUM(tv) as tv, SUM(tuv) as tuv
FROM CONTESTS AS t1
LEFT JOIN COLLEGES AS t2
    ON t1.contest_id = t2.contest_id
LEFT JOIN CHALLENGES AS t3
    ON t2.college_id = t3.college_id
LEFT JOIN (SELECT challenge_id,
           SUM(total_views) AS tv, SUM(total_unique_views) as tuv
           FROM View_Stats
           GROUP BY challenge_id) AS t4
    ON t3.challenge_id = t4.challenge_id
LEFT JOIN (SELECT challenge_id,
           SUM(total_submissions) AS ts, SUM(total_accepted_submissions) as tas
           FROM Submission_Stats
           GROUP BY challenge_id) as t5
    ON t3.challenge_id = t5.challenge_id
GROUP BY t1.contest_id, t1.hacker_id, t1.name
HAVING (ts + tas + tv + tuv > 0)
ORDER BY t1.contest_id;
