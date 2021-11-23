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

-- https://github.com/microsoft/sql-server-samples

-- FEDERAL SHIPPING iLE TAŞINMIŞVE NANCY'NİN ALMIŞ OLDUĞU SİPARİŞLERİ GÖSTERİNİZ.

SELECT o.OrderID
FROM Orders O
JOIN Employees E ON E.EmployeeID = O.EmployeeID
JOIN Shippers S ON S.ShipperID = O.ShipVia
WHERE E.FirstName = 'Nancy' AND S.CompanyName = 'Federal Shipping'


-- MÜŞTERİ ADI,ONAYLAYAN ÇALIŞANIN ADI,ALDIĞI ÜRÜNLERİN ADINI LİSTELEYİN

SELECT C.ContactName,E.FirstName+' '+E.LastName AS EMPLOYEE, P.ProductName
FROM Products P
JOIN [Order Details] OD ON OD.ProductID = P.ProductID
JOIN Orders O ON OD.OrderID = O.OrderID
JOIN Employees E ON E.EmployeeID = O.EmployeeID
JOIN Customers C ON C.CustomerID = O.CustomerID

-- AGGREGATE FUNC GROUP BY

-- 01.01.1998 tarihinden sonra Siparis veren müşterilerin isimlerini ve siparis tarihlerini listeleyiniz.
SELECT C.ContactName,O.OrderDate
FROM Orders O
JOIN Customers C ON C.CustomerID = O.CustomerID
WHERE O.OrderDate>'01.01.1998'

-- 10248 nolu Sipariş hangi kargo sirketi ile gonderilmiştir.
SELECT S.CompanyName
FROM Orders O 
JOIN Shippers S ON S.ShipperID = O.ShipVia
WHERE O.OrderID = 10248


-- TOFU isimli ürün alınan siparişlerin sipariş numaralarını listeleyiniz.

SELECT OD.OrderID
FROM Products P 
JOIN [Order Details] OD ON OD.ProductID = P.ProductID
--JOIN Orders O ON O.OrderID = OD.OrderID
WHERE P.ProductName='Tofu'

-- DUMON VEYA ALFKI MÜŞTERİLERİNİN ALDIĞI 1 ID Lİ ÇALIŞANIMIN ONAYLADIĞI 1 VEYA 3 NOLU KARGO FİRMASIYLA TAŞINMIŞ SİPARİŞLERİ GETİRİN

SELECT *
FROM Orders O 
--WHERE (CustomerID='DUMON' OR CustomerID ='ALFKI') AND EmployeeID =1 AND (ShipVia = 1 OR ShipVia=3)
WHERE CustomerID IN('DUMON','ALFKI') AND EmployeeID = 1 AND ShipVia IN(1,3)

-- SUBQUERY