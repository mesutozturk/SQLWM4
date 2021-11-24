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

-- Sipari�leri sipari� numaras� ve sipari� toplam tutar� olarak listeleyiniz

SELECT OrderID,ROUND(SUM((1-Discount)*UnitPrice*Quantity),2) Tutar
FROM [Order Details]
GROUP BY OrderID

-- Hangi �r�nden ne kadarl�k sipari� edilmi�
SELECT P.ProductName,ROUND(SUM((1-OD.Discount)*OD.UnitPrice*OD.Quantity),2) Tutar
FROM [Order Details] OD
JOIN Products P ON P.ProductID = OD.ProductID
GROUP BY P.ProductName
ORDER BY Tutar DESC

-- Hangi tedarik�iden ne kadarl�k tedarik edilmi�
SELECT S.CompanyName,P.ProductName,ROUND(SUM((1-OD.Discount)*OD.UnitPrice*OD.Quantity),2) Tutar
FROM [Order Details] OD
JOIN Products P ON P.ProductID = OD.ProductID
JOIN Suppliers S ON S.SupplierID = P.SupplierID
GROUP BY S.CompanyName,P.ProductName
ORDER BY S.CompanyName


-- Hangi m��teriden ne kadarl�k sipari� al�nm��
SELECT C.CompanyName,ROUND(SUM((1-OD.Discount)*OD.UnitPrice*OD.Quantity),2) Tutar
FROM [Order Details] OD
JOIN Orders O ON O.OrderID = OD.OrderID
JOIN Customers C ON C.CustomerID = O.CustomerID
GROUP BY C.CompanyName
ORDER BY Tutar DESC

-- Hangi �al��an�m ne kadarl�k �r�n sipari� etmi�

SELECT E.FirstName+' '+E.LastName AS CALISAN,ROUND(SUM((1-OD.Discount)*OD.UnitPrice*OD.Quantity),2) Tutar
FROM [Order Details] OD
JOIN Orders O ON O.OrderID = OD.OrderID
JOIN Employees E ON E.EmployeeID= O.EmployeeID
GROUP BY E.FirstName,E.LastName
ORDER BY Tutar DESC

-- Hangi �r�nden ne kadarl�k sipari� edilmi�(YILLARA G�RE GRUPLAYINIZ)

SELECT P.ProductName,YEAR(O.OrderDate) YIL,ROUND(SUM((1-OD.Discount)*OD.UnitPrice*OD.Quantity),2) Tutar
FROM [Order Details] OD
JOIN Products P ON P.ProductID = OD.ProductID
JOIN Orders O ON O.OrderID = OD.OrderID
GROUP BY P.ProductName, YEAR(O.OrderDate)
ORDER BY P.ProductName ASC, YEAR(O.OrderDate) DESC

-- Hangi �r�nden ne kadarl�k sipari� edilmi�(AYA G�RE GRUPLAYINIZ)

-- ORTALAMA F�YATIN �ST�NDE SATTI�IM �R�NLER�N L�STES�N� GET�R�N

-- HANG� M��TER�LER�M ORTALAMA S�PAR���N �ST�NDE S�PAR�� VERM�� VE NE KADARLIK S�PAR�� VERM��LER

-- HEN�Z ULA�MAMI� S�PAR��LER�N TOPLAM MAL�YET� NED�R

-- HEN�Z ULA�MAMI� �R�NLER ORTALAMA KA� G�ND�R BEKLEMEKTE

-- ORTALAMA TESL�M TAR�H�M�Z

-- S�PAR�� VER�LEN �LKELER�N L�STES� (AYNI �LKE 2 KERE G�STER�LMEYECEK)

