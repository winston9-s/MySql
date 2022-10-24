use project3
--1
select SoftwareName,
	[Income] = 'Rp. ' + CAST(SUM(Quantity) as varchar)
from SoftwareType JOIN Software ON SoftwareType.SoftwareTypeID=Software.SoftwareTypeID 
	JOIN SalesTransactionDetail ON Software.SoftwareID=SalesTransactionDetail.SoftwareID
where SoftwareTypeName in ('Browser','Web Development') AND SoftwareStock > 10
group by SoftwareName

--2
select DistributorCompany, 
	[Total Software Bought] = CAST(SUM(std.Quantity) AS VARCHAR)
from Distributor d JOIN PurchaseTransaction pt ON d.DistributorID=pt.DistributorID
	JOIN SalesTransaction st ON pt.StaffID=st.StaffID
	JOIN SalesTransactionDetail std ON st.SalesTransactionID=std.SalesTransactionID
where DistributorName like 'A%' AND DAY(pt.TransactionDate) > 10
group by DistributorCompany

--3
select 
[Avarage revenue per day] = 'Rp. ' + CAST( AVG(SoftwarePrice*Quantity) as varchar), TransactionDate,
[Male Staff Count] = CAST(COUNT(DISTINCT(StaffGender))AS VARCHAR) + ' Person'
from
Software JOIN SalesTransactionDetail ON Software.SoftwareID = SalesTransactionDetail.SoftwareID 
JOIN SalesTransaction ON SalesTransactionDetail.SalesTransactionID=SalesTransaction.SalesTransactionID
JOIN Staff ON SalesTransaction.StaffID = Staff.StaffID
where 
StaffGender = 'Male' AND year(TransactionDate) = '2018'
Group by TransactionDate

--4
Select [Gender] = LEFT(StaffGender,1), 
	[Total Transactions] = Convert(Varchar,Count(SalesTransaction.SalesTransactionID)) + ' transaction(s)', 
[Total Sold] = Convert(Varchar, Sum(Quantity)) + ' item(s)' 
FROM Software JOIN SalesTransactionDetail ON Software.SoftwareID = SalesTransactionDetail.SoftwareID
	JOIN SalesTransaction ON SalesTransactionDetail.SalesTransactionID = SalesTransaction.SalesTransactionID
	JOIN Staff ON SalesTransaction.StaffID = Staff.StaffID
Where StaffGender = 'Male' And (SoftwarePrice* Quantity) >= 100000
Group By StaffGender Union
Select Gender = LEFT(StaffGender,1), [Total Transactions] = Convert(Varchar, Count(SalesTransaction.SalesTransactionID)) + ' transaction(s)', 
[Total Sold] =  
Convert(Varchar, Sum(Quantity)) + ' item(s)' 
From Software JOIN SalesTransactionDetail ON Software.SoftwareID = SalesTransactionDetail.SoftwareID
	JOIN SalesTransaction ON SalesTransactionDetail.SalesTransactionID = SalesTransaction.SalesTransactionID
	JOIN Staff ON SalesTransaction.StaffID = Staff.StaffID
Where StaffGender = 'Female' And (SoftwarePrice* Quantity) >= 200000 
Group By StaffGender

--5
select sw.SoftwareID, sw.SoftwareName,
	[Total] = CONCAT ('Rp.' , Sum(SoftwarePrice))
from Software sw join SalesTransaction st on sw.SoftwareID = st.CustomerID
	join Staff sf on sf.StaffID = st.StaffID, 
	(select AVG_Price = AVG (SoftwarePrice) from Software) as tmpSoftware
where SoftwarePrice > tmpSoftware.AVG_Price AND sf.StaffID in ('SF003','SF004','SF009')
group by sw.SoftwareID, sw.SoftwareName
order by Sum(SoftwarePrice) desc

