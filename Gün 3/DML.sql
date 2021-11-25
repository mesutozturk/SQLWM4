-- DML 
-- INSERT INTO
-- DELETE
-- UPDATE

	
INSERT INTO Kategoriler (KategoriAdi,Aciklama)
Values ('Ýçecekler','Sýcak & soðuk içecekler')

INSERT INTO Kategoriler (KategoriAdi,Aciklama)
Values ('Deniz Ürünleri','Sýcak & soðuk deniz ürünleri')

INSERT INTO Kategoriler (KategoriAdi,Aciklama)
Values ('Elektronik','Sýcak & soðuk elektronik ürünler')

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
set Aciklama = 'Sýcak soðuk içecekler'
where KategoriId = 4

update Customers 
set Region ='Sipariþsiz'
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
where KategoriAdi = 'Ýçecekler'

insert into Urunler (UrunAdi,Fiyat,KategoriId,TedarikciId)
values ('Kola',10,@kid,NULL)

select * from Urunler


