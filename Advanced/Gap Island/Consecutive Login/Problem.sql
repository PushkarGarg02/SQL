/*
For each user, identify all continuous login streaks, including:
- start_date
- end_date
- streak_length
*/

--Solution 1
--Remove duplicates
WITH distinct_logins AS (
    Select distinct user_id, login_date
	FROM user_logins
),
--assign row_number 
ordered_logins AS (
	Select user_id, login_date, row_number() over(partition by user_id order by login_date) as rn
	FROM distinct_logins
),
--create groups
grouped AS (
	SELECT user_id, login_date, (login_date-rn::integer) as groupKey
	FROM ordered_logins
)
--retrieve final data
SELECT user_id, 
min(login_date) AS streak_start_date, 
max(login_date) AS streak_end_date,
count(1) AS streak_length
FROM grouped
group by user_id, groupkey
order by user_id, streak_start_date

--Solution 2
--Remove duplicates
WITH distinct_logins AS (
    Select distinct user_id, login_date
	FROM user_logins
),
--check each row if it is from current streak or starting a new streak using LAG
flagged AS (
	Select user_id, login_date,
	CASE WHEN LAG(login_date) over(Partition by user_id order by login_date) = login_date - INTERVAL '1 DAY' 
	THEN 0 --same streak
	ELSE 1 --new streak 
	END AS is_newstreak
	FROM distinct_logins
),
--group them by creating streak_id
streak_ids AS (
	SELECT user_id, login_date, 
	sum(is_newstreak) over(Partition by user_id order by login_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS streak_id
	FROM flagged
)
--retrieve final data
SELECT user_id, 
min(login_date) AS streak_start_date,
max(login_date) AS streak_end_date,
count(1) AS streak_length
from streak_ids
group by user_id, streak_id
order by user_id, streak_start_date