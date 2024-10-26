/*****************************************************************************************************************
NAME:    T-SQL Data Manipulation Scripts
PURPOSE: A script that contains all steps for T-SQL Data Manipulation using the Answer-Focused Approach.

MODIFICATION LOG:
Ver      Date        Author          Description
-----   ----------   -------------   -------------------------------------------------------------------------------
1.0     10/26/2024   Egbebo Luther    1. Consolidated all T-SQL scripts for the assignment.

RUNTIME: 
00h 01m 00s

NOTES: 
This T-SQL script provides a comprehensive toolkit for managing and analyzing data in the "My Communities" datasets. It features a range of commands including queries, views, and stored procedures, all designed to streamline data handling and offer valuable insights.

******************************************************************************************************************/

-- Step 1: Start with a question
-- Q1: How many houses have real bathrooms?
-- A1: This query provides the total number of houses that have real bathrooms.

SELECT 
    COUNT(*) AS total_houses_with_real_bathrooms
FROM 
    dbo.[housePrice]
WHERE 
    real_bathrooms > 0;


-- Step 2: Begin creating an answer
--A1: The following query summarizes the total number of houses that have real bathrooms.

SELECT 
    COUNT(*) AS total_houses_with_real_bathrooms
FROM 
    dbo.[housePrice]
WHERE 
    real_bathrooms > 0;



-- Step 3: Create an ad hoc SQL query
-- This query calculates the total number of houses that have real bathrooms.

SELECT 
    COUNT(*) AS total_houses_with_real_bathrooms
FROM 
    dbo.[HousePrice]
WHERE 
    real_bathrooms > 0; 


-- Step 4: Turn the ad hoc SQL query into a view
-- This view calculates the total number of houses with real bathrooms.

CREATE VIEW vw_total_houses_with_real_bathrooms AS
SELECT 
    COUNT(*) AS total_houses_with_real_bathrooms
FROM 
    dbo.[HousePrice]
WHERE 
    real_bathrooms > 0; 



-- Step 5: Turn the view into a table
-- This table captures the total number of houses with real bathrooms based on the view.

CREATE TABLE tbl_total_houses_with_real_bathrooms (
    id INT IDENTITY(1,1) PRIMARY KEY,
    total_houses_with_real_bathrooms INT
);


-- Step 6: Load the table from the view using an ad hoc SQL script
TRUNCATE TABLE tbl_total_houses_with_real_bathrooms;
INSERT INTO tbl_total_houses_with_real_bathrooms (total_houses_with_real_bathrooms)
SELECT 
    total_houses_with_real_bathrooms
FROM 
    vw_total_houses_with_real_bathrooms;


-- Step 7: Turn the ad hoc SQL script into a stored procedure
CREATE PROCEDURE sp_load_total_houses AS
BEGIN
    -- Clear existing data from the table
    TRUNCATE TABLE tbl_total_houses_with_real_bathrooms;

    -- Insert data from the view into the table
    INSERT INTO tbl_total_houses_with_real_bathrooms (total_houses_with_real_bathrooms)
    SELECT 
        total_houses_with_real_bathrooms
    FROM 
        vw_total_houses_with_real_bathrooms;
END;



-- Step 8: Call the stored procedure
EXEC sp_load_total_houses;

/************************************************************************************************************************/
-- Community 2: MobileDevice
-- Q2: What is the total number of devices running the Android operating system?
-- A2: The total number of devices operating on the Android platform is calculated by filtering the records for Android devices and counting the total entries.

SELECT 
    COUNT(*) AS total_android_devices
FROM 
    dbo.[mobiledevice]
WHERE 
    operating_system = 'Android';





-- Summary of My Community 2: Creating View for Mobile Devices
CREATE VIEW vw_android_device_totals AS
SELECT 
    COUNT(*) AS total_android_devices
FROM 
    dbo.[mobiledevice]
WHERE 
    operating_system = 'Android';


-- Step 1: Creating View for Total Android Devices
CREATE VIEW vw_android_device_totals AS
SELECT 
    COUNT(*) AS total_android_devices
FROM 
    dbo.mobiledevice
WHERE 
    operating_system = 'Android';

-- Step: Turn the view into a table
-- This table captures the total number of Android devices based on the view.

CREATE TABLE tbl_total_android_devices (
    id INT IDENTITY(1,1) PRIMARY KEY,
    total_android_devices INT
);



-- Load the Total Android Devices Table
TRUNCATE TABLE tbl_total_android_devices;

INSERT INTO tbl_total_android_devices (total_android_devices)
SELECT total_android_devices 
FROM vw_android_device_totals;



-- Stored Procedure for Android Device Totals
CREATE PROCEDURE sp_load_android_device_totals AS
BEGIN
    -- Truncate the totals table to remove existing data
    TRUNCATE TABLE tbl_total_android_devices;

    -- Insert new data from the view into the totals table
    INSERT INTO tbl_total_android_devices (total_android_devices)
    SELECT total_android_devices FROM vw_android_device_totals;
END;

/******************************************************************************************************************/

-- Execute the Android Device Totals Stored Procedure
EXEC sp_load_android_device_totals;

