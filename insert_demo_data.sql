
INSERT INTO Category (Name, Number_Of)
VALUES ('Car', 5);


INSERT INTO Category (Name, Number_Of)
VALUES ('Bike', 3);


INSERT INTO Category (Name, Number_Of)
VALUES ('Truck', 3);

INSERT INTO Category (Name, Number_Of)
VALUES ('Motorcycle', 9);

INSERT INTO Category (Name, Number_Of)
VALUES ('Van', 5);

-- ######################################################

INSERT INTO Manufacturer (Name, Country)
VALUES ('Toyota', 'Japan');


INSERT INTO Manufacturer (Name, Country)
VALUES ('Honda', 'Japan');


INSERT INTO Manufacturer (Name, Country)
VALUES ('BMW', 'Germany');


INSERT INTO Manufacturer (Name, Country)
VALUES ('Mercedes', 'Germany');


INSERT INTO Manufacturer (Name, Country)
VALUES ('Ford', 'USA');

-- ######################################################

INSERT INTO Car (ID, Model, Weight, Color, Price, Category_ID, Manufacturer_ID)
VALUES ('C001', 'Corolla', 1200, 'White', 10000, 1, 1);


INSERT INTO Car (ID, Model, Weight, Color, Price, Category_ID, Manufacturer_ID)
VALUES ('C002', 'Accord', 1300, 'Black', 12000, 1, 2);


INSERT INTO Car (ID, Model, Weight, Color, Price, Category_ID, Manufacturer_ID)
VALUES ('C003', 'Camry', 1400, 'Red', 15000, 1, 1);


INSERT INTO Car (ID, Model, Weight, Color, Price, Category_ID, Manufacturer_ID)
VALUES ('C004', 'Civic', 1500, 'Blue', 11000, 1, 2);


INSERT INTO Car (ID, Model, Weight, Color, Price, Category_ID, Manufacturer_ID)
VALUES ('C005', 'X5', 1600, 'White', 20000, 1, 3);


INSERT INTO Car (ID, Model, Weight, Color, Price, Category_ID, Manufacturer_ID)
VALUES ('B001', 'CBR', 200, 'Black', 5000, 2, 2);


INSERT INTO Car (ID, Model, Weight, Color, Price, Category_ID, Manufacturer_ID)
VALUES ('B002', 'R1', 250, 'Blue', 6000, 2, 1);


INSERT INTO Car (ID, Model, Weight, Color, Price, Category_ID, Manufacturer_ID)
VALUES ('B003', 'Ninja', 300, 'Red', 7000, 2, 2);


INSERT INTO Car (ID, Model, Weight, Color, Price, Category_ID, Manufacturer_ID)
VALUES ('T001', 'Tundra', 3000, 'White', 30000, 3, 1);


INSERT INTO Car (ID, Model, Weight, Color, Price, Category_ID, Manufacturer_ID)
VALUES ('T002', 'Tacoma', 2500, 'Black', 25000, 3, 1);

-- ######################################################

INSERT INTO Credentials (Username, Password)
VALUES ('admin', 'admin');

INSERT INTO Credentials (Username, Password)
VALUES ('enerik', 'enerik');


INSERT INTO Credentials (Username, Password)
VALUES ('kwstas', 'kwstas');


INSERT INTO Credentials (Username, Password)
VALUES ('marios', 'marios');


INSERT INTO Credentials (Username, Password)
VALUES ('giwrgos', 'giwrgos');



-- ######################################################

INSERT INTO Salesperson (Name, Email, Credentials_ID)
VALUES ('John Wick', 'jwicl@cs.ihu.gr', 1);


INSERT INTO Salesperson (Name, Email, Credentials_ID)
VALUES ('kwstas damianos', 'kwstas@cs.ihu.gr', 2);

INSERT INTO Salesperson (Name, Email, Credentials_ID)
VALUES ('Enerik Kotsi', 'enerik@cs.ihu.gr', 3);

INSERT INTO Salesperson (Name, Email, Credentials_ID)
VALUES ('Marios Plenchidis', 'marios@cs.ihu.gr', 4);

INSERT INTO Salesperson (Name, Email, Credentials_ID)
VALUES ('John Jogb', 'john@cs.ihu.gr', 5);




-- ######################################################

INSERT INTO Customer (Name, Date_Registered)
VALUES ('John Doe', '2020-01-01');


INSERT INTO Customer (Name, Date_Registered)
VALUES ('Jane Smith', '2020-01-02');

INSERT INTO Customer (Name, Date_Registered)
VALUES ('John Lat', '2020-01-03');


INSERT INTO Customer (Name, Date_Registered)
VALUES ('George Smith', '2020-01-04');


INSERT INTO Customer (Name, Date_Registered)
VALUES ('George Georgiou', '2020-01-05');




-- ######################################################

INSERT INTO Sale (Car_ID, Customer_ID, Salesperson_ID, Date)
VALUES ('C001', 1, 1, '2020-01-01');


INSERT INTO Sale (Car_ID, Customer_ID, Salesperson_ID, Date)
VALUES ('C002', 1, 1, '2020-01-02');


INSERT INTO Sale (Car_ID, Customer_ID, Salesperson_ID, Date)
VALUES ('T002', 2, 1, '2020-01-03');


INSERT INTO Sale (Car_ID, Customer_ID, Salesperson_ID, Date)
VALUES ('C003', 2, 2, '2023-01-02');


INSERT INTO Sale (Car_ID, Customer_ID, Salesperson_ID, Date)
VALUES ('T002', 3, 3, '2023-01-04');

-- ######################################################

INSERT INTO Spare_Part (Name, Price)
VALUES ('Tire', 100);


INSERT INTO Spare_Part (Name, Price)
VALUES ('Engine', 1000);


INSERT INTO Spare_Part (Name, Price)
VALUES ('Brake', 200);

INSERT INTO Spare_Part (Name, Price)
VALUES ('wheel', 50);


INSERT INTO Spare_Part (Name, Price)
VALUES ('Battery', 1200);

-- ######################################################

INSERT INTO Sale_Misc (Spare_Part_ID, Customer_ID, Salesperson_ID, Date)
VALUES (1, 1, 1, '2020-01-01');


INSERT INTO Sale_Misc (Spare_Part_ID, Customer_ID, Salesperson_ID, Date)
VALUES (2, 1, 1, '2020-01-02');

INSERT INTO Sale_Misc (Spare_Part_ID, Customer_ID, Salesperson_ID, Date)
VALUES (4, 3, 1, '2020-01-01');


INSERT INTO Sale_Misc (Spare_Part_ID, Customer_ID, Salesperson_ID, Date)
VALUES (2, 3, 1, '2020-01-02');


INSERT INTO Sale_Misc (Spare_Part_ID, Customer_ID, Salesperson_ID, Date)
VALUES (1, 1, 1, '2020-01-01');
