WITH daily_weather AS(
select
date(time) as daily_weather,
weather,
temp,
pressure,
humidity,
clouds
FROM {{ source('demo', 'weather') }}

),

daily_weather_agg as (
select daily_weather,
weather,
round(avg(temp),2),
round(avg(pressure),2),
round(avg(humidity),2),
round(avg(clouds),2)

from daily_weather
group by 1,2
QUALIFY row_number() over( partition by daily_weather Order by count(weather) desc) =1

)

select 
* 
FROM daily_weather_agg