-- Populate table for customers.html when page loads
SELECT * FROM Customers;

-- When user inserts into Customers
INSERT INTO Customers(customerName, customerContact) VALUES (:customerName_input, :customerContact_input);

-- Update Customer
UPDATE Customers SET customerName = :new_customerName, customerContact = :new_customerContact WHERE customerID = :customerID;

-- Delete Customer
DELETE FROM Customers WHERE customerID = :customerID;

-- Populate table FFLS.html when page loads
SELECT * FROM FFLs;

-- When user inserts into FFLs
INSERT INTO FFLs(fflName, fflContact) VALUES (:fflName_input, :fflContact_input);

-- Update FFL
UPDATE FFLs SET fflName = :new_fflName, fflContact = :new_fflContact WHERE fflicenseID = :fflicenseID;

-- Delete FFL
DELETE FROM FFLs WHERE fflicenseID = :fflicenseID;

-- Populate table transactions.html when page loads
SELECT * FROM Transactions;

-- When user inserts into Transactions
INSERT INTO Transactions(fflicenseID, customerID, saleAmount, saleDate) VALUES (:fflicenseID_input, :customerID_input, :saleAmount_input, :saleDate_input);

-- Update Transaction
UPDATE Transactions SET fflicenseID = :new_fflicenseID, customerID = :new_customerID, saleAmount = :new_saleAmount, saleDate = :new_saleDate WHERE transactionID = :transactionID;

-- Delete Transaction
DELETE FROM Transactions WHERE transactionID = :transactionID;

-- Populate table firearms.html when page loads
SELECT * FROM Firearms;

-- When user inserts into Firearms
INSERT INTO Firearms(price, model, inventoryStock, countryOfOrigin, caliber, historicDetail) VALUES (:price_input, :model_input, :inventoryStock_input, :countryOfOrigin_input, :caliber_input, :historicDetail_input);

-- Update Firearms
UPDATE Firearms SET price = :new_price, model = :new_model, inventoryStock = :new_inventoryStock, countryOfOrigin = :new_countryOfOrigin, caliber = :new_caliber, historicDetail = :new_historicDetail WHERE firearmID = :firearmID;

-- Delete Firearms
DELETE FROM Firearms WHERE firearmID = :firearmID;


-- Populate table for the intersection table when the html when page loads
SELECT * FROM Transactions_Firearms;

-- When user inserts into Transactions_Firearms
INSERT INTO Transactions_Firearms(transactionID, firearmID, orderQty, unitPrice, lineTotal) VALUES (:transactionID_input, :firearmID_input, :orderQty_input, :unitPrice_input, :lineTotal_input);

-- Update Transactions_Firearms
UPDATE Transactions_Firearms SET transactionID = :new_transactionID, firearmID = :new_firearmID, orderQty = :new_orderQty, unitPrice = :new_unitPrice, lineTotal = :new_lineTotal WHERE transactionsFirearmsID = :transactionsFirearmsID;

-- Delete Transactions_Firearms
DELETE FROM Transactions_Firearms WHERE transactionsFirearmsID = :transactionsFirearmsID;

-- Select Search Query for Transactions_Firearms Table
SELECT * FROM transaction_firearm WHERE transaction_id = :transaction_id;