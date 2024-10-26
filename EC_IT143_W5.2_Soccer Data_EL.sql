/*****************************************************************************************************************
NAME:    EC_IT143_W5.2_MobileDevice_EL
PURPOSE: Answer questions related to MobileDevice dataset.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/26/2024   Egbebo Luther       1. Built this script to answer questions for MobileDevice dataset.

******************************************************************************************************************/

-- Q1: What is the average price of each type of mobile device?
SELECT device_type, AVG(price) AS avg_price
FROM dbo.[MobileDevices]
GROUP BY device_type;

-- Q2: How many devices have storage capacities greater than 128GB?
SELECT COUNT(*) AS num_devices
FROM dbo.[MobileDevices]
WHERE storage > 128;

-- Q3: Which brand has the highest average price across its devices?
SELECT brand, AVG(price) AS avg_price
FROM dbo.[MobileDevices]
GROUP BY brand
ORDER BY avg_price DESC
LIMIT 1;

-- Q4: What is the total number of devices available for each brand?
SELECT brand, COUNT(device_id) AS num_devices
FROM dbo.[MobileDevices]
GROUP BY brand;
