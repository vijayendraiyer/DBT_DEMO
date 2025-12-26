with
    trips as (
        select
            ride_id,
            rideable_type,
            date(to_timestamp(started_at)) as trip_date,
            start_station_id,
            end_station_id,
            member_csual,
            timestampdiff(SECOND,to_timestamp(started_at),to_timestamp(ENDED_at)) AS TRIP_DURATION_SECONDS
        from {{ source("demo", "bike") }}
        where ride_id <> 'ride_id'
        limit 10
    )

select *
from trips
