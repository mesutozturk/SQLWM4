USE [master]
GO
CREATE DATABASE ETicaret
go
use ETicaret
GO
CREATE TABLE [dbo].[Calisanlar](
	[CalisanId] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](50) NOT NULL,
	[Soyad] [nvarchar](50) NOT NULL,
	[Telefon] [char](11) NULL,
	[EklenmeTarihi] [date] NULL,
	[AmirId] [int] NOT NULL,
 CONSTRAINT [PK_Calisanlar] PRIMARY KEY CLUSTERED 
(
	[CalisanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kargocular]    Script Date: 25.11.2021 12:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kargocular](
	[KargoId] [int] NOT NULL,
	[FirmaAdi] [nvarchar](50) NOT NULL,
	[Telefon] [char](11) NULL,
 CONSTRAINT [PK_Kargocular] PRIMARY KEY CLUSTERED 
(
	[KargoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 25.11.2021 12:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoriler](
	[KategoriId] [int] IDENTITY(1,1) NOT NULL,
	[KategoriAdi] [nvarchar](25) NOT NULL,
	[Aciklama] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[KategoriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Siparis Detaylari]    Script Date: 25.11.2021 12:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siparis Detaylari](
	[SiparisId] [int] NOT NULL,
	[UrunId] [int] NOT NULL,
	[Fiyat] [decimal](6, 2) NOT NULL,
	[Adet] [int] NOT NULL,
 CONSTRAINT [PK_Siparis Detaylari] PRIMARY KEY CLUSTERED 
(
	[SiparisId] ASC,
	[UrunId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Siparisler]    Script Date: 25.11.2021 12:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siparisler](
	[SiparisId] [int] IDENTITY(1,1) NOT NULL,
	[Tarih] [datetime] NOT NULL,
	[CalisanId] [int] NOT NULL,
	[KargoId] [int] NOT NULL,
 CONSTRAINT [PK__Siparisl__C3F03BFDA07F7336] PRIMARY KEY CLUSTERED 
(
	[SiparisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tedarikciler]    Script Date: 25.11.2021 12:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tedarikciler](
	[TedarikciId] [int] IDENTITY(1,1) NOT NULL,
	[FirmaAdi] [nvarchar](50) NOT NULL,
	[Telefon] [char](11) NULL,
	[OlusturmaZamani] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TedarikciId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 25.11.2021 12:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urunler](
	[UrunId] [int] IDENTITY(1,1) NOT NULL,
	[UrunAdi] [nvarchar](50) NOT NULL,
	[Fiyat] [decimal](6, 2) NOT NULL,
	[KategoriId] [int] NOT NULL,
	[TedarikciId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UrunId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Kargocular_FirmaAdi]    Script Date: 25.11.2021 12:10:41 ******/
ALTER TABLE [dbo].[Kargocular] ADD  CONSTRAINT [UK_Kargocular_FirmaAdi] UNIQUE NONCLUSTERED 
(
	[FirmaAdi] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_FirmaAdi]    Script Date: 25.11.2021 12:10:41 ******/
ALTER TABLE [dbo].[Tedarikciler] ADD  CONSTRAINT [UQ_FirmaAdi] UNIQUE NONCLUSTERED 
(
	[FirmaAdi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Calisanlar] ADD  CONSTRAINT [DF_Calisanlar_EklenmeTarihi]  DEFAULT (getdate()) FOR [EklenmeTarihi]
GO
ALTER TABLE [dbo].[Siparis Detaylari] ADD  DEFAULT ((1)) FOR [Adet]
GO
ALTER TABLE [dbo].[Tedarikciler] ADD  DEFAULT (getdate()) FOR [OlusturmaZamani]
GO
ALTER TABLE [dbo].[Calisanlar]  WITH CHECK ADD  CONSTRAINT [FK_Calisanlar_Calisanlar] FOREIGN KEY([AmirId])
REFERENCES [dbo].[Calisanlar] ([CalisanId])
GO
ALTER TABLE [dbo].[Calisanlar] CHECK CONSTRAINT [FK_Calisanlar_Calisanlar]
GO
ALTER TABLE [dbo].[Siparis Detaylari]  WITH CHECK ADD  CONSTRAINT [FK_Siparis Detaylari_Siparisler] FOREIGN KEY([SiparisId])
REFERENCES [dbo].[Siparisler] ([SiparisId])
GO
ALTER TABLE [dbo].[Siparis Detaylari] CHECK CONSTRAINT [FK_Siparis Detaylari_Siparisler]
GO
ALTER TABLE [dbo].[Siparis Detaylari]  WITH CHECK ADD  CONSTRAINT [FK_Siparis Detaylari_Urunler] FOREIGN KEY([UrunId])
REFERENCES [dbo].[Urunler] ([UrunId])
GO
ALTER TABLE [dbo].[Siparis Detaylari] CHECK CONSTRAINT [FK_Siparis Detaylari_Urunler]
GO
ALTER TABLE [dbo].[Siparisler]  WITH CHECK ADD  CONSTRAINT [FK_Siparisler_Calisan] FOREIGN KEY([CalisanId])
REFERENCES [dbo].[Calisanlar] ([CalisanId])
GO
ALTER TABLE [dbo].[Siparisler] CHECK CONSTRAINT [FK_Siparisler_Calisan]
GO
ALTER TABLE [dbo].[Siparisler]  WITH CHECK ADD  CONSTRAINT [FK_Siparisler_Kargocular] FOREIGN KEY([KargoId])
REFERENCES [dbo].[Kargocular] ([KargoId])
GO
ALTER TABLE [dbo].[Siparisler] CHECK CONSTRAINT [FK_Siparisler_Kargocular]
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD FOREIGN KEY([KategoriId])
REFERENCES [dbo].[Kategoriler] ([KategoriId])
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD FOREIGN KEY([TedarikciId])
REFERENCES [dbo].[Tedarikciler] ([TedarikciId])
GO
ALTER TABLE [dbo].[Siparis Detaylari]  WITH CHECK ADD CHECK  (([Fiyat]>(0)))
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD CHECK  (([Fiyat]>(0)))
GO
USE [master]
GO
ALTER DATABASE [ETicaret] SET  READ_WRITE 
GO
