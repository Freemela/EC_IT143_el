/*****************************************************************************************************************`
    Script Name: EC_IT143_W3.4_EL
    Date: 10/11/2024
    Author: Egbebo Luther
    Purpose: SQL queries to answer questions based on the AdventureWorks database.
  
 
******************************************************************************************************************/

-- -- Q1: What are our top ten most expensive products in terms of list price?
SELECT TOP 10 
    p.Name AS ProductName, 
    p.ListPrice
FROM 
    Production.Product p
ORDER BY 
    p.ListPrice DESC;

-- Q2: How many customers are currently active in the AdventureWorks database?
SELECT 
    COUNT(*) AS ActiveCustomerCount
FROM 
    Sales.Customer c
WHERE 
    c.Demographics IS NOT NULL;  -- Assuming active customers have demographics recorded

-- Q3: Which five customers have made the most purchases in 2023? Break down their total order amounts by product subcategory.
SELECT TOP 5
    c.CustomerID, 
    SUM(so.TotalDue) AS TotalPurchases,
    psc.Name AS ProductSubcategory
FROM 
    Sales.SalesOrderHeader so
JOIN 
    Sales.Customer c ON so.CustomerID = c.CustomerID
JOIN 
    Sales.SalesOrderDetail sd ON so.SalesOrderID = sd.SalesOrderID
JOIN 
    Production.Product p ON sd.ProductID = p.ProductID
JOIN 
    Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
WHERE 
    YEAR(so.OrderDate) = 2023
GROUP BY 
    c.CustomerID, psc.Name
ORDER BY 
    TotalPurchases DESC;

-- Q4: Find the top three vendors that supply the highest number of different products. Also, provide the total count of products supplied by each.
SELECT TOP 3
    v.VendorID, 
    v.Name AS VendorName, 
    COUNT(DISTINCT p.ProductID) AS TotalProductsSupplied
FROM 
    Purchasing.Vendor v
JOIN 
    Purchasing.ProductVendor pv ON v.VendorID = pv.VendorID
JOIN 
    Production.Product p ON pv.ProductID = p.ProductID
GROUP BY 
    v.VendorID, v.Name
ORDER BY 
    TotalProductsSupplied DESC;

-- Q5: I need a detailed report on our best-selling bikes in the last two years. Provide a list that includes the total units sold per bike model, average list price, and revenue per unit. Also, break this information down by region.
SELECT 
    p.Name AS BikeModel,
    SUM(sd.OrderQty) AS TotalUnitsSold,
    AVG(p.ListPrice) AS AverageListPrice,
    SUM(sd.LineTotal) AS RevenuePerUnit,
    a.Name AS Region
FROM 
    Sales.SalesOrderHeader so
JOIN 
    Sales.SalesOrderDetail sd ON so.SalesOrderID = sd.SalesOrderID
JOIN 
    Production.Product p ON sd.ProductID = p.ProductID
JOIN 
    Sales.SalesTerritory st ON so.TerritoryID = st.TerritoryID
JOIN 
    Person.Address a ON so.BillingAddressID = a.AddressID
WHERE 
    p.Name LIKE '%Bike%' 
    AND YEAR(so.OrderDate) >= YEAR(GETDATE()) - 2
GROUP BY 
    p.Name, a.Name
ORDER BY 
    TotalUnitsSold DESC;

-- Q6: Can you generate a report on road bikes sold in the fourth quarter of 2022, grouped by their frame size and color? Include the number of units sold, total sales revenue, and average profit per unit.
SELECT 
    p.FrameSize,
    p.Color,
    SUM(sd.OrderQty) AS UnitsSold,
    SUM(sd.LineTotal) AS TotalSalesRevenue,
    AVG(sd.LineTotal / sd.OrderQty) AS AverageProfitPerUnit
FROM 
    Sales.SalesOrderHeader so
JOIN 
    Sales.SalesOrderDetail sd ON so.SalesOrderID = sd.SalesOrderID
JOIN 
    Production.Product p ON sd.ProductID = p.ProductID
WHERE 
    p.Name LIKE '%Road Bike%' 
    AND so.OrderDate >= '2022-10-01' 
    AND so.OrderDate < '2023-01-01'
GROUP BY 
    p.FrameSize, p.Color;

-- Q7: Can you list all tables in the AdventureWorks database that contain columns with the name "EmployeeID" or "SalesOrderID"?
SELECT 
    TABLE_NAME
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    COLUMN_NAME IN ('EmployeeID', 'SalesOrderID')
GROUP BY 
    TABLE_NAME;

-- Q8: Find all the tables in the AdventureWorks database that include the column "ModifiedDate." Provide the table names and the data types of the "ModifiedDate" column.
SELECT 
    TABLE_NAME, 
    DATA_TYPE
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    COLUMN_NAME = 'ModifiedDate';
