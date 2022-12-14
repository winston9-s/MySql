use project3

insert into SalesTransaction values
--SalesTransactionID, StaffID,CustomerID,TransactionDate
('SL001', 'SF001', 'CS001', '2020-05-02'),
('SL002', 'SF002', 'CS002', '2020-04-12'),
('SL003', 'SF003', 'CS003', '2020-03-22'),
('SL004', 'SF004', 'CS004', '2020-02-03'),
('SL005', 'SF005', 'CS005', '2020-01-13'),
('SL006', 'SF006', 'CS006', '2019-12-23'),
('SL007', 'SF007', 'CS007', '2019-11-26'),
('SL008', 'SF008', 'CS008', '2019-10-16'),
('SL009', 'SF009', 'CS009', '2019-09-06'),
('SL010', 'SF010', 'CS010', '2018-08-25'),
('SL011', 'SF011', 'CS011', '2018-07-15'),
('SL012', 'SF012', 'CS012', '2018-06-05'),
('SL013', 'SF013', 'CS013', '2018-05-24'),
('SL014', 'SF014', 'CS014', '2017-04-14'),
('SL015', 'SF015', 'CS015', '2017-03-04')

insert into SalesTransactionDetail values
--SalesTransactionDetailID, SalesTransactionID, SoftwareID, Quantity
('SL015', 'SW001', 2),
('SL003', 'SW001', 4),
('SL015', 'SW002', 6),
('SL014', 'SW003', 8),
('SL013', 'SW003', 10),
('SL014', 'SW004', 12),
('SL012', 'SW005', 14),
('SL012', 'SW005', 16),
('SL010', 'SW006', 18),
('SL011', 'SW007', 20),
('SL010', 'SW007', 22),
('SL009', 'SW008', 24),
('SL009', 'SW009', 5),
('SL008', 'SW009', 7),
('SL007', 'SW010', 11),
('SL007', 'SW011', 3),
('SL006', 'SW011', 9),
('SL006', 'SW012', 13),
('SL005', 'SW013', 17),
('SL004', 'SW013', 15),
('SL004', 'SW014', 19),
('SL003', 'SW015', 21),
('SL002', 'SW015', 23),
('SL002', 'SW014', 10),
('SL001', 'SW012', 13)

SELECT * FROM SalesTransactionDetail

insert into PurchaseTransaction values
--PurchaseTransactionID, StaffID, DistributorID, TransactionDate, SoftwareBought, Quantity
('PR001', 'SF001', 'DT001', '2020-05-01', 2, 10),
('PR002', 'SF002', 'DT002', '2020-04-11', 4, 13),
('PR003', 'SF003', 'DT003', '2020-03-21', 5 , 17),
('PR004', 'SF004', 'DT004', '2020-02-02', 7 , 9),
('PR005', 'SF005', 'DT005', '2020-01-12', 2 , 10),
('PR006', 'SF006', 'DT006', '2019-12-22', 4 , 14),
('PR007', 'SF007', 'DT007', '2019-10-03', 5 , 17),
('PR008', 'SF008', 'DT008', '2019-08-13', 8 , 17),
('PR009', 'SF009', 'DT009', '2019-06-30', 2 , 15),
('PR010', 'SF010', 'DT010', '2018-04-23', 4 , 8),
('PR011', 'SF011', 'DT011', '2018-02-05', 1 , 9),
('PR012', 'SF012', 'DT012', '2017-11-16', 10 , 18),
('PR013', 'SF013', 'DT013', '2017-09-27', 5 , 17),
('PR014', 'SF014', 'DT014', '2017-07-29', 3 , 16),
('PR015', 'SF015', 'DT015', '2018-05-08', 6 , 20)