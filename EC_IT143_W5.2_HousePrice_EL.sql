/*****************************************************************************************************************
NAME:    EC_IT143_W5.2_HousePrice_EL
PURPOSE: Answer questions related to HousePrice dataset.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/26/2024   Egbebo Luther       1. Built this script to answer questions for HousePrice dataset.

******************************************************************************************************************/

-- Q1: What is the average house price by bedrooms?
SELECT bedrooms, AVG(price) AS avg_price
FROM dbo.[HousePrice]
GROUP BY bedrooms;

-- Q2: How many houses have more than three bedrooms and more than two bathrooms?
SELECT COUNT(*) AS num_houses
FROM dbo.[HousePrice]
WHERE bedrooms > 3 AND real_bathrooms > 2;

-- How many houses are still in perfect condition after the year 2010?
SELECT COUNT(*) AS perfect_condition_count
FROM dbo.[HousePrice]
WHERE perfect_condition = 1 AND YEAR(date) > 2010;


-- How many bedrooms have an average house price above $500,000?
SELECT COUNT(*) AS high_value_bedrooms
FROM (
    SELECT bedrooms, AVG(price) AS avg_price
    FROM dbo.[HousePrice]
    GROUP BY bedrooms
    HAVING AVG(price) > 500000
) AS high_value_areas;


