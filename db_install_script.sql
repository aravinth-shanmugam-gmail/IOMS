drop table Inventory_Measuring_Units;
drop table Inventory_types;
drop table Inventory_Items;


create table Inventory_Measuring_Unit
(UnitFullName VARCHAR(10), UnitName VARCHAR(4) primary key);

insert into Inventory_Measuring_Unit (UnitFullName, UnitName) values ('Grams', 'gm');
insert into Inventory_Measuring_Unit (UnitFullName, UnitName) values ('Nos', '#');
insert into Inventory_Measuring_Unit (UnitFullName, UnitName) values ('Pieces', 'nos');
insert into Inventory_Measuring_Unit (UnitFullName, UnitName) values ('MilliLitre', 'ml');
insert into Inventory_Measuring_Unit (UnitFullName, UnitName) values ('Litre', 'l');
insert into Inventory_Measuring_Unit (UnitFullName, UnitName) values ('Kilograms', 'kg');

create table Inventory_type
(name varchar(40) primary key);

insert into Inventory_type values ('ingredient');
insert into Inventory_type values ('container');
insert into Inventory_type values ('packaging');
insert into Inventory_type values ('product');

create table Inventory_Item
(Id int identity(1,1), name varchar(30), description varchar(40), type varchar(40) foreign key references Inventory_type(name), units varchar(4) foreign key references Inventory_Measuring_Unit(UnitName) 
constraint InventoryItemPrimaryKey primary key (name));

insert into Inventory_Item values ('coconut oil', 'wood pressed coconut oil', 'ingredient', 'l');

insert into Inventory_Item values ('lye', 'chemical for soap', 'ingredient', 'kg');

create table Product_Audience
(AudienceName varchar(50) primary key,
Gender varchar(10) null check (Gender in ('M','F')),
MinAge int null check (MinAge >=0),
MaxAge int null check (maxage <=110)
 );

 create table Product_Category
 (name varchar(40) primary key,
 description varchar(400) default 'yet to be addded');


create table Product_Item
(Id int identity(1000,1) primary key,
Name varchar(50) not null unique,
category varchar(40) null FOREIGN key REFERENCES Product_Category(name));

create index product_name_index on product_Item(Name);

create table Product_AdditionalInfo
(id int FOREIGN key references product_Item(id),
description varchar(4000),
imageFilePath varchar(400),
Audience varchar(50) null FOREIGN key REFERENCES Product_Audience(AudienceName) );