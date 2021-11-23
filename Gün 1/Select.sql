-- DDL (Create Alter Drop) DML (insert-update-delete select*)

SELECT 'WISSEN' 
SELECT LOWER('WISSEN')
SELECT UPPER('wissen')
SELECT MONTH(GETDATE())
SELECT GETUTCDATE()
SELECT DATENAME(MM,GETDATE())
SELECT DATENAME(YEAR,GETDATE())

SELECT CustomerID,DATENAME(MM,OrderDate)+' '+DATENAME(YEAR,OrderDate) AS "Siparis Tarihi" 
FROM Orders

SELECT CustomerID,DATEDIFF(YEAR,OrderDate,GETDATE()) AS "Siparis Tarihi" 
FROM Orders

SELECT CustomerID,DATENAME(YEAR,DATEADD(YEAR,10,OrderDate)) AS "Siparis Tarihi" 
FROM Orders


-- SELECT FROM JOINS WHERE ORDER BY GROUP BY HAVING  

SELECT TOP 100 ProductID,ProductName,UnitPrice, QuantityPerUnit,UnitsInStock
FROM Products

select * from Products

SELECT * 
FROM Products
WHERE UnitPrice >=55 AND UnitPrice<=97

SELECT ProductName,UnitPrice
FROM Products
WHERE UnitPrice BETWEEN 55 AND 97
ORDER BY UnitPrice ASC

SELECT ProductName,UnitPrice,UnitPrice*1.18 AS [KDVLI FIYAT]
FROM Products
WHERE UnitPrice BETWEEN 55 AND 97
ORDER BY UnitPrice ASC

SELECT ProductName,UnitPrice
FROM Products
--WHERE UnitPrice BETWEEN 55 AND 97
ORDER BY UnitPrice ASC

SELECT TOP 10 ProductName,UnitPrice,UnitsInStock,UnitPrice*UnitsInStock AS MALIYET
FROM Products
ORDER BY MALIYET DESC

SELECT C.CategoryName,P.ProductName,P.UnitPrice
FROM Products P
INNER JOIN Categories C ON P.CategoryID = C.CategoryID


SELECT C.CategoryName,P.ProductName,P.UnitPrice
FROM Categories C
INNER JOIN Products P ON P.CategoryID = C.CategoryID
ORDER BY UnitPrice DESC

SELECT C.CategoryName,P.ProductName,S.CompanyName
FROM Categories C
INNER JOIN Products P ON P.CategoryID = C.CategoryID
INNER JOIN Suppliers S ON S.SupplierID = P.SupplierID

