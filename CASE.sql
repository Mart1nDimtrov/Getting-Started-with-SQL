-- make categories for wind speed
SELECT report_code, year, month, day, wind_speed,
CASE
WHEN wind_speed >= 40 THEN 'HIGH'
WHEN wind_speed >= 30 AND wind_speed < 40 THEN 'MODERATE'
ELSE 'LOW'
END as wind_severity
FROM station_data

-- group by wind severity and year
SELECT year,
CASE
    WHEN wind_speed >= 40 THEN 'HIGH'
    WHEN wind_speed >= 30 AND wind_speed < 40 THEN 'MODERATE'
    ELSE 'LOW'
END as wind_severity,
COUNT(*) as record_count
FROM station_data
GROUP BY 1, 2
ORDER BY 1 DESC

-- aggregate precipitation into two sums
SELECT year, month,
SUM(CASE WHEN tornado = 1 THEN precipitation ELSE 0 END) as tornado_precipitation,
SUM(CASE WHEN tornado = 0 THEN precipitation ELSE 0 END) as non_tornado_precipitation
FROM station_data
GROUP BY year, month
ORDER BY year DESC, month DESC

-- find maximum precipitation
SELECT year,
MAX(CASE WHEN tornado = 0 THEN precipitation ELSE NULL END) as
    max_non_tornado_precipitation,
MAX(CASE WHEN tornado = 1 THEN precipitation ELSE NULL END) as 
    max_tornado_precipitation
FROM station_data
GROUP BY year

-- average temperatures by month when rain/hail was present versus not
SELECT month,
ROUND(AVG(CASE WHEN rain OR hail THEN temperature ELSE null END))
AS avg_precipitation_temp,
ROUND(AVG(CASE WHEN NOT (rain OR hail) THEN temperature ELSE null END))
AS avg_precipitation_temp
FROM STATION_DATA
WHERE year > 2000
GROUP BY month
