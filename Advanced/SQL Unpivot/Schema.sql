CREATE TABLE marvel_avengers_pivot
(
    superhero_alias varchar(255),
    platform varchar(100) ,
    twitter_engagement_rate numeric,
    instagram_engagement_rate numeric,
    tiktok_engagement_rate numeric,
    youtube_engagement_rate numeric
)

INSERT INTO marvel_avengers_pivot (
    superhero_alias,
    platform,
    twitter_engagement_rate,
    instagram_engagement_rate,
    tiktok_engagement_rate,
    youtube_engagement_rate
) VALUES
('Black Widow', 'Instagram', NULL, 7.80, NULL, NULL),
('Captain America', 'Twitter', 6.50, NULL, NULL, NULL),
('Iron Man', 'Instagram', NULL, 8.20, NULL, NULL),
('Iron Man', 'TikTok', NULL, NULL, 6.80, NULL),
('Iron Man', 'Twitter', 6.90, NULL, NULL, NULL),
('Thor', 'Instagram', NULL, 9.60, NULL, NULL),
('Thor', 'Twitter', 6.70, NULL, NULL, NULL),
('Thor', 'YouTube', NULL, NULL, NULL, 9.10);