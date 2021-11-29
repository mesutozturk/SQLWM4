-- TANE PARAMETRE ALACAK. 1 KATEGORÝ ADI, 2 ÜRÜN ADI 3 FÝYATI
-- EÐER GÝRÝLEN KATEGORÝDE BÝR KATEGORÝ YOKSA EKLESÝN VARSA O KATEGORÝ IDSÝ ÝLE ÜRÜNÜ EKLESÝN (FÝYAT)


ALTER PROCEDURE SP_KATEGORI_URUN 
@CategoryName nvarchar(15),
@ProductName nvarchar(40),
@UnitPrice money
AS
BEGIN
	DECLARE @CatId int
	SELECT @CatId = CategoryID FROM Categories WHERE CategoryName = @CategoryName
	IF @CatId IS NULL
		BEGIN
			INSERT INTO Categories (CategoryName) VALUES(@CategoryName)
			INSERT INTO Products (ProductName,UnitPrice,CategoryID) VALUES (@ProductName,@UnitPrice,@@IDENTITY)
		END
	ELSE
		INSERT INTO Products (ProductName,UnitPrice,CategoryID) VALUES (@ProductName,@UnitPrice,@CatId)
	
	PRINT(CAST(@@IDENTITY AS NVARCHAR(150))+'idli ürün eklenmiþtir')
END

EXEC SP_KATEGORI_URUN 'Elektronik','Telefon',5000
SELECT c.CategoryName,p.ProductName,p.UnitPrice
FROM Products P
JOIN Categories C ON C.CategoryID = P.CategoryID
order by ProductID desc

