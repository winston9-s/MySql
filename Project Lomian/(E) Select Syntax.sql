--e
--1
SELECT e.Employee_Name, c.Customer_Name, [Transaction_Date]=CONVERT(VARCHAR, sth.SalesTransaction_Date, 107), [Transaction Count] = COUNT(SalesTransaction_ID)
FROM Employees e 
JOIN Sales_Transaction_Header sth 
ON e.Employee_ID = sth.Employee_ID
JOIN Customer c 
ON sth.Customer_ID = c.Customer_ID
WHERE Employee_Name like '% %' AND Employee_Gender = 'Female'
GROUP BY e.Employee_Name, c.Customer_Name, sth.SalesTransaction_Date

--2
select Ingredient_Name, Ingredient_Price = 'Rp.' + CAST(Ingredient_Price as varchar), Purchase_Quantity = CAST(SUM(Purchase_Quantity) as varchar) + ' Items(s)', [SupplierName] = UPPER(Supplier_Name)
from Ingredient i join Purchase_Transaction_Detail ptd on ptd.Ingredient_ID = i.Ingredient_ID join Purchase_Transaction_Header pth on pth.PurchaseTransaction_ID = ptd.PurchaseTransaction_ID join Supplier s on s.Supplier_ID = pth.Supplier_ID
where Purchase_Quantity < 5
group by i.Ingredient_ID, i.Ingredient_Name, i.Ingredient_Price, s.Supplier_Name
having COUNT(ptd.Ingredient_ID) > 5

--3
select Noodle.Noodle_Name, Noodle.Noodle_Price, Cast(COUNT(noodle_name) as Varchar) + ' transaction' as 'TransactionCount', [Total_Quantity] = CAST(SUM(Sales_Quantity) AS VARCHAR) + ' Qty(s)',
[Total_Price] = 'Rp. ' + CAST((SUM(Sales_Quantity) * Noodle_Price) AS VARCHAR)
from Noodle join Sales_Transaction_Detail std on Noodle.Noodle_ID = std.Noodle_ID join Sales_Transaction_Header sth on sth.SalesTransaction_ID = std.SalesTransaction_ID
where DAY(sth.SalesTransaction_Date) > 20
group by Noodle_Name, Noodle_Price
having COUNT(sth.SalesTransaction_ID) > 5

--4
SELECT Ingredient_Name, [Ingredient_Price] = 'Rp. ' + CAST(Ingredient_Price AS VARCHAR), [Purchase_Count] = CAST(COUNT(ptd.PurchaseTransaction_ID) AS VARCHAR) + ' Purchase(s)', [Total Quantity] =  CAST(SUM(ptd.Purchase_Quantity) AS VARCHAR) + ' Qty(s)', [Total_Price] = 'Rp. ' + CAST((Purchase_Quantity * Ingredient_Price) AS VARCHAR)
FROM Ingredient ing 
	JOIN Purchase_Transaction_Detail ptd  
ON ing.Ingredient_ID = ptd.Ingredient_ID
	JOIN Purchase_Transaction_Header pth 
ON ptd.PurchaseTransaction_ID = pth.PurchaseTransaction_ID
WHERE MONTH(PurchaseTransaction_Date) = 11 AND 
Ingredient_Price BETWEEN 20000 AND 30000
GROUP BY ing.Ingredient_Name, ing.Ingredient_Price, ptd.Purchase_Quantity

--5
SELECT [NoodleID] = REPLACE(Noodle_ID, 'NO', 'Noodle '), Noodle_Name, [Noodle Price] = 'Rp. ' + CAST(Noodle_Price AS VARCHAR)
FROM Noodle,
	(SELECT AVG(Noodle_Price) as avgnoodle_price
	FROM Noodle 
	JOIN Sales_Transaction_Detail std 
	ON std.Noodle_ID = Noodle.Noodle_ID 
	JOIN Sales_Transaction_Header sth 
	ON sth.SalesTransaction_ID = std.SalesTransaction_ID
	WHERE DATENAME(WEEKDAY, SalesTransaction_Date) = 'Wednesday') AS AVG_Noodle_Price
WHERE Noodle_Price > AVG_Noodle_Price.avgnoodle_price

