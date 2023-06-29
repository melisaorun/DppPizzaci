create proc RListele
as begin
select*from Pizzalar
end

create proc RSiralama
@PizzaNo int
as begin
select*from Pizzalar where
PizzaNo=@PizzaNo
end

create proc RSil
@PizzaNo int
as begin
Delete from Pizzalar where PizzaNo=@PizzaNo
end

create proc RCRUP
@PizzaNo int,
@PizzaAdi varchar(50),
@PizzaBoyu varchar(50),
@Icindekiler varchar(50),
@Fiyat int
as begin
if @PizzaNo=0
insert into Pizzalar(PizzaAdi,PizzaBoyu,Icindekiler,Fiyat)
values(@PizzaAdi,@PizzaBoyu,@Icindekiler,@Fiyat)
else
update Pizzalar set PizzaAdi=@PizzaAdi,PizzaBoyu=@PizzaBoyu,Icindekiler=@Icindekiler,Fiyat=@Fiyat
where PizzaNo=@PizzaNo
end
------------------------------------
create proc RListele1
as begin
select*from YanUrunler
end

create proc RSiralama1
@UrunNo int
as begin
select*from YanUrunler where
UrunNo=@UrunNo
end

create proc RSil1
@UrunNo int
as begin
Delete from YanUrunler where UrunNo=@UrunNo
end

create proc RCRUP1
@UrunNo int,
@UrunTuru varchar(50),
@UrunAdi varchar(50),
@Icindekiler varchar(50),
@Fiyat int
as begin
if @UrunNo=0
insert into YanUrunler(UrunTuru,UrunAdi,Icindekiler,Fiyat)
values(@UrunTuru,@UrunAdi,@Icindekiler,@Fiyat)
else
update YanUrunler set UrunTuru=@UrunTuru,UrunAdi=@UrunAdi,Icindekiler=@Icindekiler,Fiyat=@Fiyat
where UrunNo=@UrunNo
end
------------------------------
create proc RListele2
as begin
select*from Kampanyalar
end

create proc RSiralama2
@KampanyaNo int
as begin
select*from Kampanyalar where
KampanyaNo=@KampanyaNo
end

create proc RSil2
@KampanyaNo int
as begin
Delete from Kampanyalar where KampanyaNo=@KampanyaNo
end

create proc RCRUP2
@KampanyaNo int,
@KampanyaAdi varchar(50),
@Icindekiler varchar(50),
@Fiyat int
as begin
if @KampanyaNo=0
insert into Kampanyalar(KampanyaAdi,Icindekiler,Fiyat)
values(@KampanyaAdi,@Icindekiler,@Fiyat)
else
update Kampanyalar set KampanyaAdi=@KampanyaAdi,Icindekiler=@Icindekiler,Fiyat=@Fiyat
where KampanyaNo=@KampanyaNo
end