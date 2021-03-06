CREATE DATABASE if not exists BakeAway;

CREATE TABLE if not exists BakeAway.Bakery (
Bakery_ID int primary key,
Name VARCHAR(20),
Address VARCHAR(20),
City VARCHAR(20),
Postcode VARCHAR(8),
County VARCHAR(20),
Telephone_Num VARCHAR(11),
Email VARCHAR(40)
);

CREATE TABLE if not exists BakeAway.Menu_Items (
Product_ID int primary key,
Product_Name VARCHAR(20),
Product_Description TINYTEXT,
Product_Price DECIMAL(4,2),
Bakery_ID int,
FOREIGN KEY (Bakery_ID) REFERENCES Bakery(Bakery_ID)
);

CREATE TABLE if not exists BakeAway.Order_Details (
OrderDetails_ID int primary key,
Price VARCHAR(20),
Quantity int(100),
Discount int(100),
Product_ID int,
FOREIGN KEY (Product_ID) REFERENCES Menu_Items(Product_ID)
);

CREATE TABLE if not exists BakeAway.Customer(
Customer_ID int primary key,
Customer_Title VARCHAR(20),
Customer_fName VARCHAR(20),
Customer_lName VARCHAR(20),
Customer_DOB DATE,
Customer_AddressLine1 VARCHAR(20),
Customer_City VARCHAR(20),
Customer_Postcode VARCHAR(8),
Customer_County VARCHAR(20),
Customer_Telephone_Num CHAR(11),
Customer_Moblie_Num CHAR(11),
Customer_Email VARCHAR(40)
);

CREATE TABLE if not exists BakeAway.Order_Line (
OrderLine_ID int primary key,
OrderLine_Date DATE,
Customer_ID int,
FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

CREATE TABLE if not exists BakeAway.Payment (
Payment_ID int primary key,
Price VARCHAR(20),
Amount VARCHAR(20),
Payment_Type VARCHAR(20),
Customer_ID int,
OrderDetails_ID int,
FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
FOREIGN KEY (OrderDetails_ID) REFERENCES Order_Details(OrderDetails_ID)
);

CREATE TABLE if not exists BakeAway.Employee (
Employee_ID int primary key auto_increment,
First_Name VARCHAR(20),
Last_Name VARCHAR(20),
Address VARCHAR(20),
Postcode VARCHAR(8),
Mobile_Number CHAR(11)
);

CREATE TABLE if not exists BakeAway.Login (
Username VARCHAR(20) primary key,
Password VARCHAR(20),
Customer_ID int,
FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);
