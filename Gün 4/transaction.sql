use master
go
CREATE DATABASE Banka
go
use Banka
go

create table Hesaplar(
	Id int identity primary key,
	AdSoyad nvarchar(50) not null,
	Bakiye decimal(12,3) default 0,
)

insert into Hesaplar values ('Mesut',5000)
insert into Hesaplar values ('Oðuzhan',1000)
insert into Hesaplar values ('Berna',7500)
insert into Hesaplar values ('Gizem',1500)


alter proc sp_havale_yap
@aliciId int,
@gondericiId int,
@tutar decimal(12,3)
as
begin
	BEGIN TRY
		BEGIN TRAN HavaleTran
			IF EXISTS (select * from Hesaplar where Id = @gondericiId)
				begin
					update Hesaplar set Bakiye-= @tutar where Id = @gondericiId
				end
			ELSE
				begin
					RAISERROR('Gönderici bulunamadý',16,1)
				end
			IF EXISTS (select * from Hesaplar where Id = @aliciId)
				begin		
					update Hesaplar set Bakiye+= @tutar where Id = @aliciId
				end
			ELSE
				begin
					RAISERROR('Alýcý bulunamadý',16,1)
				end
		COMMIT TRAN HavaleTran
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN HavaleTran
		print (ERROR_MESSAGE())
	END CATCH
end


select SUM(Bakiye) from Hesaplar
select * from hesaplar


exec sp_havale_yap 2,3,1500
exec sp_havale_yap 23,1,5000
exec sp_havale_yap 1,23,5000000

