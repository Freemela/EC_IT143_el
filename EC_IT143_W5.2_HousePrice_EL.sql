/*****************************************************************************************************************
NAME:    EC_IT143_W5.2_HousePrice_EL
PURPOSE: Answer questions related to HousePrice dataset.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/23/2024   Collins Nana Antwi Kodua       1. Built this script to answer questions for HousePrice dataset.

******************************************************************************************************************/

-- Q1: What is the average house price by neighborhood?
SELECT neighborhood, AVG(price) AS avg_price
FROM dbo.[HousePrices]
GROUP BY neighborhood;

-- Q2: How many houses have more than three bedrooms and more than two bathrooms?
SELECT COUNT(*) AS num_houses
FROM dbo.[HousePrices]
WHERE bedrooms > 3 AND bathrooms > 2;

-- Q3: What is the average square footage of homes built after the year 2000?
SELECT AVG(square_footage) AS avg_square_footage
FROM dbo.[HousePrices]
WHERE year_built > 2000;

-- Q4: Which neighborhoods have houses with an average price above $500,000?
SELECT neighborhood, AVG(price) AS avg_price
FROM dbo.[HousePrices]
GROUP BY neighborhood
HAVING AVG(price) > 500000;

