-- QUERY PEMBUATAN DATABASE UNTUK RALaundry

CREATE DATABASE RALaundry
USE RALaundry

CREATE TABLE MsCustomer(
	CustomerID CHAR(5) PRIMARY KEY NOT NULL CHECK (CustomerId LIKE 'CU[0-9][0-9][0-9]'),
	CustomerName VARCHAR(50) NOT NULL,
	CustomerAddress VARCHAR(100) NOT NULL,
	CustomerGender VARCHAR(10) NOT NULL CHECK (CustomerGender IN ('Male', 'Female')), 
	CustomerDateOfBirth DATE NOT NULL,
)

CREATE TABLE MsStaff(
	StaffID CHAR(5) PRIMARY KEY NOT NULL CHECK(StaffID LIKE 'ST[0-9][0-9][0-9]'),
	StaffName VARCHAR(50) NOT NULL,
	StaffAddress VARCHAR(100) NOT NULL,
	StaffGender VARCHAR(10) NOT NULL CHECK(StaffGender IN ('Male', 'Female')),
	Salary INT NOT NULL CHECK(Salary BETWEEN 1500000 AND 3000000),
)

CREATE TABLE MsClothes(
	ClothesID CHAR(5) PRIMARY KEY CHECK(ClothesID LIKE 'CL[0-9][0-9][0-9]'),
	ClothesName VARCHAR(50) NOT NULL,
	ClothesType VARCHAR(10) NOT NULL 
		CHECK(ClothesType IN ('Cotton','Viscose','Polyester','Linen','Wool')),
)

CREATE TABLE HeaderServiceTransaction(
	ServiceID CHAR(5) PRIMARY KEY  NOT NULL
		CHECK(ServiceID LIKE 'SR[0-9][0-9][0-9]'),
	CustomerID CHAR(5) NOT NULL REFERENCES MsCustomer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE,
	StaffID CHAR(5) NOT NULL REFERENCES MsStaff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE,
	ServiceDate DATE NOT NULL,
	ServiceType VARCHAR(30) NOT NULL
		CHECK(ServiceType IN('Laundry service','Dry Cleaning Service','Ironing Service')),
	ServicePrice INT NOT NULL,
)

CREATE TABLE DetailServiceTransaction(
	ServiceID CHAR(5) NOT NULL
		CHECK(ServiceID LIKE 'SR[0-9][0-9][0-9]'),
	ClothesID CHAR(5) NOT NULL 
		CHECK(ClothesID LIKE 'CL[0-9][0-9][0-9]'),

	PRIMARY KEY(ServiceID, ClothesID),
	FOREIGN KEY(ServiceID) REFERENCES HeaderServiceTransaction(ServiceID) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(ClothesID) REFERENCES MsClothes(ClothesID)
)

CREATE TABLE MsVendor(
	VendorID CHAR(5) PRIMARY KEY NOT NULL CHECK(VendorID LIKE 'VE[0-9][0-9][0-9]'),
	VendorName VARCHAR(50) NOT NULL,
	VendorAddress VARCHAR(100) NOT NULL CHECK(LEN(VendorAddress) > 10),
	VendorPhone VARCHAR(15) NOT NULL,
)

CREATE TABLE MsMaterial(
	MaterialID CHAR(5) PRIMARY KEY NOT NULL CHECK(MaterialID LIKE 'MA[0-9][0-9][0-9]'),
	MaterialName VARCHAR(100) NOT NULL,
	MaterialType VARCHAR(20) NOT NULL CHECK(MaterialType IN ('Equipment', 'Supplies')),
	MaterialPrice INT NOT NULL,
)

CREATE TABLE HeaderPurchaseTransaction(
	PurchaseID CHAR(5) PRIMARY KEY NOT NULL
		CHECK(PurchaseID LIKE 'PU[0-9][0-9][0-9]'),
	StaffID CHAR(5) NOT NULL REFERENCES MsStaff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE,
	VendorID CHAR(5) NOT NULL REFERENCES MsVendor(VendorID) ON UPDATE CASCADE ON DELETE CASCADE,
	PurchaseDate DATE NOT NULL
)

CREATE TABLE DetailPurchaseTransaction(
	PurchaseID CHAR(5) NOT NULL
		CHECK(PurchaseID LIKE 'PU[0-9][0-9][0-9]'),
	MaterialID CHAR(5) NOT NULL
		CHECK(MaterialID LIKE 'MA[0-9][0-9][0-9]'),
	Qty INT NOT NULL,

	PRIMARY KEY(PurchaseID, MaterialID),
	FOREIGN KEY(PurchaseID) REFERENCES HeaderPurchaseTransaction(PurchaseID) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(MaterialID) REFERENCES MsMaterial(MaterialID)
)

/*
USE master
DROP DATABASE RALaundry
*/




