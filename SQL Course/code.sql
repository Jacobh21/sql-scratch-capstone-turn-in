Slide 1.1 Queries
SELECT COUNT(DISTINCT utm_campaign)
FROM page_visits;

SELECT COUNT(DISTINCT utm_source)
FROM page_visits;

SELECT DISTINCT utm_source
	,utm_campaign
FROM page_visits;

Slide 1.2 Query
SELECT DISTINCT page_name
FROM page_visits;

Slide 2.1 Query
WITH first_touch AS (
    SELECT user_id,
        MIN(timestamp) as first_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT ft.user_id,
    ft.first_touch_at,
    pv.utm_source,
    pv.utm_campaign,
    COUNT (pv.utm_campaign)
FROM first_touch ft
JOIN page_visits pv
    ON ft.user_id = pv.user_id
    AND ft.first_touch_at = pv.timestamp
    GROUP BY pv.utm_campaign
    ORDER BY 5 DESC;

Slide 2.2 Query
WITH first_touch AS (
    SELECT user_id,
        MIN(timestamp) as first_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT ft.user_id,
    ft.first_touch_at,
    pv.utm_source,
    pv.utm_campaign,
    COUNT (pv.utm_campaign)
FROM first_touch ft
JOIN page_visits pv
    	ON ft.user_id = pv.user_id
AND ft.first_touch_at = pv.timestamp
GROUP BY pv.utm_campaign
ORDER BY 5 DESC;

Slide 2.3 Query
SELECT COUNT (DISTINCT user_id)
FROM page_visits
WHERE page_name = '4 - purchase';

Slide 2.4 Query
WITH last_touch AS (
    SELECT user_id,
        MAX(timestamp) as last_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT lt.user_id,
    lt.last_touch_at,
    pv.utm_source,
    pv.utm_campaign,
    COUNT (pv.utm_campaign)
FROM last_touch lt
JOIN page_visits pv
    	ON lt.user_id = pv.user_id
AND lt.last_touch_at = pv.timestamp
WHERE page_name = '4 - purchase'
GROUP BY pv.utm_campaign
ORDER BY 5 DESC;

Query for total page visits
SELECT utm_campaign, count(utm_campaign)
   FROM page_visits
   Group by utm_campaign
   Order by 2 desc;
    
