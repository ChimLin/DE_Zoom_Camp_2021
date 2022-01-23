
select CAST(tpep_pickup_datetime as DATE)  ,count(tpep_pickup_datetime) from yellow_taxi_data
GROUP BY CAST(tpep_pickup_datetime as DATE);

select CAST(tpep_pickup_datetime AS DATE) as "day", MAX(tip_amount)  from yellow_taxi_data
GROUP BY CAST(tpep_pickup_datetime as DATE)
ORDER BY "day" ASC; 

SELECT  zones."Zone", count(zpu."Zone") as county FROM yellow_taxi_data
inner join zones zpu
	on yellow_taxi_data."PULocationID" = zpu."LocationID" and zpu."Zone" = 'Central Park'
left join zones
	on yellow_taxi_data."DOLocationID" = zones."LocationID"
group by zones."Zone" 
ORDER BY county;

SELECT pickup."Zone" AS pickup_zone, dropoff."Zone" AS dropoff_zone, AVG(total_amount) as avg_total_amount
FROM yellow_taxi_data ytd
    JOIN taxi_zones pickup on ytd."PULocationID" = pickup."LocationID"
    JOIN taxi_zones dropoff on ytd."DOLocationID" = dropoff."LocationID"
GROUP BY pickup."Zone", dropoff."Zone"
ORDER BY AVG(total_amount) DESC;
