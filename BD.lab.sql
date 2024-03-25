create database MedievalShop
use MedievalShop
go

CREATE TABLE Swords
(SwordID INT PRIMARY KEY,
size int,
price float,
material varchar(50))

CREATE TABLE Shields
(ShieldID int primary key,
size int,
price float,
material varchar(50))

create table Potions
(PotionID int primary key,
duration int,
effect varchar(50),
price float)

create table Armor
(ArmorID int primary key,
armortype varchar(50),
material varchar(50),
price float)

create table ArmorSet
(SetID int primary key,
SwordID int foreign key references Swords(SwordID),
ShieldID int foreign key references Shields(ShieldID),
PotionID int foreign key references Potions(PotionID),
AmorID int foreign key references Armor(ArmorID),
price float)

create table Rating
(RatingID int primary key,
rating float)

create table Shop
(ShopID int,
RatingID int foreign key references Rating(RatingId),
adress varchar(50)
primary key(ShopID,adress))


create table Rooms
(RoomID int primary key,
size float,
number_of_staff int,
number_of_stands int,
ShopID int,
adress varchar(50),
FOREIGN KEY (ShopID, adress) REFERENCES Shop(ShopID, adress)
)

CREATE TABLE Stand (
    StandID int PRIMARY KEY,
    number_of_items int,
    SetID int,
    ShopID int,
    adress varchar(50),
    FOREIGN KEY (SetID) REFERENCES ArmorSet(SetID),
    FOREIGN KEY (ShopID, adress) REFERENCES Shop(ShopID, adress)
);

create table Staff
(StaffID int primary key,
salary float,
work_hours int,
ShopID int,
adress varchar(50),
FOREIGN KEY (ShopID, adress) REFERENCES Shop(ShopID, adress))


insert into Rating(RatingID,rating) values (1,4.5)
insert into Rating(RatingID,rating) values (2,5)
insert into Rating(RatingID,rating) values (3,4.2)
insert into Rating(RatingID,rating) values (4,4.8)
insert into Rating(RatingID,rating) values (5,4.7)

insert into Swords(SwordID,size,price,material) values (1,10,2000,'steel')
insert into Swords(SwordID,size,price,material) values (2,12,1500,'iron')
insert into Swords(SwordID,size,price,material) values (3,15,5000,'damascus')
insert into Swords(SwordID,size,price,material) values (4,13,3000,'bronze')
insert into Swords(SwordID,size,price,material) values (5,12,9000,'gold')

insert into Shields(ShieldID,size,price,material) values (1,10,2000,'iron')
insert into Shields(ShieldID,size,price,material) values (2,20,3000,'wood')
insert into Shields(ShieldID,size,price,material) values (3,13,2000,'steel')
insert into Shields(ShieldID,size,price,material) values (4,12,2000,'bronze')
insert into Shields(ShieldID,size,price,material) values (5,15,9000,'gold')

insert into Potions(PotionID,duration,effect,price) values (1,20,'heal',250)
insert into Potions(PotionID,duration,effect,price) values (2,60,'immunity',500)
insert into Potions(PotionID,duration,effect,price) values (3,60,'floating',2000)
insert into Potions(PotionID,duration,effect,price) values (4,45,'buffs',200)
insert into Potions(PotionID,duration,effect,price) values (5,30,'ironskin',2500)

insert into Armor(ArmorID,armortype,material,price) values (1,'light','leather',4000)
insert into Armor(ArmorID,armortype,material,price) values (2,'medium','leather',3000)
insert into Armor(ArmorID,armortype,material,price) values (3,'heavy','steel',6000)
insert into Armor(ArmorID,armortype,material,price) values (4,'light','cloth',2000)
insert into Armor(ArmorID,armortype,material,price) values (5,'medium','chainmail',4000)

insert into ArmorSet(SetID,SwordID,ShieldID,PotionID,AmorID,price) values (1,1,1,1,1,8250)
insert into ArmorSet(SetID,SwordID,ShieldID,PotionID,AmorID,price) values (2,2,2,2,2,8000)
insert into ArmorSet(SetID,SwordID,ShieldID,PotionID,AmorID,price) values (3,3,3,3,3,15000)
insert into ArmorSet(SetID,SwordID,ShieldID,PotionID,AmorID,price) values (4,4,4,4,4,7200)
insert into ArmorSet(SetID,SwordID,ShieldID,PotionID,AmorID,price) values (5,5,5,5,5,24500)


