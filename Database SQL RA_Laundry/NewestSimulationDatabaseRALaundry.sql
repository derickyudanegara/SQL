-- SIMULASI TRANSAKSI UNTUK SERVICE TRANSACTION DAN PURCHASE TRANSACTION
USE RALaundry

INSERT INTO HeaderServiceTransaction VALUES
('SR016', 'CU004','ST001', '2019-11-18', 'Dry Cleaning Service', 30000)

INSERT INTO DetailServiceTransaction VALUES
('SR016','CL002')

INSERT INTO HeaderPurchaseTransaction VALUES
('PU016', 'ST005','VE009','2019-08-19')

INSERT INTO DetailPurchaseTransaction VALUES
('PU016','MA002', 4)

SELECT * FROM HeaderServiceTransaction
SELECT * FROM DetailServiceTransaction
SELECT * FROM HeaderPurchaseTransaction
SELECT * FROM DetailPurchaseTransaction

