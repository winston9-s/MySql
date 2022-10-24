USE LOmian

--Case 1
-- Purchase Simulation
-- Employee/staff ID = EM001 (Alvin Timothy)
-- Purchase ID = PU016
-- Date = 2021-06-05

-- Purchase Ingredient |  Quantity  
------------------------------------
-- 1. Mie kuning       |   5		
-- 2. Sawi putih	   |   5		
-- 3. Daging sapi      |   10		
-- 4. Bawang putih     |   10		

--Before purchase ingredients
SELECT i.Ingredient_ID, Ingredient_Name, [Total Quantity] = SUM(Purchase_Quantity) FROM Purchase_Transaction_Header pth
JOIN Purchase_Transaction_Detail ptd
ON pth.PurchaseTransaction_ID = ptd.PurchaseTransaction_ID
JOIN Ingredient i
ON ptd.Ingredient_ID = i.Ingredient_ID
WHERE Ingredient_Name IN('mie kuning', 'sawi putih', 'daging sapi', 'bawang putih')
GROUP BY i.Ingredient_ID, Ingredient_Name

--SELECT * FROM Purchase_Transaction_Header

--Purchase Simulation
INSERT INTO Purchase_Transaction_Header VALUES
('PU016', 'EM001', 'SU003', '2021-06-05')

--SELECT * FROM Purchase_Transaction_Header

--SELECT * FROM Purchase_Transaction_Detail

INSERT INTO Purchase_Transaction_Detail VALUES
('PU016', 'IN008', 5),
('PU016', 'IN009', 5),
('PU016', 'IN010', 10),
('PU016', 'IN012', 10)



--SELECT * FROM Purchase_Transaction_Detail


--After purchase ingredients 
SELECT i.Ingredient_ID, Ingredient_Name, [Total Quantity] = SUM(Purchase_Quantity) FROM Purchase_Transaction_Header pth
JOIN Purchase_Transaction_Detail ptd
ON pth.PurchaseTransaction_ID = ptd.PurchaseTransaction_ID
JOIN Ingredient i
ON ptd.Ingredient_ID = i.Ingredient_ID
WHERE Ingredient_Name IN('mie kuning', 'sawi putih', 'daging sapi', 'bawang putih')
GROUP BY i.Ingredient_ID, Ingredient_Name

--Purchase Transaction History for 2021-06-05
SELECT e.Employee_ID, Employee_Name, PurchaseTransaction_Date, i.Ingredient_ID, Ingredient_Name, [Total Quantity] = SUM(Purchase_Quantity), [Total Price] = 'Rp. ' + CAST((SUM(Purchase_Quantity)*Ingredient_Price) AS VARCHAR) FROM Ingredient i
JOIN Purchase_Transaction_Detail ptd
ON i.Ingredient_ID = ptd.Ingredient_ID
JOIN Purchase_Transaction_Header pth
ON ptd.PurchaseTransaction_ID = pth.PurchaseTransaction_ID
JOIN Employees e
ON e.Employee_ID = pth.Employee_ID
WHERE e.Employee_ID = 'EM001' AND PurchaseTransaction_Date = '2021-06-05'
GROUP BY e.Employee_ID, Employee_Name, PurchaseTransaction_Date, i.Ingredient_ID, Ingredient_Name, Ingredient_Price



--Case 2
-- Sales Simulation
-- Employee/staff ID = EM002 (Barry)
-- Sales ID = TR016
-- Date = 2021-03-01

-- Noodle Sales		   |  Quantity
------------------------------------
-- 1. Tom Yam Noodle   |   10		
-- 2. Italian Noodle   |   20		
-- 3. Ifu Noodle       |   20		


--Before noodle sales at 2021-03-01
SELECT n.Noodle_ID, Noodle_Name, [Total Quantity] = SUM(Sales_Quantity) FROM Sales_Transaction_Header sth
JOIN Sales_Transaction_Detail std
ON sth.SalesTransaction_ID = std.SalesTransaction_ID
JOIN Noodle n
ON std.Noodle_ID = n.Noodle_ID
WHERE Noodle_Name IN('Tom Yam Noodle', 'Italian Noodle', 'Ifu Noodle')
GROUP BY n.Noodle_ID, Noodle_Name

SELECT * FROM Sales_Transaction_Header
--Sales Simulation
INSERT INTO Sales_Transaction_Header VALUES
('TR016', 'EM002', 'CU001', '2021-03-01')
SELECT * FROM Sales_Transaction_Header

SELECT * FROM Sales_Transaction_Detail
INSERT INTO Sales_Transaction_Detail VALUES
('TR016', 'NO007', 10),
('TR016', 'NO013', 20),
('TR016', 'NO014', 20)
SELECT * FROM Sales_Transaction_Detail


--After noodle sales at 2021-03-01
SELECT n.Noodle_ID, Noodle_Name, [Total Quantity] = SUM(Sales_Quantity) FROM Sales_Transaction_Header sth
JOIN Sales_Transaction_Detail std
ON sth.SalesTransaction_ID = std.SalesTransaction_ID
JOIN Noodle n
ON std.Noodle_ID = n.Noodle_ID
WHERE Noodle_Name IN('Tom Yam Noodle', 'Italian Noodle', 'Ifu Noodle')
GROUP BY n.Noodle_ID, Noodle_Name

--Sales Transaction History for 2021-03-01
SELECT e.Employee_ID, Employee_Name, SalesTransaction_Date, n.Noodle_ID, Noodle_Name, [Total Quantity] = SUM(Sales_Quantity), [Total Price] = 'Rp. ' + CAST((SUM(Sales_Quantity)*Noodle_Price) AS VARCHAR) FROM Noodle n
JOIN Sales_Transaction_Detail std
ON n.Noodle_ID = std.Noodle_ID
JOIN Sales_Transaction_Header sth
ON std.SalesTransaction_ID = sth.SalesTransaction_ID
JOIN Employees e
ON e.Employee_ID = sth.Employee_ID
WHERE e.Employee_ID = 'EM002' AND SalesTransaction_Date = '2021-03-01'
GROUP BY e.Employee_ID, Employee_Name, SalesTransaction_Date, n.Noodle_ID, Noodle_Name, Noodle_Price
