--2.2 Cursor (Intermediate): Insert log rows
TRUNCATE TABLE dbo.ReorderLog;
GO

DECLARE @ProductId INT;
DECLARE @ProductName VARCHAR(100);
DECLARE @StockQty INT;

DECLARE curLowStock CURSOR FAST_FORWARD
FOR
    SELECT ProductId, ProductName, StockQty
    FROM dbo.Products
    WHERE StockQty < 30
    ORDER BY StockQty ASC;

OPEN curLowStock;
FETCH NEXT FROM curLowStock INTO @ProductId, @ProductName, @StockQty;

WHILE @@FETCH_STATUS = 0
BEGIN
    INSERT INTO dbo.ReorderLog(ProductId, Message)
    VALUES
    (
        @ProductId,
        'Reorder needed for ' + @ProductName + ' (Stock=' + CAST(@StockQty AS VARCHAR(10)) + ')'
    );

    FETCH NEXT FROM curLowStock INTO @ProductId, @ProductName, @StockQty;
END

CLOSE curLowStock;
DEALLOCATE curLowStock;

SELECT * FROM dbo.ReorderLog ORDER BY LogId;
GO;
