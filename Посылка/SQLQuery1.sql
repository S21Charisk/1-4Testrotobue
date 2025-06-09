/*CREATE DATABASE ParcelDelivery;
GO

USE ParcelDelivery;
GO


CREATE TABLE Destinations (
    DestinationID INT PRIMARY KEY IDENTITY(1,1),
    DestinationName VARCHAR(100) NOT NULL,
    Address VARCHAR(200)
);


CREATE TABLE Parcels (
    ParcelID INT PRIMARY KEY IDENTITY(1,1),
    Weight DECIMAL(10,2) NOT NULL,
    Price MONEY NOT NULL,
    ShipmentDate DATETIME NOT NULL,
    DestinationID INT NOT NULL,
    FOREIGN KEY (DestinationID) REFERENCES Destinations(DestinationID)
);


INSERT INTO Destinations (DestinationName, Address)
VALUES 
    ('Москва', 'ул. Тверская, 1'),
    ('Санкт-Петербург', 'Невский пр., 10'),
    ('Новосибирск', 'ул. Ленина, 25'),
    ('Екатеринбург', 'ул. Малышева, 50'),
    ('Казань', 'ул. Баумана, 15'); 

INSERT INTO Parcels (Weight, Price, ShipmentDate, DestinationID)
VALUES 
    (2.5, 1500.00, '10.02.2003', 1),
    (1.8, 1200.00, '15.02.2003', 2),
    (3.2, 2000.00, '20.01.2003', 3),
    (0.9, 800.00, '25.01.2003', 4),
    (5.1, 3500.00, '28.02.2003', 5),
    (2.0, 1300.00, '05.01.2003', 1),
    (4.5, 2800.00, '18.02.2003', 3);

SELECT p.ParcelID, d.DestinationName
FROM Parcels p
JOIN Destinations d ON p.DestinationID = d.DestinationID
WHERE p.ShipmentDate BETWEEN '01-02-2003' AND '28.02.2003';

CREATE PROCEDURE GetJanuaryParcelsCost
AS
BEGIN
    SELECT SUM(Price) AS TotalJanuaryCost
    FROM Parcels
    WHERE MONTH(ShipmentDate) = 1 AND YEAR(ShipmentDate) = 2003;
END;
GO*/

EXEC GetJanuaryParcelsCost;

/*-- Запрос конкретно для москвы
SELECT d.DestinationName, COUNT(p.ParcelID) AS ParcelCount
FROM Destinations d
LEFT JOIN Parcels p ON d.DestinationID = p.DestinationID
WHERE d.DestinationName = 'Москва'
GROUP BY d.DestinationName;

SELECT d.DestinationName, COUNT(p.ParcelID) AS ParcelCount
FROM Destinations d
LEFT JOIN Parcels p ON d.DestinationID = p.DestinationID
GROUP BY d.DestinationName
ORDER BY ParcelCount DESC;*/