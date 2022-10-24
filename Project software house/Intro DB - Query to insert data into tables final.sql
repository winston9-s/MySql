use project3

Insert into Staff values 
--StaffID, StaffName, StaffGender, StaffPhone, StaffDOB, StaffEmail, StaffAddress
('SF001', 'Ayleen Junita', 'Female', '0855912369963', '2001-06-06', 'ayleenjp@gmail.com', '456 Street'),
('SF002', 'Khaira Fadia', 'Female', '0812912431967', '2000-03-03', 'khairafad@gmail.com', '123 Street'),
('SF003', 'Alifia Ramania', 'Female', '0812123451267', '1996-09-24', 'alifiyara@gmail.com', '789 Street'),
('SF004', 'Balqis Dara', 'Female', '0858312345634', '1999-10-11', 'balqisdz@gmail.com', '122 Street'),
('SF005', 'Nabila Sartika', 'Female', '0812675512345', '1998-05-24', 'srtka@gmail.com', '468 Street'),
('SF006', 'Alika Ikhsani', 'Female', '0812468290134', '1997-03-23', 'alikaikh@gmail.com', '515 Street'),
('SF007', 'Nurzahida', 'Female', '0856783453789', '1995-03-31', 'didazahida@gmail.com', '267 Street'),
('SF008', 'Candra Kirana', 'Female', '0856278945784', '1994-02-10', 'çandrakrn@gmail.com', '357 Street'),
('SF009', 'Daffa Arbimas', 'Male', '0875432578902', '1992-09-10', 'daffa@gmail.com', '692 Street'),
('SF010', 'Rafiendra Akbar', 'Male', '0812457932757', '1998-05-23', 'rafi@gmail.com', '367 Street'),
('SF011', 'Narendra Yudhistira', 'Male', '0812543564792', '1995-07-14', 'yudhis@gmail.com', '268 Street'),
('SF012', 'Aufa Rafi', 'Male', '0814680245692', '1997-03-04', 'aufarafi@gmail.com', '172 Street'),
('SF013', 'Yosia Oscar', 'Male', '0858417259352', '1993-10-5', 'yosia@gmail.com', '253 Street'),
('SF014', 'Sulthan Ariq', 'Male', '0852468167972', '1996-12-01', 'sulthan@gmail.com', '672 Street'),
('SF015', 'le alfatah', 'Male', '0845279157267', '1990-05-23', 'leal@gmail.com', '186 Street')


Insert into SoftwareType values 
('TP001', 'Multimedia Design'),
('TP002', 'Database Management'),
('TP003', 'Browser'),
('TP004', 'Web Development'),
('TP005', 'Integrated Development'),
('TP006', 'Mobile Application'),
('TP007', 'Game Development'),
('TP008', 'Text Editor'),
('TP009', 'Business Analytics'),
('TP010', 'Others')

insert into Software values 
--SoftwareID, SoftwareTypeID, SoftwareName, SoftwareVersion, SoftwareReleaseDate, SoftwarePrice, SoftwareStock
('SW001', 'TP001', 'Adobe Premier', '3.1', '2019-10-04', '1000000', '5'),
('SW002', 'TP002', 'MySQL', '2.0', '2020-01-04', '100000', '20'),
('SW003', 'TP003', 'Google Chrome', '4.3', '2019-12-25', '200000', '14'),
('SW004', 'TP004', 'iLife', '2.4', '2020-02-26', '300000', '40'),
('SW005', 'TP005', 'Sophos AntiVirus', '3.0', '2019-11-15', '500000', '32'),
('SW006', 'TP006', 'PuTTY', '4.5', '2020-05-20', '400000', '6'),
('SW007', 'TP007', 'Media Classic', '5.0', '2019-12-10', '600000', '12'),
('SW008', 'TP008', 'Media Player', '4.2', '2020-02-04', '500000', '25'),
('SW009', 'TP009', 'Microsoft Office', '2.1', '2019-10-17', '300000', '42'),
('SW010', 'TP010', 'Internet Explorer', '3.5', '2020-03-24', '200000', '26'),
('SW011', 'TP003', 'Windows Explorer', '4.3', '2019-10-25', '500000', '30'),
('SW012', 'TP001', '7-Zip', '5.7', '2020-04-22', '400000', '15'),
('SW013', 'TP008', 'Eclipse', '7.0', '2019-11-30', '800000', '37'),
('SW014', 'TP006', 'Microsoft Teams', '5.8', '2020-01-15', '600000', '55'),
('SW015', 'TP006', 'Team Viewer', '6.2', '2019-10-17', '300000', '37')


