-- Create a new table 'perf_issue' by copying all data from Person.Person
-- This table will NOT copy constraints, indexes, or keys
SELECT *
INTO perf_issue
FROM Person.Person;

-- Insert all rows from Person.Person into perf_issue again
-- This duplicates the data and increases table size
INSERT INTO perf_issue
SELECT *
FROM Person.Person;

-- View all data from the perf_issue table
SELECT *
FROM perf_issue;

-- Enable IO statistics to see logical reads (how many pages SQL Server reads)
SET STATISTICS IO ON;

-- Enable time statistics to see CPU time and elapsed execution time
SET STATISTICS TIME ON;

-- Create a view on top of perf_issue table
-- The view does NOT store data, it just stores the query definition
CREATE VIEW perf_issue_vw
AS
SELECT *
FROM perf_issue;

-- Query the view (this actually reads data from perf_issue table)
SELECT *
FROM perf_issue_vw;

-- Generate a row number for each row based on BusinessEntityID order
-- ROW_NUMBER is a window function, not stored permanently
SELECT
    ROW_NUMBER() OVER (ORDER BY BusinessEntityID) AS rowNum,
    *
FROM perf_issue;

SELECT 
    so.name,
    ps.*
FROM sys.dm_db_partition_stats ps
INNER JOIN sysobjects so
    ON ps.object_id = so.id
    where so.xtype='U'     

    order by ps.used_page_count desc


USE AdventureWorks2025;
GO

DROP TABLE IF EXISTS dbo.SOH_Practice;
SELECT TOP (300000)
  SalesOrderID, CustomerID, OrderDate, SubTotal, TaxAmt, Freight, TotalDue
INTO dbo.SOH_Practice
FROM Sales.SalesOrderHeader
ORDER BY SalesOrderID;

-- Create a clustered index on SalesOrderID (common pattern)
-- This leaves our search columns (CustomerID, OrderDate) without a supporting index.
CREATE CLUSTERED INDEX CX_SOH_Practice_SalesOrderID
ON dbo.SOH_Practice(SalesOrderID);

DROP INDEX IF EXISTS CX_SOH_Practice_SalesOrderID ON dbo.SOH_Practice;

select SalesOrderId from SOH_Practice where SalesOrderID=43672;

---------------------------------------

