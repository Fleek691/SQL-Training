	
-- Recommended alternative (no cursor)
UPDATE dbo.Products
SET Price = ROUND(Price * 1.05, 2)
OUTPUT inserted.ProductId, deleted.Price AS OldPrice, inserted.Price AS NewPrice
INTO dbo.PriceChangeLog(ProductId, OldPrice, NewPrice)
WHERE Category='Fashion';