--Query
/*
Write a query to find PersonId, Name, number of friends, 
sum of marks of the person who have friends with total score greater than 100
*/

-- Solution
WITH friends_stats as (Select f.pid,sum(p.Score) total_score, count(1) no_of_friends
FROM person p, friend f
where p.PersonId = f.fid
group by f.pid
having sum(p.Score) > 100)
SELECT p.PersonId, p.Name, fs.total_score, fs.no_of_friends
FROM friends_stats fs, person p
WHERE fs.pid = p.PersonId