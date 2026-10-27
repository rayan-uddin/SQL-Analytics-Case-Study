create database novamart_analytics;
use novamart_analytics;

Create table Customers(
	Customer_Id int primary Key,
    First_Name varchar(100),
    Last_Name varchar(100),
    Email varchar(100),
    Gender varchar(10),
    City varchar(50),
    State varchar(50),
    sign_up_date date,
	customer_segment varchar(30)
);

Create Table Products(
	Product_Id int Primary Key,
	Product_Name varchar(50),
	Category varchar(50),
	Sub_Category Varchar(50),
	Price Decimal(10,2),
	Cost Decimal(10,2),
	Stock_Quantity int,
	Supplier varchar(100)
);

Create table Orders(
	Order_Id int,
	Customer_Id int,
	Product_ID int,
	Order_Date date,
	Quantity int,
	Unit_Price decimal(10,2),
	Order_Status varchar(20),
    
    foreign key (Customer_Id)
		references Customers(Customer_Id),
        
	foreign key (Product_Id)
		references Products(Product_Id)
);

ALTER TABLE orders
ADD PRIMARY KEY (order_id);


Create table Payments(
	Payment_Id int,
	Order_Id int,
	Payment_date date,
	Payment_Method varchar(30),
	Payment_Status varchar(30),
	Amount decimal(10,2),
    
    foreign key (Order_Id)
		references Orders(Order_Id)
);

ALTER TABLE Payments
ADD PRIMARY KEY (Payment_Id);


Create table Employees(
	Employee_ID int primary key,
	First_Name varchar(30),
	Last_Name varchar(30),
	Department varchar(50),
	Job_Title varchar(30),
	Manager_Id int,
	Hired_Date date,
	Salary decimal(10,2),
	City varchar(30),
    
    foreign key (Manager_Id)
		references Employees(Employee_ID)
);

create table Marketing_Campaign(
	Campaign_Id int primary key,
	Campaign_Name varchar(50),
	Campaign_Type varchar(50),
	Start_date date,
	End_Date date,
	Budget decimal(10,2),
	Impression Varchar(30),
	Clicks int,
	Conversion int,
	Revenue_Generated decimal(10,2)
);

Create table Supporting_Ticket(
	Ticket_Id int primary key,
	Customer_Id int,
	Employee_Id int,
	Created_Date date,
	Resolved_Date date,
	Issue_Type varchar(30),
	prority varchar(30),
	Current_Status varchar(30),
	Satisation_Score int,
    
    foreign key (Customer_Id)
		references Customers(Customer_Id),
	
    foreign key (Employee_Id)
		references Employees(Employee_ID)
);

Show tables;