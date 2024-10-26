/*****************************************************************************************************************
NAME:    My Community Transaction Analysis Script
PURPOSE: This script calculates the total house prices for each category within the HousePrice dataset.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/26/2024  Egbebo Luther  1. created this script for EC IT143 - Final Project: My Communities Analysis
1.1     10/26/2024  Egbebo Luther  2. Revisioned to include additional comments and improve readability.

RUNTIME: 
m 30s

NOTES: 
This script is designed to analyze the total prices of houses across various categories. It aggregates house prices to provide insights into market trends, helping to understand consumer behavior and the performance of different property types.

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
