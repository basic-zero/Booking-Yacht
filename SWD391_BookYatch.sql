use master 
create database BookYatch
go
use BookYatch
go
create table Agency(
	Id UNIQUEIDENTIFIER primary key default NEWID(),
	Name varchar(50),
	Address varchar(50),
	Phone varchar(11)
)
go
create table Orders(
	Id UNIQUEIDENTIFIER primary key default NEWID(),
	AgencyName varchar(50),
	QuantityOfPerson int,
	TotalPrice float,
	IdAgency UNIQUEIDENTIFIER foreign key references[Agency](Id)
)
go
create table Business(
	Id UNIQUEIDENTIFIER primary key default NEWID(),
	Name varchar(50),
	Phone varchar(11),
	EmailAddress varchar(30),
	Address varchar(25)
)
go
create table Tour(
	Id UNIQUEIDENTIFIER primary key default NEWID(),
	Title varchar(25),
	Descriptions varchar(255)
)
go
create table TicketType(
	Id UNIQUEIDENTIFIER primary key default NEWID(),
	Price float,
	IdTour UNIQUEIDENTIFIER foreign key references [Tour](Id)
)
go
create table VehicleType(
	Id UNIQUEIDENTIFIER primary key default NEWID(),
	Size varchar(10)
)
go
create table Vehicle(
	Id UNIQUEIDENTIFIER primary key default NEWID(),
	Name varchar(50),
	Seat int,
	Descriptions varchar(255),
	IdVehicle UNIQUEIDENTIFIER foreign key references [VehicleType](Id),
	IdBusiness UNIQUEIDENTIFIER foreign key references [Business](Id)
)
go
create table PlaceType(
	Id UNIQUEIDENTIFIER primary key default NEWID(),
)
go
create table Destination(
	Id UNIQUEIDENTIFIER primary key default NEWID(),
	Address varchar(50),
	IdPlaceType UNIQUEIDENTIFIER foreign key references [PlaceType](Id),
)
go
create table DestinationTour(
	Id UNIQUEIDENTIFIER primary key default NEWID(),
	IdPier UNIQUEIDENTIFIER foreign key references [Destination](Id),
	IdTour UNIQUEIDENTIFIER foreign key references [Tour](Id)
)
go
create table Trip(
	Id UNIQUEIDENTIFIER primary key default NEWID(),
	Time timestamp,
	IdBusiness UNIQUEIDENTIFIER foreign key references [Business](Id),
	IdVehicle UNIQUEIDENTIFIER foreign key references [Vehicle](Id)
)
go
create table Ticket(
	Id UNIQUEIDENTIFIER primary key default NEWID(),
	NameCustomer varchar(50),
	Phone varchar(11),
	IdOrder UNIQUEIDENTIFIER foreign key references[Orders](Id),
	IdTicketType UNIQUEIDENTIFIER foreign key references [TicketType](Id),
	IdTrip UNIQUEIDENTIFIER foreign key references [Trip](Id),
)
go
create table BusinessTour(
	Id UNIQUEIDENTIFIER primary key default NEWID(),
	IdBusiness UNIQUEIDENTIFIER foreign key references [Business](Id),
	IdTicketType UNIQUEIDENTIFIER foreign key references [TicketType](Id),
	IdTour UNIQUEIDENTIFIER foreign key references [Tour](Id)
)
go

