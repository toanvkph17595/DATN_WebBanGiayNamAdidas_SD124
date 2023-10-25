create database GIAYADIDAS_SD124
go 
use GIAYADIDAS_SD124

create table Roles(
Id int identity(1,1) primary key,
Name nvarchar(50) not null
)
go
create table Accounts(
Username nvarchar(50) primary key,
Password nvarchar(50) not null,
Fullname nvarchar(50) not null,
Email nvarchar(100) null,
Image nvarchar(50) null,
Address nvarchar(250) not null
)
go
create table Authoritis(
Id int identity(1,1) primary key,
IdROLE int not null,
Username nvarchar(50) not null,
foreign key (IdROLE) references Roles,
foreign key (Username) references Accounts
)
go
create table Categories(
Id int identity(1,1) primary key,
Name nvarchar(50) not null
)
go
create table Products(
Id int identity(1,1) primary key,
Name nvarchar(50) not null,
Price decimal(10,0) not null,
Quantity int not null,
Description nvarchar(250) null,
Image nvarchar(250) not null,
IdCATE int not null
foreign key (IdCATE) references Categories
)
select * from ProductVariants
update Products set Image = 'ultraboost-1.0_IG3088_01_atr.avif' where Id = 2
delete from Products where id = 1
insert into Products(Name, Price, Quantity, Description, Image, IdCATE) values(N'Giày Ultraboot 1.0 ATR', 4500000, 20, N'Mới', N'giày-ultraboost-1.0-atr.avif', 4)
go
create table ProductRatings(
Id int identity(1,1) primary key,
IdPRD int not null,
Username nvarchar(50) not null,
Raiting int null,
Comment nvarchar(250) null,
foreign key (IdPRD) references Products,
foreign key (Username) references Accounts
)
go
create table FavoriteProducts(
Id int identity(1,1) primary key,
IdPRD int not null,
Username nvarchar(50) not null
foreign key (IdPRD) references Products,
foreign key (Username) references Accounts
)
go
create table Colors(
Id int identity(1,1) primary key,
Name nvarchar(50) not null,
)

insert into Colors(Name) values('Core Black / Carbon / Grey Six'),
					('Core Black / Lucid Lemon')

go
create table Sizes(
Id int identity(1,1) primary key,
Name nvarchar(50) not null,
)

insert into Sizes(Name) values('3.5 UK'),('4 UK'), ('4.5 UK'), ('5 UK'), ('5.5 UK'), ('6 UK'), ('6.5 UK'), ('7 UK'), ('7.5 UK'),
		('8 UK'),('8.5 UK'),('9 UK'),('9.5 UK'),('10 UK'),('10.5 UK'),('11 UK'), ('11.5 UK')

go
create table ProductImages(
Id int identity(1,1) primary key,
URL nvarchar(250) not null,
)
select * from ProductImages where URL like '%IG%'
insert into ProductImages(URL) values('ultraboost-1.0_IG3088_01_atr.avif'), ('Ultraboost_1.0_IG3088_02_standard.avif'), ('Ultraboost_1.0_IG3088_03_standard.avif'),
					('Ultraboost_1.0_IG3088_04_standard.avif'), ('Ultraboost_1.0_ID1747_01_standard.avif'), ('Ultraboost_1.0_ID1747_02_standard.avif'), ('Ultraboost_1.0_ID1747_03_standard.avif'),
					('Ultraboost_1.0_ID1747_04_standard.avif')

go
create table ProductVariants(
Id int identity(1,1) primary key,
IdPRD int not null,
IdCL int not null,
IdSZ int not null,
IdPRI int not null,
foreign key (IdPRD) references Products,
foreign key (IdCL) references Colors,
foreign key (IdSZ) references Sizes,
foreign key (IdPRI) references ProductImages
)
select IdPRD from ProductVariants
insert into ProductVariants(IdPRD, IdCL, IdSZ, IdPRI) values(2, 2, 9, 9)
select Id from Products

go
create table Promotions(
Id int identity(1,1) primary key,
Name nvarchar(50) not null,
StartDate date not null,
EndDate date not null,
)
go
create table PromotionDetails(
Id int identity(1,1) primary key,
IdPRD int not null,
IdPRM int not null,
Amount int not null,
foreign key (IdPRD) references Products,
foreign key (IdPRM) references Promotions
)
go
create table Orders(
Id int identity(1,1) primary key,
Username nvarchar(50) not null,
CreateDate date not null,
Total decimal(20,0) not null,
Status nvarchar(250) null,
DeliverDate date not null,
foreign key (Username) references Accounts,
)
go
create table OrderDetails(
Id int identity(1,1) primary key,
IdOD int not null,
IdPRV int not null,
Quantity int not null,
foreign key (IdOD) references Orders,
foreign key (IdPRV) references ProductVariants
)

select * from Sizes
delete from Categories where id = 9
insert into Categories(Name) values(N'Hàng mới về'),
								(N'Ultra boot'),
								(N'Superstar'),
								(N'Stan Smith')