WITH BIKE AS(
select
START_STATIO_ID as start_station_id,
START_STATION_NAME AS start_station_name,
START_LAT AS start_lat,
START_LNG AS start_lng

from {{ ref('stg_bike') }} 
where RIDE_ID != 'bikeid' 

)

select 
*
from BIKE