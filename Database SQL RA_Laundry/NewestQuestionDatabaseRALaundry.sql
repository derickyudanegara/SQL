-- JAWABAN QUERY DARI 10 SOAL 

USE RALaundry

-- 1
SELECT MSC.CustomerId, MSC.CustomerName, 
	[TotalServicePrice] = SUM(HST.ServicePrice)
FROM MsCustomer MSC 
JOIN HeaderServiceTransaction HST ON MSC.CustomerID = HST.CustomerID
WHERE DATENAME(MONTH, HST.ServiceDate) = 'July'
AND MSC.CustomerGender LIKE 'Male'
GROUP BY MSC.CustomerID, MSC.CustomerName

-- 2.
SELECT MST.StaffName, HPT.PurchaseDate, 
	[TotalTransaction] = COUNT(HPT.PurchaseID)
FROM MsStaff MST 
JOIN HeaderPurchaseTransaction HPT ON MST.StaffID = HPT.StaffID
WHERE MST.StaffName LIKE '%o%'
GROUP BY MST.StaffName, HPT.PurchaseDate
HAVING COUNT(HPT.PurchaseID) > 1

-- 3.
SELECT MSV.VendorName, [PurchaseDate] = CONVERT(VARCHAR, HPT.PurchaseDate, 107),
		[TotalTransaction] = COUNT(HPT.PurchaseID), 
		[TotalPurchasePrice] = SUM(DPT.Qty * MSM.MaterialPrice)
FROM MsVendor MSV 
JOIN HeaderPurchaseTransaction HPT ON MSV.VendorID = HPT.VendorID
JOIN DetailPurchaseTransaction DPT ON HPT.PurchaseID = DPT.PurchaseID
JOIN MsMaterial MSM ON DPT.MaterialID = MSM.MaterialID
WHERE MSV.VendorName LIKE 'PT. %'
AND DATEPART(DAY, HPT.PurchaseDate) % 2 = 1
GROUP BY MSV.VendorName, HPT.PurchaseDate

--4.
SELECT MST.StaffName, MSM.MaterialName, 
	[TotalTransaction] = COUNT(HPT.PurchaseID),
	[TotalQuantity] = CAST(SUM(DPT.Qty) AS VARCHAR) + ' pcs'
FROM MsStaff MST 
JOIN HeaderPurchaseTransaction HPT ON MST.StaffID = HPT.StaffID
JOIN DetailPurchaseTransaction DPT ON HPT.PurchaseID = DPT.PurchaseID
JOIN MsMaterial MSM ON DPT.MaterialID = MSM.MaterialID
WHERE DATENAME(MONTH, HPT.PurchaseDate) = 'July'
GROUP BY MST.StaffName, MSM.MaterialName
HAVING SUM(DPT.Qty) < 9

--5
SELECT [MaterialID] = REPLACE(MSM.MaterialID, 'MA', 'Material '),
	[MaterialName] = UPPER(MSM.MaterialName), HPT.PurchaseDate, DPT.Qty
FROM MsMaterial MSM 
JOIN DetailPurchaseTransaction DPT ON MSM.MaterialID = DPT.MaterialID
JOIN HeaderPurchaseTransaction HPT ON DPT.PurchaseID = HPT.PurchaseID,
(
	SELECT AVG(Qty) AS Average
	FROM DetailPurchaseTransaction
) AvgQty
WHERE MSM.MaterialType = 'Supplies'
AND DPT.Qty > AvgQty.Average
ORDER BY MSM.MaterialID ASC

-- 6
SELECT MST.StaffName, MSC.CustomerName,
	[ServiceDate] = CONVERT(VARCHAR, HST.ServiceDate, 106)
FROM MsStaff MST
JOIN HeaderServiceTransaction HST ON MST.StaffID = HST.StaffID
JOIN MsCustomer MSC ON HST.CustomerID = MSC.CustomerID, 
(
	SELECT AVG(Salary) AS Average
	FROM MsStaff
) AveSalary
WHERE CHARINDEX(' ', MST.StaffName) = 0
AND MST.Salary > AveSalary.Average


-- 7
SELECT MSC.ClothesName, 
	[TotalTransaction] = CAST(COUNT(HST.ServiceID) AS VARCHAR) + ' transaction',
	[ServiceType] = LEFT(HST.ServiceType, CHARINDEX(' ', HST.ServiceType)), 
	HST.ServicePrice
FROM MsClothes MSC
JOIN DetailServiceTransaction DST ON MSC.ClothesID = DST.ClothesID
JOIN HeaderServiceTransaction HST ON DST.ServiceID = HST.ServiceID,
(
	SELECT AVG(ServicePrice) AS Average 
	FROM HeaderServiceTransaction
) AvePrice
WHERE MSC.ClothesType LIKE 'Cotton'
AND HST.ServicePrice < AvePrice.Average
GROUP BY MSC.ClothesName, HST.ServiceType, HST.ServicePrice

-- 8
SELECT [StaffFirstName] = LEFT(MST.StaffName, CHARINDEX(' ', MST.StaffName)), 
		MSV.VendorName, 
		[VendorPhoneNumber] = REPLACE(MSV.VendorPhone,'08','+628'),
		[TotalTransaction] = COUNT(HPT.PurchaseID)
FROM MsStaff MST
JOIN HeaderPurchaseTransaction HPT ON MST.StaffID = HPT.StaffID
JOIN DetailPurchaseTransaction DPT ON HPT.PurchaseID = DPT.PurchaseID
JOIN MsVendor MSV ON HPT.VendorID = MSV.VendorID,
(
	SELECT AVG(Qty) AS Average
	FROM DetailPurchaseTransaction
) AveQty
WHERE MST.StaffName LIKE '% %'
AND DPT.Qty > AveQty.Average
GROUP BY MST.StaffName, MSV.VendorName, MSV.VendorPhone

-- 9
CREATE VIEW [ViewMaterialPurchase]
AS
SELECT MSM.MaterialName, 
		[MaterialPrice] = 'Rp. ' + CAST(MSM.MaterialPrice AS VARCHAR),
		[TotalTransaction] = COUNT(HPT.PurchaseID),
		[TotalPrice] = SUM(DPT.Qty * MSM.MaterialPrice)
FROM MsMaterial MSM
JOIN DetailPurchaseTransaction DPT ON MSM.MaterialID = DPT.MaterialID
JOIN HeaderPurchaseTransaction HPT ON DPT.PurchaseID = HPT.PurchaseID
WHERE MSM.MaterialType LIKE 'Supplies'
GROUP BY MSM.MaterialName, MSM.MaterialPrice
HAVING COUNT(HPT.PurchaseID) > 2

SELECT * FROM ViewMaterialPurchase
DROP VIEW ViewMaterialPurchase

-- 10
CREATE VIEW [ViewMaleCustomerTransaction]
AS
SELECT MSC.CustomerName, MCH.ClothesName,
		[TotalTransaction] = COUNT(HST.ServiceID),
		[TotalPrice] = SUM(HST.ServicePrice)
FROM MsCustomer MSC
JOIN HeaderServiceTransaction HST ON MSC.CustomerID = HST.CustomerID
JOIN DetailServiceTransaction DST ON HST.ServiceID = DST.ServiceID
JOIN MsClothes MCH ON DST.ClothesID = MCH.ClothesID
WHERE MSC.CustomerGender LIKE 'Male'
AND MCH.ClothesType IN ('Wool', 'Linen')
GROUP BY MSC.CustomerName, MCH.ClothesName

SELECT * FROM ViewMaleCustomerTransaction
DROP VIEW ViewMaleCustomerTransaction