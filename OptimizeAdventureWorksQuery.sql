---Step 1. Query a table in your AdventureWorks2019 SQL Server Database.

SELECT soh.*FROM Sales.SalesOrderHeader AS soh

---Step 2. Add a WHERE clause that limits to a specific value for a character field (one that is not indexed).

SELECT soh.*FROM Sales.SalesOrderHeader AS soh
WHERE soh.TerritoryID = 5;

--- Step 3. Include the Actual Execution Plan.

--Step 4. Review the execution plan.

---Step 5. Take note of the estimated subtree cost and any missing index recommendations.

---Step 6. Opposite click on the missing index recommendation and select missing index details.

----Step 7. To use the recommended index, name the index and execute the script.

---Step 8. Re-run the query to see if performance improves in terms of runtime and estimated subtree cost.

USE [AdventureWorks2019]
GO
CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
ON [Sales].[SalesOrderHeader] ([TerritoryID])
INCLUDE ([RevisionNumber],[OrderDate],[DueDate],[ShipDate],[Status],[OnlineOrderFlag],[SalesOrderNumber],[PurchaseOrderNumber],[AccountNumber],[CustomerID],[SalesPersonID],[BillToAddressID],[ShipToAddressID],[ShipMethodID],[CreditCardID],[CreditCardApprovalCode],[CurrencyRateID],[SubTotal],[TaxAmt],[Freight],[TotalDue],[Comment],[rowguid],[ModifiedDate])
GO

---- Execution plans and missing index recommendations practical advice


---When it comes to working with execution plans and missing index recommendations, think of it like getting your car inspected and serviced. 
---SQL Server is like a mechanic, giving you clues about where performance could improve.

--Understand the Purpose of Execution Plans
--When You See a Missing Index Recommendation
--Reading the Execution Plan – Look for the Costly Steps