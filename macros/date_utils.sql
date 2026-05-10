{% macro get_season(x) %}

CASE WHEN MONTH(to_timestamp_ltz({{x}})) in (12,1,2)
    THEN 'WINTER'
    WHEN MONTH(to_timestamp_ltz({{x}})) in (3,4,5)
    THEN 'SPRING'
    WHEN MONTH(to_timestamp_ltz({{x}})) in (6,7,8)
    THEN 'SUMMER'
    ELSE 'AUTUMN'
    END

{% endmacro %}

{% macro day_type(x) %}

CASE 
WHEN dayname(to_timestamp_ltz({{x}})) in ('Sat','Sun')
THEN 'WEEKEND'
ELSE 'BUSINESSDAY'
END

{% endmacro %}