insert into Customer values 
--CustomerID, CustomerName, CustomerGender, CustomerAddress, CustomerPhone
('CS001', 'Iravaty', 'Female', '156 Street', '0815672564986'),
('CS002', 'Radhani', 'Female', '382 Street', '0816239403432'),
('CS003', 'Shabrina', 'Female', '146 Street', '0858127439844'),
('CS004', 'Belinda', 'Female', '328 Street', '0855237851927'),
('CS005', 'Chinanti', 'Female', '519 Street', '0812736401985'),
('CS006', 'Safira', 'Female', '696 Street', '0815267486196'),
('CS007', 'Destricha', 'Female', '368 Street', '0858145286087'),
('CS008', 'Shulhiyah', 'Female', '718 Street', '0811629187251'),
('CS009', 'Rafasyah', 'Male', '273 Street', '0871425317627'),
('CS010', 'Muhammad Rifqy', 'Male', '137 Street', '0816313789127'),
('CS011', 'Ahmad Kamaludin', 'Male', '128 Street', '0816183782718'),
('CS012', 'Robbi Ahmadi', 'Male', '439 Street', '0861721921892'),
('CS013', 'Pratama', 'Male', '346 Street', '0817621821927'),
('CS014', 'Maulana', 'Male', '283 Street', '0811271321983'),
('CS015', 'Stefan', 'Male', '139 Street', '0811833239273')


insert into Distributor values 
--DistributorID, DistributorName, DistributorCompany
('DT001', 'SUMBER ABADI', 'PT. ADIJAYA MAKMUR'),
('DT002', 'MOTOYAMA ENGINEERING WORKS, LTD.', 'PT. WIRA NIAGA GRAHA'),
('DT003', 'SUMBER MAKMUR', 'PT. RESTU MAHKOTA'),
('DT004', 'SCHENCK ROTEC GMBH', 'PT. NEW MODULE INTERNATIONAL'),
('DT005', 'F.G. WILSON', 'PT. TRAKINDO UTAMA'),
('DT006', 'NIIGATA LOADING SYSTEMS, LTD', 'PT. RAMOCO DINAMIKA'),
('DT007', 'INTERMAP TECHNOLOGIES INC', 'PT. EXSA INTERNASIONAL'),
('DT008', 'THERMAX LIMITED', 'CRYSTAL ANUGERAH ABADI'),
('DT009', 'CPI ENGINEERING SERVICES INC.', 'CV. ERIESCO RAYA'),
('DT010', 'ADOLF THIES GMBH & CO. KG', 'PT. TRISARI TIGAPUTRA UTAMA'),
('DT011', 'UTILIS S.A.S', 'PT. BORIMEX'),
('DT012', 'TERMA A/S', 'PT. PANCA BAKTI PERSADA'),
('DT013', 'ORIENTECH ELECTRONICS (SUZHOU)CO., LTD.', 'PT. BUMIKHARISMA LININUSA'),
('DT014', 'DAEHAN GM CORPORATION', 'PT. PRATIWI PUTRI SULUNG'),
('DT015', 'PT. HEKSA PRAKARSA TEKNIK', 'PT. DELPHI UTAMA')

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


select * from Staff
select * from Software
select * from SoftwareType
select * from Customer
select * from Distributor
select * from SalesTransaction
select * from SalesTransactionDetail
select * from PurchaseTransaction
