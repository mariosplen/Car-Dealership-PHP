CREATE TABLE IF NOT EXISTS Category (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(45) NOT NULL,
    Number_Of INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Manufacturer(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(45) NOT NULL,
    Country VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS Car(
    ID CHAR(4) PRIMARY KEY,
    Model VARCHAR(45) NOT NULL,
    Weight INT(4) NOT NULL,
    Color VARCHAR(12) NOT NULL,
    Price FLOAT NOT NULL,
    Category_ID INT NOT NULL,
    Manufacturer_ID INT NOT NULL,
    FOREIGN KEY (Category_ID) REFERENCES Category(ID) ON DELETE CASCADE,
    FOREIGN KEY (Manufacturer_ID) REFERENCES Manufacturer(ID)
);

CREATE TABLE IF NOT EXISTS Credentials (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(45) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Salesperson (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(45),
    Email VARCHAR(255) NOT NULL UNIQUE,
    Credentials_ID INT NOT NULL UNIQUE,
    FOREIGN KEY (Credentials_ID) REFERENCES Credentials(ID)
);

CREATE TABLE IF NOT EXISTS Customer (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(45) NOT NULL,
    Date_Registered DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Sale (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Car_ID CHAR(4) NOT NULL,
    Customer_ID INT NOT NULL,
    Salesperson_ID INT NOT NULL,
    Date DATE NOT NULL,
    FOREIGN KEY (Car_ID) REFERENCES Car(ID) ON DELETE CASCADE,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(ID),
    FOREIGN KEY (Salesperson_ID) REFERENCES Salesperson(ID)
);

CREATE TABLE IF NOT EXISTS Spare_Part (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(45) NOT NULL,
    Price FLOAT NOT NULL
);

CREATE TABLE IF NOT EXISTS Sale_Misc (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Spare_Part_ID INT NOT NULL,
    Customer_ID INT NOT NULL,
    Salesperson_ID INT NOT NULL,
    Date DATE NOT NULL,
    FOREIGN KEY (Spare_Part_ID) REFERENCES Spare_Part(ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(ID),
    FOREIGN KEY (Salesperson_ID) REFERENCES Salesperson(ID)
);


-- Auto update number of vehicle models per category
-- ######################################################

CREATE TRIGGER update_category_increase
    AFTER INSERT ON Car
    FOR EACH ROW
    UPDATE Category SET Number_Of = Number_Of + 1 WHERE ID = NEW.Category_ID;

CREATE TRIGGER update_category_decrease
    AFTER DELETE ON Car
    FOR EACH ROW
    UPDATE Category SET Number_Of = Number_Of - 1 WHERE ID = OLD.Category_ID;