insert into Shop(ShopID,RatingID,adress) values (1,1,'departe')
insert into Shop(ShopID,RatingID,adress) values (2,2,'si mai departe')

insert into Stand(StandID,number_of_items,SetID,ShopID) values (1,4,1,1)
insert into Stand(StandID,number_of_items,SetID,ShopID) values (2,4,2,1)
insert into Stand(StandID,number_of_items,SetID,ShopID) values (3,4,3,1)
insert into Stand(StandID,number_of_items,SetID,ShopID) values (4,4,4,1)
insert into Stand(StandID,number_of_items,SetID,ShopID) values (5,4,5,1)

insert into Rooms(RoomID,size,number_of_staff,number_of_stands,ShopID) values (1,10,3,5,1)
insert into Rooms(RoomID,size,number_of_staff,number_of_stands,ShopID) values (2,12,4,7,1)
insert into Rooms(RoomID,size,number_of_staff,number_of_stands,ShopID) values (3,7,2,3,1)
insert into Rooms(RoomID,size,number_of_staff,number_of_stands,ShopID) values (4,10,4,7,2)
insert into Rooms(RoomID,size,number_of_staff,number_of_stands,ShopID) values (5,15,6,10,2)

/*
select distinct a.price,b.material from Swords a, Shields b
where a.price>=3000

select distinct a.armortype,b.effect from  Armor a,Potions b
where a.armortype='medium'

select a.SetID,AVG(a.price) as avg_price from ArmorSet a
group by a.SetID
having AVG(a.price) >=8500

select PotionID,AVG(price) as avg_price from Potions
group by PotionID
having AVG(price)>=1000

select ArmorID,armortype,AVG(price) as avg_price from Armor
where armortype = 'light'
group by ArmorID,armortype
having AVG(price)>=3000

select b.ShopID,a.rating from Rating a, Shop b
where b.RatingID=a.RatingID

select a.SwordID,b.ShieldID from Swords a, Shields b
where a.material=b.material

select a.ShopID,b.number_of_staff from Shop a, Rooms b
where b.ShopID=a.ShopID

select a.price,b.material from ArmorSet a, Swords b
where a.SwordID=b.SwordID

select a.ShieldID, b.ArmorID from Shields a, Armor b
where a.size>=13 AND b.armortype =  'heavy'
*/


/*-------------------------------------------------------------*/
/*armura si scut heavy*/
select a.ShieldID,a.AmorID, b.size,c.armortype from ArmorSet a, Shields b, Armor c
where c.armortype = 'heavy' and b.size>=13 and a.ShieldID = b.ShieldID and a.AmorID = c.ArmorID
group by a.ShieldID,a.AmorID, b.size,c.armortype

/*sabie si scut de acelasi material*/
select  a.SwordID,a.ShieldID,b.material,c.material from ArmorSet a, Swords b, Shields c
where a.ShieldID=c.ShieldID and a.SwordID = b.SwordID and b.material=c.material
group by a.SwordID,a.ShieldID,b.material,c.material

/*sabii si potiuni pe set care average.ul pretului sabiilor e mai mare de 4000*/
select distinct AVG(b.price) as avr,c.price from ArmorSet a,Swords b, Potions c
where a.PotionID = c.PotionID and a.SwordID = b.SwordID
group by b.price,c.price
having AVG(b.price)>=4000

/*magazinul si pretul setului cu sabii mai mari de 12*/
select distinct a.ShopID, b.price,c.size from Stand a, ArmorSet b, Swords c
where a.SetID = b.SetID and c.size >=12 and b.SwordID = c.SwordID

/*marimea camerelor magazinelor care au rating above average*/
select a.size, b.ShopID,AVG(c.rating) as x from Rooms a, Shop b, Rating c
where a.ShopID = b.ShopID and c.RatingID = b.RatingID
group by a.size, b.ShopID,c.rating
having AVG(c.rating)>=c.rating

/*id.ul de la armuri si din ce magazin provin*/
select a.SetID,b.ShopID from ArmorSet a, Stand b, Shop c
where a.SetID = b.SetID and b.ShopID = c.ShopID

