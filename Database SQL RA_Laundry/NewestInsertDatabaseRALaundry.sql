-- INSERT DATABASE
USE RALaundry

INSERT INTO MsStaff
VALUES
	('ST001', 'Daniele Monaghan', 'Jl. Aqua no. 5', 'Male', 2600000),
	('ST002', 'Dave Russo',	'Jl. Semangka no. 32', 'Male', 1650000),
	('ST003', 'Annabelle House', 'Jl. Marimas no. 15', 'Female', 2300000),
	('ST004', 'Roxy Herman', 'Jl. Kartu no. 6', 'Female', 2450000),
	('ST005', 'Jaydon Frazier', 'Jl. Mouse no. 22', 'Male', 1700000),
	('ST006', 'Asiyah Swanson', 'Jl. Hijauku no. 10', 'Female', 1900000),
	('ST007', 'Cathy Lake', 'Jl. Kenari no. 3', 'Female', 2100000),
	('ST008', 'Nora Vance', 'Jl. Hero no. 55', 'Male', 2900000),
	('ST009', 'Elias Watson', 'Jl. Aren no. 45', 'Female', 2890000),
	('ST010', 'John Cunningham', 'Jl. Jeruk no. 7', 'Male', 1800000)

INSERT INTO MsVendor
VALUES
	('VE001', 'Wilfred Mendez', 'Jl. Fire no. 50', '086111608231'),
	('VE002', 'PT. Elizabeth Conner', 'Jl. Melon no. 33', '088320696324'),
	('VE003', 'Joanna Casey', 'Jl. Durian no. 12', '085991235654'),
	('VE004', 'Peter Ray', 'Jl. Selatan no. 61', '082646405356'),
	('VE005', 'PT. Fernando Clark', 'Jl. Kucing no. 2', '082324403257'),	
	('VE006', 'PT. Tyrone Thompson', 'Jl. Helen no. 11', '088691662972'),
	('VE007', 'Kendra Gomez', 'Jl. Kacang no. 4', '083026019396'),
	('VE008', 'Melinda Nguyen', 'Jl. Delima no. 5', '085103390878'),
	('VE009', 'PT. Francis Willis', 'Jl. Apel no. 35', '082128584476'),
	('VE010', 'PT. Verna Voth', 'Jl. Pramuka no. 78', '089324957154')

INSERT INTO MsCustomer VALUES
('CU001', 'Aldo Saputra','Jl Kh Agus Salim no 12','Male','2000-05-21'),
('CU002', 'Derick Yudanegara','Jl U Raya no 85','Male','2001-05-07'),
('CU003', 'Ronaldo Kenny Chandra','Jl Rawa Belong 2D Sandang','Male','1999-03-14'),
('CU004', 'William Loo','Jl Gang Becek no 16','Male','2002-11-03'),
('CU005', 'Ivan Ferdiyanto Pratama','Jl Jendral Sudirman no 31','Male','1998-08-28'),
('CU006', 'Gracela Wardinata','Jl Terong no 77','Female','2002-07-18'),
('CU007', 'Olivia Jesica','Jl Serong BSD no 1','Female','2003-06-19'),
('CU008', 'James Adrian Jaya','Jl Kemangisan no 54','Male','1978-04-02'),
('CU009', 'Dea Wang','Jl Belimbing no 9','Female','2000-02-09'),
('CU010', 'Tiara Sakatsuki','Jl Merdeka Utara no 13','Female','2005-01-23')

INSERT INTO MsClothes VALUES
('CL001','Fendi','Cotton'),
('CL002','Zipper','Polyester'),
('CL003','House of Vercase','Linen'),
('CL004','Frock Coat','Cotton'),
('CL005','Ralph Lauren','Wool'),
('CL006','Lapel','Polyester'),
('CL007','LGS','Linen'),
('CL008','Tassa','Viscose'),
('CL009','Collar','Wool'),
('CL010','Sloper','Viscose')

