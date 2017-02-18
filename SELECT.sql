-- select all comlumns from the customer table
SELECT * FROM CUSTOMER

-- select just two columns from the customer table
SELECT CUSTOMER_ID, NAME FROM CUSTOMER

-- select all comlumns from the product table
SELECT * FROM PRODUCT

-- calculated tax column
SELECT 
PRODUCT_ID,
DESCRIPTION,
PRICE,
round(PRICE * 1.07, 2) AS TAXED_PRICE
FROM PRODUCT

-- concatenate state and city
SELECT NAME,
CITY || ', ' || STATE AS LOCATION
FROM CUSTOMER;

-- concatenate several fields to create a ship adress
SELECT NAME,
STREET_ADDRESS || ' ' || CITY || ', ' || STATE || ' ' || ZIP AS SHIP_ADDRESS
FROM CUSTOMER;