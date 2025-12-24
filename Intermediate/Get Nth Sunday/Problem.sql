-- Get me nth Sunday from current date

--Solution
SELECT ((current_date + (7-EXTRACT(ISODOW FROM current_timestamp)::int)) + (2 * INTERVAL '1 week'));

--Explanation
/*
1. If we need to find out Sunday then we need to subtract it from 7 and if we need to find out Saturday then 6
because PostgreSQL has 1-7 from Monday to Sunday
2. If we need to get 3rd Sunday then pass (n-1) when adding weeks as we have already calculated 1st week and remaining weeks will be added later

