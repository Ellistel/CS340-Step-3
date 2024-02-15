SET FOREIGN_KEY_CHECKS=0;
SET AUTOCOMMIT = 0;

-- Customers table
CREATE OR REPLACE TABLE Customers (
    customerID INT AUTO_INCREMENT PRIMARY KEY,
    customerName VARCHAR(50) NOT NULL,
    customerContact VARCHAR(150) NOT NULL
);

-- FFLs table
CREATE OR REPLACE TABLE FFLs (
    fflicenseID INT AUTO_INCREMENT PRIMARY KEY,
    fflName VARCHAR(50) NOT NULL,
    fflContact VARCHAR(150) NOT NULL
);

-- Firearms table
CREATE OR REPLACE TABLE Firearms (
    firearmID INT AUTO_INCREMENT PRIMARY KEY,
    price DECIMAL(19,2),
    model VARCHAR(50),
    inventoryStock INT NOT NULL,
    countryOfOrigin VARCHAR(20),
    caliber VARCHAR(20),
    historicDetail VARCHAR(150)
);

-- Transactions table
CREATE OR REPLACE TABLE Transactions (
    transactionID INT AUTO_INCREMENT PRIMARY KEY,
    fflicenseID INT,
    customerID INT NOT NULL,
    saleAmount DECIMAL(19,2),
    saleDate DATE,
    FOREIGN KEY (fflicenseID) REFERENCES FFLs(fflicenseID) ON DELETE CASCADE,
    FOREIGN KEY (customerID) REFERENCES Customers(customerID) ON DELETE CASCADE
);

-- Transactions_Firearms table
CREATE OR REPLACE TABLE Transactions_Firearms (
    transactionsFirearmsID INT AUTO_INCREMENT PRIMARY KEY,
    transactionID INT NOT NULL,
    firearmID INT NOT NULL,
    orderQty INT,
    unitPrice DECIMAL(19,2),
    lineTotal DECIMAL(19,2),
    FOREIGN KEY (transactionID) REFERENCES Transactions(transactionID) ON DELETE CASCADE,
    FOREIGN KEY (firearmID) REFERENCES Firearms(firearmID) ON DELETE CASCADE
);

--Below are the insert Statements:
INSERT INTO `Customers`(`customerName`,`customerContact`) VALUES
('Philip Mckinley','Phil1489@gmail.com'),
('Richard Fole', 'RF@hotmail.com'),
('Anthony Weaver', 'Anthony23@yahoo.com'),
('Isaac Waters', 'IsaacW365@gmail.com'),
('Justin Nichols', 'goutlander324@gmail.com');


INSERT INTO `FFLs`(`fflName`,`fflContact`) VALUES
('Elijah Payne','Ep@hotmail.com'),
('Hans Johnston', 'hans@hansdomain.com'),
('Richard Folawfdfs', 'DickFola@aol.com');

INSERT INTO `Transactions`(`customerID`, `fflicenseID`, `saleAmount`, `saleDate`) VALUES
(1,1,1550.00,'2023-08-02'),
(4,2,949.99,'2023-08-04'),
(3,3,500.00,'2025-01-02');

INSERT INTO `Firearms`(`price`, `model`, `countryOfOrigin`, `caliber`, `historicDetail`, `inventoryStock`) VALUES
(1550.00,'VOPO P08 LUGER PISTOL', 'EAST GERMANY', '9x19mm Parabellum', 'WWI - WWII manufactured Lugers refurbished post war by the East German police.', 250),
(250.00, 'M91 Carcano Carbine', 'Italy', '6.5x52mm Carcano', 'Main Infantry rifle of Facist Italy. Manufacture dates range from 1900 - 1945.',1150),
(699.99, 'M93 Lebel rifle', 'France', '8mm Lebel', 'Infantry Rifle adopted by France in 1886, and the first rifle to use smokeless powder ammunition', 10);

INSERT INTO `Transactions_Firearms`(`transactionID`, `firearmID`, `orderQty`, `unitPrice`, `lineTotal`) VALUES
(1,1,1,1550.00,1550.00),
(2,2,1,250.00,250.00),
(2,3,1,699.99,699.99),
(3,2,2,250.00,500.00);

SELECT * From `Customers`;
SELECT * From `FFLs`;
SELECT * From `Transactions`;
SELECT * From `Firearms`;
SELECT * From `Transactions_Firearms`;



SET FOREIGN_KEY_CHECKS=1;
COMMIT;