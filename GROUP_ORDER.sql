-- count the number of records in a table
SELECT COUNT(*) AS record_count FROM station_data;

-- count the number of records with a tornado
SELECT COUNT(*) AS record_count FROM station_data
WHERE tornado = 1

-- group the number of records with tornado by year
SELECT year, COUNT(*) AS record_count FROM station_data
WHERE tornado = 1
GROUP BY year
ORDER BY year DESC

-- use ordinal positions
SELECT year, month, COUNT(*) AS record_count FROM station_data
WHERE tornado = 1
GROUP BY 1, 2

-- order by year and month
SELECT year, month, COUNT(*) AS record_count FROM station_data
WHERE tornado = 1
GROUP BY year, month
ORDER BY year DESC, month DESC

-- count of snow_depth recordings
SELECT COUNT(snow_depth) as recorded_snow_depth_count
FROM STATION_DATA

-- temperature after 2000
SELECT month, AVG(temp) as avg_temp
FROM station_data
WHERE year >= 2000
GROUP BY month

-- temperature after 2000
SELECT year, ROUND(SUM(snow_depth)) as total_snow
FROM station_data
WHERE year >= 2000
GROUP BY year

-- total_snow and total_precipitation
SELECT year, ROUND(SUM(snow_depth)) as total_snow,
ROUND(SUM(precipitation)) as total_precipitation,
ROUND(MAX(precipitation)) as max_precipitation
FROM station_data
WHERE year >= 2000
GROUP BY year

-- find tornado precipitation
SELECT year, SUM(precipitation) as tornado_precipitation
FROM station_data
WHERE tornado = 1
GROUP BY year
ORDER BY year DESC

-- find total precipitation greater than 30
SELECT year,
SUM(precipitation) as total_precipitation
FROM station_data
GROUP BY year
HAVING total_precipitation > 30

-- get distinct station_number and years
SELECT DISTINCT station_number, year FROM station_data
