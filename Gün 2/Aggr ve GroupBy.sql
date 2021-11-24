SELECT C.CategoryName, COUNT(0) ADET
FROM Products P 
JOIN Categories C ON P.CategoryID = C.CategoryID
GROUP BY C.CategoryName
ORDER BY ADET DESC

SELECT C.CategoryName, SUM(P.UnitPrice*P.UnitsInStock) MALIYET
FROM Products P 
JOIN Categories C ON P.CategoryID = C.CategoryID
WHERE P.UnitsInStock>0
GROUP BY C.CategoryName
HAVING SUM(P.UnitPrice*P.UnitsInStock)>10000
ORDER BY MALIYET DESC

SELECT COUNT(0)
FROM [Order Details] OD
HAVING COUNT(0)>100

SELECT C.CategoryName,S.CompanyName, SUM(P.UnitPrice*P.UnitsInStock) MALIYET
FROM Products P 
JOIN Categories C ON P.CategoryID = C.CategoryID
JOIN Suppliers S ON S.SupplierID = P.SupplierID
--WHERE P.UnitsInStock>0
GROUP BY C.CategoryName,S.CompanyName
HAVING SUM(P.UnitPrice*P.UnitsInStock)>3000
ORDER BY C.CategoryName 

-- Sipariþleri sipariþ numarasý ve sipariþ toplam tutarý olarak listeleyiniz

SELECT OrderID,ROUND(SUM((1-Discount)*UnitPrice*Quantity),2) Tutar
FROM [Order Details]
GROUP BY OrderID

-- Hangi üründen ne kadarlýk sipariþ edilmiþ
SELECT P.ProductName,ROUND(SUM((1-OD.Discount)*OD.UnitPrice*OD.Quantity),2) Tutar
FROM [Order Details] OD
JOIN Products P ON P.ProductID = OD.ProductID
GROUP BY P.ProductName
ORDER BY Tutar DESC

-- Hangi tedarikçiden ne kadarlýk tedarik edilmiþ
SELECT S.CompanyName,P.ProductName,ROUND(SUM((1-OD.Discount)*OD.UnitPrice*OD.Quantity),2) Tutar
FROM [Order Details] OD
JOIN Products P ON P.ProductID = OD.ProductID
JOIN Suppliers S ON S.SupplierID = P.SupplierID
GROUP BY S.CompanyName,P.ProductName
ORDER BY S.CompanyName


-- Hangi müþteriden ne kadarlýk sipariþ alýnmýþ
SELECT C.CompanyName,ROUND(SUM((1-OD.Discount)*OD.UnitPrice*OD.Quantity),2) Tutar
FROM [Order Details] OD
JOIN Orders O ON O.OrderID = OD.OrderID
JOIN Customers C ON C.CustomerID = O.CustomerID
GROUP BY C.CompanyName
ORDER BY Tutar DESC

-- Hangi çalýþaným ne kadarlýk ürün sipariþ etmiþ

SELECT E.FirstName+' '+E.LastName AS CALISAN,ROUND(SUM((1-OD.Discount)*OD.UnitPrice*OD.Quantity),2) Tutar
FROM [Order Details] OD
JOIN Orders O ON O.OrderID = OD.OrderID
JOIN Employees E ON E.EmployeeID= O.EmployeeID
GROUP BY E.FirstName,E.LastName
ORDER BY Tutar DESC

-- Hangi üründen ne kadarlýk sipariþ edilmiþ(YILLARA GÖRE GRUPLAYINIZ)

SELECT P.ProductName,YEAR(O.OrderDate) YIL,ROUND(SUM((1-OD.Discount)*OD.UnitPrice*OD.Quantity),2) Tutar
FROM [Order Details] OD
JOIN Products P ON P.ProductID = OD.ProductID
JOIN Orders O ON O.OrderID = OD.OrderID
GROUP BY P.ProductName, YEAR(O.OrderDate)
ORDER BY P.ProductName ASC, YEAR(O.OrderDate) DESC

-- Hangi üründen ne kadarlýk sipariþ edilmiþ(AYA GÖRE GRUPLAYINIZ)

-- ORTALAMA FÝYATIN ÜSTÜNDE SATTIÐIM ÜRÜNLERÝN LÝSTESÝNÝ GETÝRÝN

-- HANGÝ MÜÞTERÝLERÝM ORTALAMA SÝPARÝÞÝN ÜSTÜNDE SÝPARÝÞ VERMÝÞ VE NE KADARLIK SÝPARÝÞ VERMÝÞLER

-- HENÜZ ULAÞMAMIÞ SÝPARÝÞLERÝN TOPLAM MALÝYETÝ NEDÝR

-- HENÜZ ULAÞMAMIÞ ÜRÜNLER ORTALAMA KAÇ GÜNDÜR BEKLEMEKTE

-- ORTALAMA TESLÝM TARÝHÝMÝZ

-- SÝPARÝÞ VERÝLEN ÜLKELERÝN LÝSTESÝ (AYNI ÜLKE 2 KERE GÖSTERÝLMEYECEK)

