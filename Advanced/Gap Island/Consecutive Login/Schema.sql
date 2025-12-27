DROP TABLE user_logins;
CREATE TABLE user_logins (
    user_id     INT         NOT NULL,
    login_date  DATE        NOT NULL
);

INSERT INTO user_logins (user_id, login_date) VALUES
-- User 1: three streaks
(1, '2025-01-01'),
(1, '2025-01-02'),
(1, '2025-01-03'),
(1, '2025-01-05'),
(1, '2025-01-06'),
(1, '2025-01-10'),

-- User 2: single-day streaks only
(2, '2025-02-01'),
(2, '2025-02-03'),
(2, '2025-02-05'),

-- User 3: long streak + gap + another streak
(3, '2025-03-10'),
(3, '2025-03-11'),
(3, '2025-03-12'),
(3, '2025-03-13'),
(3, '2025-03-20'),
(3, '2025-03-21'),

-- User 4: out-of-order inserts (to test ORDER BY)
(4, '2025-04-05'),
(4, '2025-04-01'),
(4, '2025-04-02'),
(4, '2025-04-04'),
(4, '2025-04-03'),

-- User 5: duplicate login data
(5, '2025-05-01'),
(5, '2025-05-01'),  -- duplicate
(5, '2025-05-02'),
(5, '2025-05-04');