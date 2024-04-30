-- Dimension Tables
CREATE TABLE Dim_Customers (
    Customer_ID INT PRIMARY KEY,
    Branch_ID INT,
    Customer_Name VARCHAR(255),
    Phone_Number VARCHAR(50),
    Zone_Number VARCHAR(50),
    Customer_Title VARCHAR(50),
    Gender VARCHAR(50)
    
);

CREATE TABLE Dim_Zone (
    Zone_ID INT PRIMARY KEY,
    Delivery_Fees DECIMAL(10, 2),
    Zone_Name VARCHAR(255)
   
);

CREATE TABLE Dim_Items (
    Menu_Item_ID INT PRIMARY KEY,
    Branch_ID INT,
    Menu_Item_Name VARCHAR(255),
    Price DECIMAL(10, 2),
    Category_ID INT,
    Category_Name VARCHAR(255)
    
);

CREATE TABLE Dim_Date (
    Date_Time_Key INT PRIMARY KEY,
    Date DATE,
    Year INT,
    Quarter INT,
    Month_Number INT,
    Month_Name VARCHAR(50),
    Day_of_Month INT,
    Day_of_Week INT,
    Day_Name VARCHAR(50)
   
);

-- Fact Tables
CREATE TABLE Orders_Fact (
    History_ID INT PRIMARY KEY,
    Date_Time_Key INT,
    Customer_ID INT,
    Zone_ID INT,
    Menu_Item_ID INT,
    Branch_ID INT,
    Order_ID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    Subtotal DECIMAL(10, 2),
    Total DECIMAL(10, 2),
    Outlet_ID INT,
    Outlet_Name VARCHAR(255),
    Cashier_ID INT,
    Cashier_Name VARCHAR(255),
    FOREIGN KEY (Date_Time_Key) REFERENCES Dim_Date(Date_Time_Key),
    FOREIGN KEY (Customer_ID) REFERENCES Dim_Customers(Customer_ID),
    FOREIGN KEY (Zone_ID) REFERENCES Dim_Zone(Zone_ID),
    FOREIGN KEY (Menu_Item_ID) REFERENCES Dim_Items(Menu_Item_ID),
    FOREIGN KEY (Branch_ID) REFERENCES Dim_Customers(Branch_ID)
    
);

CREATE TABLE Inventory_Fact (
    Inventory_ID INT PRIMARY KEY,
    Date_Time_Key INT,
    Branch_ID INT,
    Warehouse_ID INT,
    Warehouse_Name VARCHAR(255),
    Storeitem_Name VARCHAR(255),
    Actual INT,
    ItemPrice DECIMAL(10, 2),
    Amount DECIMAL(10, 2),
    Difference DECIMAL(10, 2),
    Difference_Amount DECIMAL(10, 2),
    FOREIGN KEY (Date_Time_Key) REFERENCES Dim_Date(Date_Time_Key),
    FOREIGN KEY (Branch_ID) REFERENCES Dim_Customers(Branch_ID)
   
);

CREATE TABLE Void_Fact (
    Void_ID INT PRIMARY KEY,
    Date_Time_Key INT,
    Menu_Item_ID INT,
    Customer_ID INT,
    Zone_ID INT,
    Branch_ID INT,
    History_ID INT,
    Order_ID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    Subtotal DECIMAL(10, 2),
    Total DECIMAL(10, 2),
    Outlet_ID INT,
    Outlet_Name VARCHAR(255),
    Cashier_ID INT,
    Cashier_Name VARCHAR(255),
    FOREIGN KEY (Date_Time_Key) REFERENCES Dim_Date(Date_Time_Key),
    FOREIGN KEY (Menu_Item_ID) REFERENCES Dim_Items(Menu_Item_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Dim_Customers(Customer_ID),
    FOREIGN KEY (Zone_ID) REFERENCES Dim_Zone(Zone_ID),
    FOREIGN KEY (Branch_ID) REFERENCES Dim_Customers(Branch_ID),
    FOREIGN KEY (History_ID) REFERENCES Orders_Fact(History_ID)
   
);