INSERT INTO HeaderServiceTransaction
VALUES
	--service type:  Laundry service ; Dry Cleaning Service ; Ironing Service
	--					60000				30000					45000
	--STID,    CustID   StID	 ServicDt	    ServType			   ServicePrice
	('SR001', 'CU001', 'ST001', '2019-01-22', 'Dry Cleaning Service', 30000),
	('SR002', 'CU002', 'ST003', '2019-01-22', 'Laundry service', 60000),
	('SR003', 'CU003', 'ST005', '2019-01-25', 'Dry Cleaning Service', 30000),
	('SR004', 'CU004', 'ST007', '2019-02-10', 'Ironing Service', 45000),
	('SR005', 'CU005', 'ST009', '2019-02-11', 'Ironing Service', 45000),
	('SR006', 'CU006', 'ST010', '2019-03-23', 'Laundry service', 60000),
	('SR007', 'CU007', 'ST008', '2019-04-01', 'Dry Cleaning Service', 30000),
	('SR008', 'CU008', 'ST006', '2019-04-10', 'Laundry service', 60000),
	('SR009', 'CU009', 'ST004', '2019-05-19', 'Dry Cleaning Service', 30000),
	('SR010', 'CU010', 'ST002', '2019-05-23', 'Laundry service', 60000),
	('SR011', 'CU001', 'ST003', '2019-05-25', 'Ironing Service', 45000),
	('SR012', 'CU002', 'ST002', '2019-06-03', 'Laundry service', 60000),
	('SR013', 'CU003', 'ST002', '2019-06-20', 'Dry Cleaning Service', 30000),
	('SR014', 'CU004', 'ST007', '2019-07-01', 'Laundry service', 60000),
	('SR015', 'CU005', 'ST004', '2019-07-27', 'Ironing Service', 45000)

INSERT INTO MsMaterial VALUES
('MA001','Leather','Equipment',10000),
('MA002','Bast fibres','Equipment',40000),
('MA003','Brocade','Equipment',35000),
('MA004','Velvet','Equipment',80000),
('MA005','Crepe','Equipment',41000),
('MA006','Notions','Supplies',100000),
('MA007','Voile','Supplies',150000),
('MA008','Satin','Supplies',775000),
('MA009','Organza','Supplies',995000),
('MA010','Fleece','Supplies',420000)

INSERT INTO DetailServiceTransaction VALUES
('SR001', 'CL001'),
('SR002', 'CL002'),
('SR003', 'CL003'),
('SR004', 'CL004'),
('SR005', 'CL005'),
('SR006', 'CL006'),
('SR007', 'CL007'),
('SR008', 'CL008'),
('SR009', 'CL009'),
('SR010', 'CL010'),
('SR011', 'CL001'),
('SR012', 'CL002'),
('SR013', 'CL003'),
('SR014', 'CL004'),
('SR015', 'CL005'),
('SR001', 'CL006'),
('SR002', 'CL007'),
('SR003', 'CL008'),
('SR004', 'CL009'),
('SR005', 'CL010'),
('SR006', 'CL001'),
('SR007', 'CL002'),
('SR008', 'CL003'),
('SR009', 'CL004'),
('SR010', 'CL005')

INSERT INTO HeaderPurchaseTransaction VALUES
('PU001', 'ST001','VE001','2019-01-10'),
('PU002', 'ST002','VE002','2019-01-12'),
('PU003', 'ST003','VE003','2019-01-10'),
('PU004', 'ST004','VE004','2019-01-13'),
('PU005', 'ST005','VE005','2019-01-14'),
('PU006', 'ST006','VE006','2019-02-10'),
('PU007', 'ST007','VE007','2019-02-19'),
('PU008', 'ST008','VE008','2019-02-19'),
('PU009', 'ST009','VE009','2019-02-19'),
('PU010', 'ST010','VE010','2019-03-22'),
('PU011', 'ST001','VE001','2019-03-22'),
('PU012', 'ST002','VE002','2019-04-11'),
('PU013', 'ST003','VE003','2019-04-11'),
('PU014', 'ST004','VE004','2019-04-24'),
('PU015', 'ST005','VE005','2019-05-23')

INSERT INTO DetailPurchaseTransaction VALUES
('PU001', 'MA001', 4),
('PU002', 'MA002', 2),
('PU003', 'MA003', 1),
('PU004', 'MA004', 6),
('PU005', 'MA005', 10),
('PU006', 'MA006', 3),
('PU007', 'MA007', 3),
('PU008', 'MA008', 4),
('PU009', 'MA009', 2),
('PU010', 'MA010', 3),
('PU011', 'MA001', 7),
('PU012', 'MA002', 9),
('PU013', 'MA003', 5),
('PU014', 'MA004', 6),
('PU015', 'MA005', 7),
('PU001', 'MA006', 2),
('PU002', 'MA007', 8),
('PU003', 'MA008', 6),
('PU004', 'MA009', 11),
('PU005', 'MA010', 14),
('PU006', 'MA001', 3),
('PU007', 'MA002', 4),
('PU008', 'MA003', 5),
('PU009', 'MA004', 4),
('PU010', 'MA005', 9)

SELECT * FROM MsStaff
SELECT * FROM MsCustomer
SELECT * FROM MsClothes
SELECT * FROM MsVendor
SELECT * FROM MsMaterial
SELECT * FROM HeaderServiceTransaction
SELECT * FROM DetailServiceTransaction
SELECT * FROM HeaderPurchaseTransaction
SELECT * FROM DetailPurchaseTransaction