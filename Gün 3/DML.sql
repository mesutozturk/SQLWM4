-- DML 
-- INSERT INTO
-- DELETE
-- UPDATE

	
INSERT INTO Kategoriler (KategoriAdi,Aciklama)
Values ('��ecekler','S�cak & so�uk i�ecekler')

INSERT INTO Kategoriler (KategoriAdi,Aciklama)
Values ('Deniz �r�nleri','S�cak & so�uk deniz �r�nleri')

INSERT INTO Kategoriler (KategoriAdi,Aciklama)
Values ('Elektronik','S�cak & so�uk elektronik �r�nler')

use master
go
insert into ETicaret.dbo.Kategoriler (KategoriAdi,Aciklama)
select CategoryName,[Description] from Northwind.dbo.Categories

use Northwind
go

delete from Products

use ETicaret
go

--select * from Kategoriler
delete from Kategoriler 
where KategoriId = 8

select * from Kategoriler
update Kategoriler
set Aciklama = 'S�cak so�uk i�ecekler'
where KategoriId = 4

update Customers 
set Region ='Sipari�siz'
where CustomerId IN (
	SELECT C.CustomerId
	FROM Customers C
	WHERE C.CustomerID NOT IN(
		SELECT DISTINCT O.CustomerID
		FROM ORDERS O 
	)
)

declare @kid int
select @kid=KategoriId from Kategoriler
where KategoriAdi = '��ecekler'

insert into Urunler (UrunAdi,Fiyat,KategoriId,TedarikciId)
values ('Kola',10,@kid,NULL)

select * from Urunler


