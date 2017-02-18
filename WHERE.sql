-- select records from 2010
SELECT * FROM station_data
WHERE year = 2010;

-- select records between 2005 and 2010
SELECT * FROM station_data
WHERE year BETWEEN 2005 and 2010

-- select records from months 3, 6, 9 or 12
SELECT * FROM station_data
WHERE MONTH % 3 = 0 AND MONTH <= 12

-- provide a valid list of values
SELECT * FROM station_data
WHERE MONTH IN (3,6,9,12)

-- filter for specific report code
SELECT * FROM station_data
WHERE report_code = '513A63'

-- IN with text
SELECT * FROM station_data
WHERE report_code IN ('513A63','1F8A7B','EF616A')

-- quality control with text
SELECT * FROM station_data
WHERE length(report_code) != 6

-- find all report codes starting with A
SELECT * FROM station_data
WHERE report_code LIKE 'A%'

-- find all records where there is tornado and hail
SELECT * FROM station_data
WHERE tornado = 1 and hail = 1;

-- find all records where there is hail but no tornado
SELECT * FROM station_data
WHERE NOT tornado and hail;

-- get all records with no recorded snow_depth
SELECT * FROM station_data
WHERE snow_depth IS NULL;

-- include nulls
SELECT * FROM station_data
WHERE precipitation IS NULL OR precipitation <= 0.5;

-- coalesce
SELECT * FROM station_data
WHERE coalesce(precipitation, 0) <= 0.5;

-- coalesce to pretty up a report
SELECT report_code, coalesce(precipitation, 0) as rainfall
FROM station_data;

-- looking for sleet
SELECT * FROM station_data
WHERE rain = 1 AND temperature <= 32
OR (snow_depth > 0);