--6
SELECT [TransactionDate]=CONVERT(VARCHAR, sth.SalesTransaction_Date, 107), Employee_Name, Sales_Quantity
FROM Employees join Sales_transaction_header sth on sth.Employee_ID = Employees.Employee_ID join Sales_Transaction_Detail std on std.SalesTransaction_ID = sth.SalesTransaction_ID ,
    (SELECT AVG(Sales_Quantity) as avg_quant
    FROM Noodle n
    JOIN Sales_Transaction_Detail std 
    ON std.Noodle_ID = n.Noodle_ID 
    JOIN Sales_Transaction_Header sth 
    ON sth.SalesTransaction_ID = std.SalesTransaction_ID
    WHERE DAY(sth.SalesTransaction_Date) > 19 AND 
    DAY(sth.SalesTransaction_Date)< 25) AS avg_quantity
where std.Sales_Quantity < avg_quantity.avg_quant


--7
select Ingredient_ID = REPLACE(Ingredient_ID,'IN','Ingredient '), Ingredient_Name, Ingredient_Price
From Ingredient, (select [MinimPrice] = MIN(Ingredient_Price)  from ingredient) as MINPRICE, (select [avgPrice] = AVG(Ingredient_Price) from ingredient join Purchase_Transaction_Detail ptd on ptd.Ingredient_ID = Ingredient.Ingredient_ID join Purchase_Transaction_Header pth on pth.PurchaseTransaction_ID = ptd.PurchaseTransaction_ID where MONTH(purchaseTransaction_Date) = 10) as AVGPRICE
where Ingredient_Price > MINPRICE.MinimPrice and Ingredient_Price < AVGPRICE.avgPrice AND Ingredient_Name LIKE '% %'

--8
select Convert(Varchar,SalesTransaction_Date,107) as TransactionDate, NoodleTypeName, [Total Transaction] = CAST(COUNT(sth.SalesTransaction_ID) AS VARCHAR) + ' Transaction(s)'
from Sales_Transaction_Header sth join Sales_Transaction_Detail std on sth.SalesTransaction_ID = std.SalesTransaction_ID join Noodle n on n.Noodle_ID = std.Noodle_ID join NoodleType nt on nt.NoodleType_ID = n.NoodleType_ID, 
(select max(Sales_Quantity) as quantmax from Sales_Transaction_Detail join Sales_Transaction_Header on Sales_Transaction_Detail.SalesTransaction_ID = Sales_Transaction_Header.SalesTransaction_ID where DATENAME(Weekday,SalesTransaction_Date) in ('Friday','wednesday')) as maxquant
where Sales_Quantity < maxquant.quantmax
group by sth.SalesTransaction_Date, NoodleTypeName
order by SalesTransaction_Date, NoodleTypeName

--9
create view CustomerRecord 
As
select Customer_ID = REPLACE(c.Customer_ID, 'CU', 'Customer '), Customer_Name, COUNT(sth.SalesTransaction_ID) as 'TransactionCount', SUM(std.Sales_Quantity) as 'QuantityBought'
from Customer c join Sales_Transaction_Header sth on sth.Customer_ID = c.Customer_ID join Sales_Transaction_Detail std on std.SalesTransaction_ID = sth.SalesTransaction_ID 
where SUBSTRING(c.Customer_Name,CHARINDEX(' ',c.Customer_Name)+1,1) = 'h'
group by c.Customer_ID, Customer_Name
having sum(std.sales_quantity) > 10

--select * from CustomerRecord

--10
create view NoodleRecord
as
select [TransactionDate] = CONVERT(varchar,SalesTransaction_Date,107), Noodle_Name = LOWER(REPLACE(Noodle_Name,'Noodle','Mian')), Noodle_Price = 'Rp.'+ Cast((Noodle_Price-((20*Noodle_Price)/100)) as varchar), 'Quantity_Bought' = CAST(SUM(Sales_Quantity) AS VARCHAR) + ' Qty(s)'
from Sales_Transaction_Header sth join Sales_Transaction_Detail std on sth.SalesTransaction_ID = std.SalesTransaction_ID join Noodle n on n.Noodle_ID = std.Noodle_ID 
group by SalesTransaction_Date, Noodle_Name, Noodle_Price
having COUNT(std.SalesTransaction_ID) < 5 and SUM(Sales_Quantity) > 10

--select * from NoodleRecord