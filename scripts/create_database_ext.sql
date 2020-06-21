# EXTENDED COMPANY DATABASE
USE company_ext;
DROP TABLE IF EXISTS orderdetails, orders, payment, shippers,  products, suppliers, category, customers;

CREATE TABLE Customers (
    CustomerID 				CHAR(4) NOT NULL,
    FirstName 				VARCHAR(100) NOT NULL,
    LastName 				VARCHAR(100) NOT NULL,
    Class 				VARCHAR(100),
    Room 				VARCHAR(50),
    Building 				VARCHAR(50),
    Address1 				VARCHAR(255) NOT NULL,
    Address2 				VARCHAR(255),
    City 				VARCHAR(100) NOT NULL,
    State 				CHAR(2) NOT NULL,
    PostalCode 				CHAR(5) NOT NULL,
    Country 				VARCHAR(100) NOT NULL,
    Phone 				CHAR(13),
    Email 				VARCHAR(100),
    Voicemail 				CHAR(13),
    Password 				VARCHAR(100) NOT NULL,
    CreditCard 				CHAR(16),
    CreditCardTypeID 			VARCHAR(75),
    CardExpMo 				VARCHAR(25),
    CardExpYr 				INTEGER,
    BillingAddress 			VARCHAR(100),
    BillingCity 			VARCHAR(100),
    BillingRegion 			VARCHAR(100),
    BillingPostalCode 			CHAR(5),
    BillingCountry 			VARCHAR(100),
    ShipAddress 			VARCHAR(100),
    ShipCity 				VARCHAR(100),
    ShipRegion 				VARCHAR(100),
    ShipPostalCode 			CHAR(5),
    ShipCountry 			VARCHAR(100),
    DateEntered 			DATE,
    CONSTRAINT PK_CustomerID PRIMARY KEY (CustomerID)
);


CREATE TABLE Category (
	CategoryID 			CHAR(4) NOT NULL,
    CategoryName 			VARCHAR(100),
    Description 			VARCHAR(250),
    Picture				VARCHAR(250),
    Active				BOOLEAN,
    CONSTRAINT PK_CategoryID PRIMARY KEY (CategoryID)
);


CREATE TABLE Shippers (
	ShipperID 			CHAR(4) NOT NULL,
    CompanyName 			VARCHAR(100),
    Phone 				CHAR(13),
    CONSTRAINT PK_ShipperID PRIMARY KEY (ShipperID)
);


CREATE TABLE Suppliers (
	SupplierID 			CHAR(4) NOT NULL,
    CompanyName 			VARCHAR(255) NOT NULL,
    ContactFName 			VARCHAR(255) NOT NULL,
    ContactLName 			VARCHAR(255) NOT NULL,
    ContactTitle 			VARCHAR(255),
    Address1 				VARCHAR(255) NOT NULL,
    Address2 				VARCHAR(255),
    City 				VARCHAR(255) NOT NULL,
    State 				VARCHAR(255) NOT NULL,
    PostalCode 				CHAR(10) NOT NULL,
    Country 				VARCHAR(255) NOT NULL,
    Phone 				CHAR(13),
    Fax 				CHAR(13),
    Email 				VARCHAR(255),
    URL 				VARCHAR(255),
    PaymentMethods 			ENUM('Cash','Credit','Paypal'),
    DiscountType 			VARCHAR(255),
    TypeGoods 				VARCHAR(255),
    Notes 				VARCHAR(512),
    DiscountAvailable 			BOOLEAN,
    CurrentOrder 			VARCHAR(255),
    Logo 				VARCHAR(255),
    CustomerID 				CHAR(4) NOT NULL,
    SizeURL 				VARCHAR(255),
    CONSTRAINT PK_SupplierID PRIMARY KEY (SupplierID),
    CONSTRAINT FK_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
);


CREATE TABLE Products (
	ProductID 			CHAR(4) NOT NULL,
    SKU					INTEGER,
    IDSKU				INTEGER,
    VendorProductID 			CHAR(4) NOT NULL,
    ProductName 			VARCHAR(255), 
    ProductDescription 			VARCHAR(512),
    SupplierID 				CHAR(4) NOT NULL,
    CategoryID 				CHAR(4) NOT NULL,
    QuantityPerUnit 			FLOAT,
    UnitPrice 				FLOAT,
    MSRP				FLOAT,
    AvailableSize 			VARCHAR(50),
    AvailableColors 			VARCHAR(50),
    Size 				VARCHAR(50),
    Color 				VARCHAR(50),
    Discount 				FLOAT,
    UnitWeight 				FLOAT,
    UnitsInStock 			INTEGER,
    UnitsOnOrder 			INTEGER,
    ReorderLevel 			INTEGER,
    ProductAvailable 			BOOLEAN,
    DiscountAvailable 			BOOLEAN,
    CurrentOrder			VARCHAR(250),
    Picture				VARCHAR(250),
    Ranking 				INTEGER,
    Note 				VARCHAR(512),
    CONSTRAINT PK_ProductID PRIMARY KEY (ProductID),
    CONSTRAINT FK_SupplierID FOREIGN KEY (SupplierID) REFERENCES Suppliers (SupplierID),
    CONSTRAINT FK_CategoryID FOREIGN KEY (CategoryID) REFERENCES Category (CategoryID)
);


CREATE TABLE Payment (
	PaymentID 			CHAR(4) NOT NULL,
    PaymentType				VARCHAR(100),
    Allowed 				BOOLEAN,
    CONSTRAINT PK_PaymentID PRIMARY KEY (PaymentID)
);


CREATE TABLE Orders (
	OrderID 			CHAR(4) NOT NULL,
    CustomerID 				CHAR(4) NOT NULL,
    OrderNumber 			INTEGER,
    PaymentID 				CHAR(4) NOT NULL,
    OrderDate 				DATE,
    ShipDate 				DATE,
    RequiredDate 			DATE,
    ShipperID 				CHAR(4) NOT NULL,
    Freight 				VARCHAR(100),
    SalesTax 				FLOAT,
    Timestamp 				DATETIME,
    TransactStatus 			VARCHAR(25),
    ErrLoc 				VARCHAR(100),
    ErrMsg 				VARCHAR(100),
    Fullfilled 				BOOLEAN,
    Deleted 				BOOLEAN,
    Paid 				FLOAT,
    PaymentDate 			DATE,
    CONSTRAINT PK_OrderID PRIMARY KEY (OrderID),
    CONSTRAINT FK_CustomerID_Orders FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
    CONSTRAINT FK_PaymentID FOREIGN KEY (PaymentID) REFERENCES Payment (PaymentID),
    CONSTRAINT FK_ShipperID FOREIGN KEY (ShipperID) REFERENCES Shippers (ShipperID)
);


CREATE TABLE OrderDetails (
	OrderID 			CHAR(4) NOT NULL,
    ProductID 				CHAR(4) NOT NULL,
    OrderNumber 			INTEGER,
    Price 				FLOAT,
	Quantity 			FLOAT,
    Discount 				FLOAT,
    Total 				FLOAT,
    IDSKU				INTEGER,
    Size 				FLOAT,
    Color 				VARCHAR(50),
    Fulfilled 				BOOLEAN,
    ShipDate 				DATE,
    OrderDetailID 			CHAR(4) NOT NULL,
    BillDate 				DATE,
    CONSTRAINT PK_OrderID PRIMARY KEY (OrderID),
    CONSTRAINT FK_ProductID FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
);