/*ID.ul potiuniilor si armurii + preturile lor din toate seturile*/
select a.PotionID,a.AmorID,b.price,c.price from ArmorSet a, Potions b, Armor c
where a.AmorID = c.ArmorID and b.PotionID = a.PotionID

/*sabii + scuturi care au sabia de marime >= 13 si armura sa fie heavy*/
select a.ShieldID, b.ArmorID,c.SetID from Shields a, Armor b,ArmorSet c
where a.size>=13 AND b.armortype =  'heavy' AND a.ShieldID = c.ShieldID

/*numarul staff.ului din fiecare camera a fiecarui magazin inregistrat*/
select a.ShopID,b.number_of_staff from Shop a, Rooms b
where b.ShopID=a.ShopID

/*pretul si materialul sabiilor din seturile inregistrate*/
select a.price,b.material,c.material from ArmorSet a, Swords b,Shields c
where a.SwordID=b.SwordID AND a.ShieldID=c.ShieldID



/*-------------------------------------------------------------------------------------*/

DROP TABLE IF EXISTS Versiuni
CREATE TABLE Versiuni
(
    vCurenta INT PRIMARY KEY
);
INSERT INTO Versiuni
VALUES (0);

/* proc 1 rating din float in int si vice versa*/
go
CREATE OR ALTER PROCEDURE do_proc1
AS
BEGIN
    ALTER TABLE Rating
        ALTER COLUMN rating int
    UPDATE Versiuni SET vCurenta = 1;
    PRINT 'v1'
END
GO

CREATE OR ALTER PROCEDURE undo_proc1
AS
BEGIN
    ALTER TABLE Rating
        ALTER COLUMN rating int
    UPDATE Versiuni SET vCurenta = 0;
    PRINT 'v0'
END
GO

/* proc 2 default la salariu*/

CREATE OR ALTER PROCEDURE do_proc2
AS
BEGIN
    ALTER TABLE Staff
        ADD CONSTRAINT minim
            DEFAULT 1900 FOR salary
    UPDATE Versiuni SET vCurenta=2
    PRINT 'v2'
END
GO

CREATE OR ALTER PROCEDURE undo_proc2
AS
BEGIN
    ALTER TABLE Staff
        DROP CONSTRAINT minim
    UPDATE Versiuni SET vCurenta=1
    PRINT 'v1'
END
GO

/* proc 3 creeare papuci*/
CREATE OR ALTER PROCEDURE do_proc3
AS
BEGIN
    CREATE TABLE Boots
    (
        BootsID INT PRIMARY KEY,
        size       INT,
		price INT,
		material varchar(50),
        SetID INT,
        FOREIGN KEY (SetID) REFERENCES ArmorSet(SetID)
    );
    UPDATE Versiuni SET vCurenta = 3;
    PRINT 'v3'
END
GO

CREATE OR ALTER PROCEDURE undo_proc3
AS
BEGIN
    DROP TABLE Boots
    UPDATE Versiuni SET vCurenta=2
    PRINT 'v2'
END
GO

/* proc 4 adaugare data la rating*/
CREATE OR ALTER PROCEDURE do_proc4
AS
BEGIN
    ALTER TABLE Rating
        ADD data_rating date;
    UPDATE Versiuni SET vCurenta = 4;
    PRINT 'v4'
END
GO

CREATE OR ALTER PROCEDURE undo_proc4
AS
BEGIN
    ALTER TABLE Rating
        DROP COLUMN data_rating;
    UPDATE Versiuni SET vCurenta = 3;
    PRINT 'v3'
END
GO

/* proc 5 adaugare RoomID la staff*/
CREATE OR ALTER PROCEDURE do_proc5
AS
BEGIN
    ALTER TABLE Staff
        ADD RoomID INT;
    ALTER TABLE Staff
        ADD CONSTRAINT Room_FK FOREIGN KEY (RoomID) REFERENCES Rooms (RoomID);
    UPDATE Versiuni SET vCurenta = 5;
    PRINT 'v5'
END
GO

CREATE OR ALTER PROCEDURE undo_proc5
AS
BEGIN
    ALTER TABLE Staff
        DROP CONSTRAINT Room_FK;
    ALTER TABLE Staff
        DROP COLUMN RoomID;
    UPDATE Versiuni SET vCurenta = 4;
    PRINT 'v4'
