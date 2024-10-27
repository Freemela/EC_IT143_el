/*****************************************************************************************************************
NAME:    EC_IT143_W5.2_MobileDevice_EL
PURPOSE: Answer questions related to MobileDevice dataset.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/26/2024   Egbebo Luther       1. Built this script to answer questions for MobileDevice dataset.

******************************************************************************************************************/

-- Q1: What is the average screen time for each type of mobile device?
SELECT Screen_On_Time_hours_day, AVG(Screen_On_Time_hours_day) AS avg_Screen_On_Time_hours_day
FROM dbo.[MobileDevice]
GROUP BY Screen_On_Time_hours_day;

-- Q2: How many devices are used predominantly by a specific gender?
SELECT Gender, COUNT(*) AS num_devices
FROM dbo.[MobileDevice]
GROUP BY gender;

-- Q3: Which Device is used the most across all devices?
SELECT Device_Model, COUNT(*) AS usage_count
FROM dbo.[MobileDevice]
GROUP BY Device_Model
ORDER BY usage_count DESC;


-- Q4: What is the total screen time reported for each device type?
SELECT Screen_On_Time_hours_day, SUM(Screen_On_Time_hours_day) AS total_screen_time
FROM dbo.[MobileDevice]
GROUP BY Screen_On_Time_hours_day;

