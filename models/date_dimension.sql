WITH CTE AS (
select
to_timestamp_ltz(started_at) AS STARTED_AT,
DATE(to_timestamp_ltz(started_at)) AS DATE_STARTED_AT,
HOUR(to_timestamp_ltz(started_at)) AS HOUR_STARTED_AT,
CASE 
WHEN dayname(to_timestamp_ltz(started_at)) in ('Sat','Sun')
THEN 'WEEKEND'
ELSE 'BUSINESSDAY'
END AS DAY_TYPE,

CASE WHEN MONTH(to_timestamp_ltz(started_at)) in (12,1,2)
    THEN 'WINTER'
    WHEN MONTH(to_timestamp_ltz(started_at)) in (3,4,5)
    THEN 'SPRING'
    WHEN MONTH(to_timestamp_ltz(started_at)) in (6,7,8)
    THEN 'SUMMER'
    ELSE 'AUTUMN'
    END AS SEASON_OF_YEAR

from 
{{ source('demo', 'bike') }}
where STARTED_AT != 'started_at'
)


SELECT * FROM CTE