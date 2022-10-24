--b
-- table employee
CREATE TABLE Employees (
	Employee_ID CHAR(5) PRIMARY KEY CHECK(Employee_ID LIKE 'EM[0-9][0-9][0-9]'),
	Staff_ID CHAR(5) REFERENCES Employees(Employee_ID),
	Employee_Gender VARCHAR(10) CHECK(Employee_Gender IN ('Male', 'Female')),
	Employee_Name VARCHAR(30),
	Employee_Address VARCHAR(30)
)

-- table supplier
CREATE TABLE Supplier (
	Supplier_ID CHAR(5) PRIMARY KEY CHECK(Supplier_ID LIKE 'SU[0-9][0-9][0-9]'),
	Supplier_Gender VARCHAR(10) CHECK(Supplier_Gender IN ('Male', 'Female')),
	Supplier_Name VARCHAR(30),
	Supplier_Address VARCHAR(30)
)

--table purchase_transaction_header
CREATE TABLE Purchase_Transaction_Header (
	PurchaseTransaction_ID CHAR(5) CHECK(PurchaseTransaction_ID LIKE 'PU[0-9][0-9][0-9]'),
	Employee_ID CHAR(5) REFERENCES Employees(Employee_ID),
	Supplier_ID CHAR(5) REFERENCES Supplier(Supplier_ID),
	PurchaseTransaction_Date DATE
	PRIMARY KEY(PurchaseTransaction_ID)
)

--table Ingredient
CREATE TABLE Ingredient (
	Ingredient_ID CHAR(5) PRIMARY KEY CHECK(Ingredient_ID LIKE 'IN[0-9][0-9][0-9]'),
	Ingredient_Name VARCHAR(30),
	Ingredient_Price INT CHECK(Ingredient_Price > 0),
)

--table purchase_transaction_detail
CREATE TABLE Purchase_Transaction_Detail (
	PurchaseTransaction_ID CHAR(5) REFERENCES Purchase_Transaction_Header(PurchaseTransaction_ID),
	Ingredient_ID CHAR(5) REFERENCES Ingredient(Ingredient_ID),
	Purchase_Quantity INT,
	PRIMARY KEY(PurchaseTransaction_ID, Ingredient_ID)
)

--table customer
CREATE TABLE Customer (
	Customer_ID CHAR(5) PRIMARY KEY CHECK(Customer_ID LIKE 'CU[0-9][0-9][0-9]'),
	Customer_Name VARCHAR(30),
	Customer_Gender VARCHAR(10) CHECK(Customer_Gender IN ('Male', 'Female')),
	Customer_Address VARCHAR(50)
)

--Table Noodle Type
Create table NoodleType (
NoodleType_ID Char(5) PRIMARY KEY Check(NoodleType_ID LIKE'NT[0-9][0-9][0-9]'),
NoodleTypeName Varchar(20),
NoodleTypeOrigin Varchar(20)
)

--table noodle
CREATE TABLE Noodle (
	Noodle_ID CHAR(5) CHECK(Noodle_ID LIKE 'NO[0-9][0-9][0-9]'),
	Noodle_Name VARCHAR(50) CHECK(Noodle_Name LIKE '% Noodle'),
	Noodle_Price INT CHECK(Noodle_Price >= 15000),
	NoodleType_ID CHAR(5) References NoodleType(NoodleType_ID),
	PRIMARY KEY(Noodle_ID)
)

--table Sales_transaction_header
CREATE TABLE Sales_Transaction_Header (
	SalesTransaction_ID CHAR(5) PRIMARY KEY CHECK(SalesTransaction_ID LIKE 'TR[0-9][0-9][0-9]'),
	Employee_ID CHAR(5) REFERENCES Employees(Employee_ID),
	Customer_ID CHAR(5) REFERENCES Customer(Customer_ID),
	SalesTransaction_Date DATE
)

--Table Sales_transaction_detail
CREATE TABLE Sales_Transaction_Detail (
SalesTransaction_ID CHAR(5) REFERENCES Sales_Transaction_Header(SalesTransaction_ID),
Noodle_ID CHAR(5) REFERENCES Noodle(Noodle_ID),
Sales_Quantity INT,
PRIMARY KEY (SalesTransaction_id, Noodle_ID)
)