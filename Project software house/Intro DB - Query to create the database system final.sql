create database project3
use project3
go

Create table Staff (
StaffID CHAR (5) PRIMARY KEY check (StaffID like 'SF[0-9][0-9][0-9]'),
StaffName VARCHAR (255) not null,
StaffGender VARCHAR (10) check(StaffGender = 'Female' or StaffGender = 'Male') not null,
StaffPhone VARCHAR (13) check ((LEN(StaffPhone)=13)) not null,
StaffDOB DATE check(Datediff(YEAR, StaffDOB, getdate()) > 17) not null,
StaffEmail VARCHAR (100) not null,
StaffAddress VARCHAR (100) check (StaffAddress like '[0-9][0-9][0-9] Street')
)

Create table SoftwareType (
SoftwareTypeID CHAR (5) PRIMARY KEY check (SoftwareTypeID like 'TP[0-9][0-9][0-9]'),
SoftwareTypeName VARCHAR (25) not null
)

Create table Software(
SoftwareID Char (5) PRIMARY KEY check (SoftwareID like 'SW[0-9][0-9][0-9]'),
SoftwareTypeID CHAR (5) FOREIGN KEY references SoftwareType(SoftwareTypeID),
SoftwareName VARCHAR (100) not null,
SoftwareVersion VARCHAR (100) check (SoftwareVersion like '[0-9].[0-9]') not null,
SoftwareReleaseDate Date not null,
SoftwarePrice INT CHECK (SoftwarePrice>20000 and SoftwarePrice<3000000) not null,
SoftwareStock INT not null
)

Create table Customer(
CustomerID CHAR (5) PRIMARY KEY check (CustomerID like 'CS[0-9][0-9][0-9]'),
CustomerName VARCHAR (255) check (LEN(CustomerName)>5) not null,
CustomerGender VARCHAR (10) check (CustomerGender = 'Female' OR CustomerGender = 'Male') not null,
CustomerAddress VARCHAR (100),
CustomerPhone VARCHAR (20) not null
)

Create table Distributor(
DistributorID CHAR(5) PRIMARY KEY check (DistributorID like 'DT[0-9][0-9][0-9]'),
DistributorName VARCHAR (255) check (DistributorName like '% %'),
DistributorCompany VARCHAR (255) not null,
)

Create table SalesTransaction(
SalesTransactionID CHAR (5) PRIMARY KEY check (SalesTransactionID like 'SL[0-9][0-9][0-9]'),
StaffID CHAR (5) FOREIGN KEY references Staff(StaffID),
CustomerID CHAR (5) FOREIGN KEY references Customer(CustomerID),
TransactionDate DATE not null
)

Create table SalesTransactionDetail(
SalesTransactionDetailID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
SalesTransactionID CHAR (5) FOREIGN KEY references SalesTransaction(SalesTransactionID),
SoftwareID CHAR (5) FOREIGN KEY references Software(SoftwareID),
Quantity INT check (Quantity > 0) not null
)

Create table PurchaseTransaction(
PurchaseTransactionID CHAR (5) PRIMARY KEY check (PurchaseTransactionID like 'PR[0-9][0-9][0-9]'),
StaffID CHAR (5) FOREIGN KEY references Staff(StaffID),
DistributorID CHAR (5) FOREIGN KEY references Distributor(DistributorID),
TransactionDate DATE not null,
SoftwareBought INT not null,
Quantity INT check (Quantity > 0) not null
)

Drop table SalesTransaction
Drop table SalesTransactionDetail
Drop table PurchaseTransaction
Drop table SoftwareType
Drop table Staff
Drop table Software
DROP TABLE Customer
Drop table Distributor
drop database project
create database project
use project
use master