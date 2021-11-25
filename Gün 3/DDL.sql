USE master
GO
CREATE DATABASE ETicaret
GO

USE ETicaret
GO

CREATE TABLE Kategoriler (
	KategoriId INT IDENTITY PRIMARY KEY,
	KategoriAdi nvarchar(25) NOT NULL,
	Aciklama nvarchar(200) -- null
)
go

CREATE TABLE Urunler (
	UrunId INT IDENTITY PRIMARY KEY,
	UrunAdi nvarchar(50) NOT NULL,
	Fiyat decimal(6,2) NOT NULL,
	KategoriId int foreign key references Kategoriler(KategoriId) NOT NULL
)
GO

ALTER TABLE Urunler
ADD CHECK (Fiyat>0);

go

CREATE TABLE Tedarikciler (
	TedarikciId int identity(1,1) PRIMARY KEY,
	FirmaAdi nvarchar(50) not null,
	Telefon char(11),
	OlusturmaZamani datetime not null default (getdate())
)

ALTER TABLE Urunler
ADD TedarikciId int foreign key references Tedarikciler(TedarikciId)

ALTER TABLE Tedarikciler
ADD CONSTRAINT UQ_FirmaAdi UNIQUE (FirmaAdi)

CREATE TABLE Siparisler (
	SiparisId Int Identity Primary Key,
	Tarih datetime not null
)
go

CREATE TABLE [Siparis Detaylari](
	SiparisId int not null,
	UrunId int not null,
	Fiyat decimal(6,2) not null Check (Fiyat>0),
	Adet int not null default (1),
	CONSTRAINT PK_SiparisDetaylari PRIMARY KEY (SiparisId,UrunId),
	CONSTRAINT FK_UrunId FOREIGN KEY (UrunId) References Urunler(UrunId),
	CONSTRAINT FK_SiparisId FOREIGN KEY (SiparisId) References Siparisler(SiparisId)
)