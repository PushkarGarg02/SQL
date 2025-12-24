-- marvel_avengers_pivot table has superhero_alias data 
-- unpivot this table

--Solution
Select superhero_alias, platform,
case when platform = 'Twitter' then twitter_engagement_rate
	 when platform = 'Instagram' then instagram_engagement_rate
	 when platform = 'TikTok' then tiktok_engagement_rate
	 when platform = 'YouTube' then youtube_engagement_rate
end as engagement_rate
from marvel_avengers_pivot


--Alternative Solution
Select superhero_alias, 'Twitter' as platform, twitter_engagement_rate as engagement_rate
from marvel_avengers_pivot where twitter_engagement_rate is not null
UNION ALL
Select superhero_alias, 'Instagram' as platform, instagram_engagement_rate as engagement_rate
from marvel_avengers_pivot where instagram_engagement_rate is not null
UNION ALL
Select superhero_alias, 'TikTok' as platform, tiktok_engagement_rate as engagement_rate
from marvel_avengers_pivot where tiktok_engagement_rate is not null
UNION ALL
Select superhero_alias, 'YouTube' as platform, youtube_engagement_rate as engagement_rate
from marvel_avengers_pivot where youtube_engagement_rate is not null
