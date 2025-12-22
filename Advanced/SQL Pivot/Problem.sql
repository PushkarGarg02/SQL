--demonstrate a pivot in SQL by showing the average engagement metrics for each superhero alias across various platforms.
--output should have superhero_alias, platform and platform engagement rate
--show it only for any 4 superhero_alias

--Solution
Select 
superhero_alias, platform,
MAX(case when platform = 'Twitter' then engagement_rate end) as twitter_engagement_rate,
MAX(case when platform = 'Instagram' then engagement_rate end) as instagram_engagement_rate,
MAX(case when platform = 'TikTok' then engagement_rate end) as tiktok_engagement_rate,
MAX(case when platform = 'YouTube' then engagement_rate end) as youtube_engagement_rate
FROM marvel_avengers
WHERE superhero_alias IN ('Iron Man', 'Captain America', 'Black Widow', 'Thor')
GROUP BY superhero_alias, platform
ORDER BY superhero_alias, platform;