--6
select 
[Staff First Name] = SUBSTRING (StaffName,1,CHARINDEX(' ',StaffName,1)),
StaffPhone,
[TransactionDate] = CONVERT(VARCHAR,TransactionDate,106)
from
Staff s JOIN SalesTransaction st ON s.StaffID = st.StaffID
JOIN (select std.SalesTransactionID from SalesTransactionDetail std
	Group by SalesTransactionID
	Having SUM(Quantity) < (select AVG(Quantity) from SalesTransactionDetail) ) AS std on std.SalesTransactionID = st.SalesTransactionID
where st.TransactionDate < '2019-01-01'

--7S
SELECT PurchaseTransactionID,
	CASE CHARINDEX(' ', REVERSE(D.DistributorName)) WHEN 0 THEN CONCAT('Mx. ',D.DistributorName) ELSE
	CONCAT('Mx. ',RIGHT(D.DistributorName, CHARINDEX(' ', REVERSE(D.DistributorName)))) END AS [Distributor Last Name],
	DistributorCompany,
	CONVERT(VARCHAR, ptr.TransactionDate, 107) AS TransactionDate
FROM PurchaseTransaction ptr JOIN Distributor d ON ptr.DistributorID = d.DistributorID
	join Staff s ON ptr.StaffID = s.StaffID
	join SalesTransaction st ON s.StaffID =st.StaffID
	join SalesTransactionDetail std ON st.SalesTransactionID = std.SalesTransactionID
	join Software sf ON std.SoftwareID=sf.SoftwareID
WHERE SoftwarePrice>(select AVG(SoftwarePrice) from Software) and
	SoftwarePrice<(select MAX(SoftwarePrice) from Software) and 
	year(ptr.TransactionDate) BETWEEN '2017' AND '2018'

--8
select d.DistributorName, pt.TransactionDate, concat(count(pt.PurchaseTransactionID),' transaction(s)')
from Distributor d join PurchaseTransaction pt on d.DistributorID = pt.DistributorID
join Staff s on pt.StaffID = s.StaffID
join SalesTransaction st on s.StaffID = st.StaffID
join SalesTransactionDetail std on st.SalesTransactionID=std.SalesTransactionID
join Software sw on std.SoftwareID = sw.SoftwareID
, (select [sv] = avg(cast(SoftwareVersion as float)) from Software) as soft
where cast(sw.SoftwareVersion as float) > soft.sv and d.DistributorID in ('DT001', 'DT005', 'DT006')
group by d.DistributorName, pt.TransactionDate

--9
CREATE VIEW StaffSalesReport AS
SELECT StaffName,
  StaffGender,
  [Total Transactions] = COUNT(st.SalesTransactionID),
  [Total Sales Income] = 'IDR' + CAST(SUM(Quantity * SoftwarePrice) AS VARCHAR)

FROM Staff s
  JOIN SalesTransaction st ON s.StaffID=st.StaffID 
  JOIN SalesTransactionDetail std ON st.SalesTransactionID=std.SalesTransactionID
  JOIN Software sw ON std.SoftwareID = sw.SoftwareID

WHERE LEN(StaffName)>3
GROUP BY
 StaffName,
 StaffGender 

HAVING
 SUM(Quantity * SoftwarePrice)>10000


--10
CREATE VIEW [RecurringMembers] AS
SELECT c.CustomerName,
  [Total Transactions] = COUNT(st.SalesTransactionID),
  [Total Spent] = 'IDR' + Cast(SUM(std.Quantity * sw.SoftwarePrice) AS VARCHAR)
FROM Customer c 
  JOIN SalesTransaction st ON c.CustomerID=st.CustomerID 
  JOIN SalesTransactionDetail std ON st.SalesTransactionID=std.SalesTransactionID
  JOIN Software sw ON std.SoftwareID = sw.SoftwareID
Where sw.SoftwarePrice > 50000
GROUP BY CustomerName
HAVING
 COUNT(st.SalesTransactionID)>2

SELECT * FROM RecurringMembers