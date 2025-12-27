/*
For each user, identify all continuous login streaks, including:
- start_date
- end_date
- streak_length
*/

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