END
GO

/*main*/

SELECT *
FROM Versiuni;

GO
CREATE OR ALTER PROCEDURE main @version INT AS
BEGIN
    DECLARE @actual_version AS INT
    SET @actual_version = (SELECT vCurenta FROM Versiuni)
    IF @version > 5 OR @version < 0
        BEGIN
            PRINT 'Versiunea nu exista!'
        END
    ELSE
        BEGIN
            IF @actual_version = @version
                BEGIN
                    PRINT 'Deja la versiunea aceasta!'
                END
            ELSE
                BEGIN
                    DECLARE @diff_version AS INT
                    SET @diff_version = @version - @actual_version
                    IF @diff_version > 0
                        BEGIN
                            SET @actual_version = @actual_version + 1
                            WHILE (@actual_version <= @version)
                                BEGIN
                                    DECLARE @ProcName NVARCHAR(100);
                                    SET @ProcName = 'do_proc' + CAST(@actual_version AS VARCHAR);
                                    EXEC @ProcName
                                    SET @actual_version = @actual_version + 1
                                END
                            DELETE FROM Versiuni
                            INSERT INTO Versiuni(vCurenta) VALUES (@actual_version - 1)
                        END
                    ELSE
                        BEGIN
                            WHILE (@actual_version > @version)
                                BEGIN
                                    SET @ProcName = 'undo_proc' + CAST(@actual_version AS VARCHAR);
                                    EXEC @ProcName
                                    SET @actual_version = @actual_version - 1
                                END
                            DELETE FROM Versiuni
                            INSERT INTO Versiuni(vCurenta) VALUES (@actual_version)
                        END
                END
        END

END

SELECT vCurenta FROM Versiuni
EXEC undo_proc5
EXEC undo_proc4
EXEC undo_proc3
EXEC undo_proc2
EXEC undo_proc1



/*----------------------------------------------------------------------------------------------*/

if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestRunTables_Tables]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [TestRunTables] DROP CONSTRAINT FK_TestRunTables_Tables
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestTables_Tables]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [TestTables] DROP CONSTRAINT FK_TestTables_Tables
GO
 
if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestRunTables_TestRuns]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [TestRunTables] DROP CONSTRAINT FK_TestRunTables_TestRuns
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestRunViews_TestRuns]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [TestRunViews] DROP CONSTRAINT FK_TestRunViews_TestRuns
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestTables_Tests]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [TestTables] DROP CONSTRAINT FK_TestTables_Tests
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestViews_Tests]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [TestViews] DROP CONSTRAINT FK_TestViews_Tests
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestRunViews_Views]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [TestRunViews] DROP CONSTRAINT FK_TestRunViews_Views
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestViews_Views]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [TestViews] DROP CONSTRAINT FK_TestViews_Views
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[Tables]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Tables]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[TestRunTables]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [TestRunTables]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[TestRunViews]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [TestRunViews]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[TestRuns]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [TestRuns]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[TestTables]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [TestTables]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[TestViews]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [TestViews]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[Tests]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Tests]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[Views]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Views]
GO

