WITH CTE AS (
select
to_timestamp_ltz(started_at) AS STARTED_AT,
DATE(to_timestamp_ltz(started_at)) AS DATE_STARTED_AT,
HOUR(to_timestamp_ltz(started_at)) AS HOUR_STARTED_AT,

{{day_type('STARTED_AT')}} AS DAY_TYPE,
{{get_season('STARTED_AT')}} AS SEASON_OF_YEAR

from 
{{ ref('stg_bike') }}
where STARTED_AT != 'started_at'
)


SELECT * FROM CTE