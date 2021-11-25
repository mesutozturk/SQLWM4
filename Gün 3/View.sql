SELECT *
FROM [Category Sales for 1997]

-- ÜRÜN BAZLI SÝPARÝÞ RAPORU
ALTER VIEW VW_URUNSIPARIS
AS
SELECT P.ProductName,CAST(ROUND(SUM((1-OD.Discount)*OD.UnitPrice*OD.Quantity),2) AS decimal(15,3)) TOTAL
FROM [Order Details] OD
JOIN Products P ON P.ProductID = OD.ProductID
GROUP BY P.ProductName

SELECT * FROM VW_URUNSIPARIS
ORDER BY TOTAL DESC