CREATE TABLE [Tables] (
	[TableID] [int] IDENTITY (1, 1) NOT NULL ,
	[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [TestRunTables] (
	[TestRunID] [int] NOT NULL ,
	[TableID] [int] NOT NULL ,
	[StartAt] [datetime] NOT NULL ,
	[EndAt] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [TestRunViews] (
	[TestRunID] [int] NOT NULL ,
	[ViewID] [int] NOT NULL ,
	[StartAt] [datetime] NOT NULL ,
	[EndAt] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [TestRuns] (
	[TestRunID] [int] IDENTITY (1, 1) NOT NULL ,
	[Description] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[StartAt] [datetime] NULL ,
	[EndAt] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [TestTables] (
	[TestID] [int] NOT NULL ,
	[TableID] [int] NOT NULL ,
	[NoOfRows] [int] NOT NULL ,
	[Position] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [TestViews] (
	[TestID] [int] NOT NULL ,
	[ViewID] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [Tests] (
	[TestID] [int] IDENTITY (1, 1) NOT NULL ,
	[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [Views] (
	[ViewID] [int] IDENTITY (1, 1) NOT NULL ,
	[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [Tables] WITH NOCHECK ADD 
	CONSTRAINT [PK_Tables] PRIMARY KEY  CLUSTERED 
	(
		[TableID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [TestRunTables] WITH NOCHECK ADD 
	CONSTRAINT [PK_TestRunTables] PRIMARY KEY  CLUSTERED 
	(
		[TestRunID],
		[TableID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [TestRunViews] WITH NOCHECK ADD 
	CONSTRAINT [PK_TestRunViews] PRIMARY KEY  CLUSTERED 
	(
		[TestRunID],
		[ViewID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [TestRuns] WITH NOCHECK ADD 
	CONSTRAINT [PK_TestRuns] PRIMARY KEY  CLUSTERED 
	(
		[TestRunID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [TestTables] WITH NOCHECK ADD 
	CONSTRAINT [PK_TestTables] PRIMARY KEY  CLUSTERED 
	(
		[TestID],
		[TableID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [TestViews] WITH NOCHECK ADD 
	CONSTRAINT [PK_TestViews] PRIMARY KEY  CLUSTERED 
	(
		[TestID],
		[ViewID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [Tests] WITH NOCHECK ADD 
	CONSTRAINT [PK_Tests] PRIMARY KEY  CLUSTERED 
	(
		[TestID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [Views] WITH NOCHECK ADD 
	CONSTRAINT [PK_Views] PRIMARY KEY  CLUSTERED 
	(
		[ViewID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [TestRunTables] ADD 
	CONSTRAINT [FK_TestRunTables_Tables] FOREIGN KEY 
	(
		[TableID]
	) REFERENCES [Tables] (
		[TableID]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_TestRunTables_TestRuns] FOREIGN KEY 
	(
		[TestRunID]
	) REFERENCES [TestRuns] (
		[TestRunID]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [TestRunViews] ADD 
	CONSTRAINT [FK_TestRunViews_TestRuns] FOREIGN KEY 
	(
		[TestRunID]
	) REFERENCES [TestRuns] (
		[TestRunID]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_TestRunViews_Views] FOREIGN KEY 
	(
		[ViewID]
	) REFERENCES [Views] (
		[ViewID]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [TestTables] ADD 
	CONSTRAINT [FK_TestTables_Tables] FOREIGN KEY 
	(
		[TableID]
	) REFERENCES [Tables] (
		[TableID]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_TestTables_Tests] FOREIGN KEY 
	(
		[TestID]
	) REFERENCES [Tests] (
		[TestID]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [TestViews] ADD 
	CONSTRAINT [FK_TestViews_Tests] FOREIGN KEY 
	(
		[TestID]
	) REFERENCES [Tests] (
		[TestID]
	),
	CONSTRAINT [FK_TestViews_Views] FOREIGN KEY 
	(
		[ViewID]
	) REFERENCES [Views] (
		[ViewID]
	)
GO

/*----------------------------------------------------------------*/

insert into Tables(Name) values ('Swords'), ('Rooms'), ('Shop')

insert into Views(Name) values ('View_1'), ('View_2'), ('View_3')

insert into Tests(Name) values ('select_view'), ('delete_table'), ('insert_table')

insert into TestViews(TestID, ViewID) values (1, 1), (1, 2), (1, 3)

insert into TestTables(TestID, TableID, NoOfRows, Position) values (2, 1, 1000, 3), (2, 2, 1000, 2), (2, 3, 1000, 1)

insert into TestTables(TestID, TableID, NoOfRows, Position) values (3, 1, 1000, 1), (3, 2, 1000, 2), (3, 3, 1000, 3)

update TestTables set Position = 3 where TestID = 3 and TableID = 3

select * from Tables
select * from Views
select * from Tests
select * from TestViews
select * from TestTables

create or alter view view_1 as
	select SwordID,size,price,material from Swords
go

create or alter view view_2 as
	select RoomID,size,number_of_staff,number_of_stands from Rooms
go

create or alter view view_3 as
	select * from Shop
go


/*-------------------------------------*/
create or alter procedure delete_table @table_name varchar(50)
as
begin

	declare @query varchar(1000)
	set @query = 'delete from ' + @table_name
	exec(@query)

end

create or alter procedure insert_table_swords
as
begin

	declare @noOfrows int
	declare @cnt int

	select top 1 @noOfrows = NoOfRows from TestTables where TableID = 1
	set @cnt = 0

	while @cnt < @noOfrows
	begin
		insert into Swords(SwordID, size,price,material) values(@cnt+1, 13,1000,'iron')
		set @cnt = @cnt + 1
	end

end

create or alter procedure insert_table_rooms
as
begin

	declare @fk int
	DECLARE @fk3 char(10)
	declare @cnt int
	declare @noOfRows int

	set @cnt = 0
	select top 1 @noOfRows = NoOfRows from TestTables where TableID = 2

	while @cnt < @noOfRows
	begin
		select top 1 @fk = ShopID from Shop order by newid()
		SELECT TOP 1 @fk3 = adress FROM Shop ORDER BY NEWID()
		insert into Rooms(RoomID,size,number_of_staff,number_of_stands,ShopID,adress) values(@cnt+1,20,2,4,@fk,@fk3)
		set @cnt = @cnt + 1
	end
end

exec insert_table_rooms
select * from Shop

create or alter procedure insert_table_shops
as
begin
	declare @noOfRows int
	declare @cnt int

	select top 1 @noOfRows = NoOfRows from TestTables where TableID = 3
	set @cnt = 0

	declare @pk1 int
	declare @pk2 varchar(5)

	set @pk1 = 1
	
	while @cnt < @noOfRows
	begin
		set @pk2 = convert  (varchar(5), @cnt)
		insert into Shop(ShopID,RatingID,adress) values(@pk1,4,@pk2)
		set @pk1 = @pk1 + 1
		set @cnt = @cnt + 1
	end
end


create or alter procedure select_view @view_name varchar(50)
as
begin
	declare @query varchar(1000)
	set @query = 'select * from ' + @view_name
	exec(@query)
end

exec delete_table Swords
exec delete_table	s
exec delete_table Shop

exec insert_table_swords
exec insert_table_rooms
exec insert_table_shops

select * from Swords
select * from Rooms
select * from Shop


create or alter procedure test_run_simple_swords
as
begin

	declare @ds datetime
	declare @di datetime
	declare @de datetime


	declare @pos_insert int
	declare @pos_delete int
	declare @id_tabel int
	declare @nume_tabel varchar(50)

	select top 1 @pos_delete = Position from TestTables where TableID = 1 and TestID = 2
	select top 1 @pos_insert = Position from TestTables where TableID = 1 and TestID = 3

	declare @pos int
	set @pos = 1

	while @pos < @pos_delete
	begin
		select top 1 @id_tabel = TableID from TestTables where Position = @pos and TestID = 2
		select top 1 @nume_tabel = Name from Tables where TableID = @id_tabel
		exec delete_table @nume_tabel
		set @pos = @pos+1
	end


	set @ds = getdate()

	exec delete_table Swords

	set @pos = 1

	while @pos < @pos_insert
	begin
		select top 1 @id_tabel = TableID from TestTables where Position = @pos and TestID = 3
		if @id_tabel = 1
		begin
			exec insert_table_swords
		end
		else if @id_tabel = 2
			exec insert_table_rooms
		else if @id_tabel = 3
			exec insert_table_shops
		set @pos = @pos+1
	end

	exec insert_table_swords

	set @di = getdate()

	exec select_view View_1

	set @de = getdate()
	
	print datediff(ms, @de, @ds)

	insert into TestRuns(Description, StartAt, EndAt) values('delete, insert, select pe tabela swords, respectiv, view-ul View_1', @ds, @de)
	declare @testrunid int 
	set @testrunid = SCOPE_IDENTITY()
	insert into TestRunTables(TestRunID, TableID, StartAt, EndAt) values(@testrunid, 1, @ds, @di)
	insert into TestRunViews(TestRunID, ViewID, StartAt, EndAt) values(@testrunid, 1, @di, @de)

end



create or alter procedure test_run_simple_rooms
as
begin

	declare @ds datetime
	declare @di datetime
	declare @de datetime

	declare @pos_insert int
	declare @pos_delete int
	declare @id_tabel int
	declare @nume_tabel varchar(50)

	select top 1 @pos_delete = Position from TestTables where TableID = 1 and TestID = 2
	select top 1 @pos_insert = Position from TestTables where TableID = 1 and TestID = 3

	declare @pos int
	set @pos = 1

	while @pos < @pos_delete
	begin
		select top 1 @id_tabel = TableID from TestTables where Position = @pos and TestID = 2
		select top 1 @nume_tabel = Name from Tables where TableID = @id_tabel
		exec delete_table @nume_tabel
		set @pos = @pos+1
	end

	set @ds = getdate()

	exec delete_table Rooms

	set @pos = 1

	while @pos < @pos_insert
	begin
		select top 1 @id_tabel = TableID from TestTables where Position = @pos and TestID = 3
		if @id_tabel = 1
		begin
			exec insert_table_swords
		end
		else if @id_tabel = 2
			exec insert_table_rooms
		else if @id_tabel = 3
			exec insert_table_shops
		set @pos = @pos+1
	end

	exec insert_table_rooms

	set @di = getdate()

	exec select_view View_2

	set @de = getdate()

	print datediff(ms, @de, @ds)

	insert into TestRuns(Description, StartAt, EndAt) values('delete, insert, select pe tabela rooms, repectiv view-ul View_2', @ds, @de)
	declare @testrunid int 
	set @testrunid = SCOPE_IDENTITY()
	insert into TestRunTables(TestRunID, TableID, StartAt, EndAt) values(@testrunid, 2, @ds, @di)
	insert into TestRunViews(TestRunID, ViewID, StartAt, EndAt) values(@testrunid, 2, @di, @de)

end


create or alter procedure test_run_simple_shop
as
begin

	declare @ds datetime
	declare @di datetime
	declare @de datetime

	declare @pos_insert int
	declare @pos_delete int
	declare @id_tabel int
	declare @nume_tabel varchar(50)

	select top 1 @pos_delete = Position from TestTables where TableID = 1 and TestID = 2
	select top 1 @pos_insert = Position from TestTables where TableID = 1 and TestID = 3

	declare @pos int
	set @pos = 1

	while @pos < @pos_delete
	begin
		select top 1 @id_tabel = TableID from TestTables where Position = @pos and TestID = 2
		select top 1 @nume_tabel = Name from Tables where TableID = @id_tabel
		exec delete_table @nume_tabel
		set @pos = @pos+1
	end

	set @ds = getdate()

	exec delete_table Shop

	set @pos = 1

	while @pos < @pos_insert
	begin
		select top 1 @id_tabel = TableID from TestTables where Position = @pos and TestID = 3
		if @id_tabel = 1
		begin
			exec insert_table_swords
		end
		else if @id_tabel = 2
			exec insert_table_rooms
		else if @id_tabel = 3
			exec insert_table_shops
		set @pos = @pos+1
	end

	exec insert_table_shops

	set @di = getdate()

	exec select_view View_3

	set @de = getdate()

	print datediff(ms, @de, @ds)

	insert into TestRuns(Description, StartAt, EndAt) values('delete, insert, select pe tabela shops, repectiv view-ul View_3', @ds, @de)
	declare @testrunid int 
	set @testrunid = SCOPE_IDENTITY()
	insert into TestRunTables(TestRunID, TableID, StartAt, EndAt) values(@testrunid, 3, @ds, @di)
	insert into TestRunViews(TestRunID, ViewID, StartAt, EndAt) values(@testrunid, 3, @di, @de)

end



create procedure test_run_complet
as
begin
	set nocount on
	exec test_run_simple_swords
	exec test_run_simple_rooms
	exec test_run_simple_shop
end 

exec test_run_complet

select * from TestRuns
select * from TestRunTables
select * from TestRunViews

delete from TestRuns
delete from TestRunTables
delete from TestRunViews

/*-----------------------------------------------------------------------------------------*/


create or alter function testVarcharParam(@param varchar(30))
returns int
as
begin

	if len(@param) = 0
		return 0

	return 1

end

go

create or alter function testIntParam(@param int)
returns int
as
begin

	if @param < 1
		return 0

	return 1

end



go
create or alter procedure CRUD_Swords @sdid int, @ssize int, @sprice int, @smaterial varchar(30)
as
begin
	
	set nocount on

	if (dbo.testVarcharParam(@smaterial) = 1 and dbo.testIntParam(@sdid) = 1 and dbo.testIntParam(@ssize) = 1 and dbo.testIntParam(@sprice) = 1)
	begin
		insert into Swords(SwordID,size, price, material) values(@sdid, @ssize,@sprice,@smaterial)

		select * from Swords

		update Swords set material = 'k_' + @smaterial where SwordID = @sdid

		select * from Swords

		delete from Swords where SwordID = @sdid

		select * from Swords

		print 'CRUD operations for table Swords'
	end
	else
	begin
		print 'Validation error'
	end
end

create or alter procedure CRUD_Armor @aid int, @armortype varchar(30),@aprice int, @amaterial varchar(30)
as
begin
	
	set nocount on


	if (dbo.testVarcharParam(@armortype) = 1 and dbo.testVarcharParam(@amaterial) = 1)
	begin
		insert into Armor(ArmorID, armortype,price,material) values(@aid,@armortype,@aprice,@amaterial)

		select * from Armor

		update Armor set armortype = 'mod_' + @armortype where armortype = @armortype

		select * from Armor

		delete from Armor where ArmorID = @aid

		select * from Armor

		print 'CRUD operations for table Armor'
	end
	else
	begin
		print 'Validation error'
	end
end


create or alter procedure CRUD_Armorset @setid int, @swordid int, @shieldid int,@potionid int,@armorid int, @price int
as
begin
	
	set nocount on
	insert into Armor(ArmorID, armortype,price,material) values(1,'light',3000,'leather')
	insert into Swords(SwordID,size, price, material) values(1, 12,2000,'damascus')
	insert into Shields(ShieldID,size, price, material) values(1, 12,2000,'damascus')
	insert into Potions(PotionID,duration,effect,price) values(1,20,'da',2000)

	if (dbo.testIntParam(@swordid) = 1 and dbo.testIntParam(@armorid) = 1)
	begin
		if (exists(select * from Swords where SwordID = @swordid) 
			and exists(select * from Armor where ArmorID = @armorid))
		begin
			insert into ArmorSet(SetID, SwordID, ShieldID,PotionID,AmorID,price) values(@setid, @swordid, @shieldid,@potionid,@armorid,@price)

			select * from ArmorSet

			update ArmorSet set price = 1 + @price where price = @price

			select * from ArmorSet

			delete from ArmorSet where SwordID = @swordid and AmorID = @armorid

			select * from ArmorSet

			print 'CRUD operations for table ArmorSet'

			delete from Shields
			delete from Armor
			delete from Potions
			delete from Swords
		end
		else
		begin
			print 'Parametrii nevalizi (sword/armor inexistent sau inregistrare existenta)'
			delete from Shields
			delete from Armor
			delete from Potions
			delete from Swords
		end
	end
	else
	begin
		print 'Validation error'
		delete from Shields
			delete from Armor
			delete from Potions
			delete from Swords
	end
end

select * from Swords
exec CRUD_Swords 1,12,2000,'blat'
exec CRUD_Armor 1,'light',3000,'leather'
exec CRUD_ArmorSet 1,1,1,1,1,20000

create or alter view view1_lab5 as
	select SwordId,material from swords
	where material like 'iron%'

insert into Swords values
(6,10,1000,'iron1'),
(7,10,1000,'iron2'),
(8,10,1000,'iron3'),
(9,10,1000,'iron4'),
(10,10,1000,'iron5')

select * from Swords
delete from swords


CREATE OR ALTER VIEW view2_lab5 AS
SELECT s.SwordID 
FROM Swords s 
INNER JOIN ArmorSet a ON s.SwordID = a.SwordID
WHERE s.material LIKE 'iron%';
	
select * from ArmorSet
insert into ArmorSet values
(1,1,1,1,1,100000),
(2,2,1,1,1,100000),
(3,3,1,1,1,100000),
(4,4,1,1,1,100000),
(5,5,1,1,1,100000)

insert into Armor values
(1,'a','a',1000)
insert into Shields values
(1,1,1000,'a')
insert into Potions values
(1,1,'a',1000)



if exists(select name from sys.indexes where name = N'N_idx_material')
	drop index N_idx_material on Swords
go
create nonclustered index N_idx_material on Swords(material)
go


if exists(select name from sys.indexes where name = N'N_idx_price')
	drop index N_idx_price on ArmorSet
go
create nonclustered index N_idx_price on ArmorSet(price)
go

select * from view1_lab5
select * from view2_lab5