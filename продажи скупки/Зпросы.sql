--CREATE DATABASE Course_Зачёт_Зарубин
USE Course_Зачёт_Зарубин;

/* CREATE TABLE data (
 id int primary key,
 data_year date 
);

CREATE TABLE currency (
 id int primary key,
 currency_name nvarchar(30)
);

CREATE TABLE purchase_price (
 id int primary key,
 currencyID int foreign key references currency(id),
 price money
);

 CREATE TABLE purchase (
 id int primary key,
 purchase_priceID int foreign key references purchase_price(id),
 dataID int foreign key references data(id),
 purchase_count nvarchar(3)
);

CREATE TABLE sale_price (
 id int primary key,
 currencyID int foreign key references currency(id),
 price money
);

CREATE TABLE sale (
 id int primary key,
 sale_priceID int foreign key references purchase_price(id),
 dataID int foreign key references data(id),
 purchase_count nvarchar(3)
); */


/* INSERT INTO data (id, data_year) VALUES
(1, '2025-01-01'),
(2, '2025-02-01'),
(3, '2025-03-01'),
(4, '2025-04-01'),
(5, '2025-05-01');

INSERT INTO currency (id, currency_name) VALUES
(1, 'USD'),
(2, 'EUR'),
(3, 'GBP'),
(4, 'JPY'),
(5, 'RUB');

INSERT INTO purchase_price (id, currencyID, price) VALUES
(1, 1, 100.00),
(2, 2, 90.00),
(3, 3, 80.00),
(4, 4, 11000.00),
(5, 5, 5000.00);

INSERT INTO purchase (id, purchase_priceID, dataID, purchase_count) VALUES
(1, 1, 1, '10'),
(2, 2, 2, '20'),
(3, 3, 3, '5'),
(4, 4, 4, '15'),
(5, 5, 5, '25');

INSERT INTO sale_price (id, currencyID, price) VALUES
(1, 1, 120.00),
(2, 2, 100.00),
(3, 3, 90.00),
(4, 4, 11500.00),
(5, 5, 5500.00);

INSERT INTO sale (id, sale_priceID, dataID, purchase_count) VALUES
(1, 1, 1, '8'),
(2, 2, 2, '18'),
(3, 3, 3, '4'),
(4, 4, 4, '12'),
(5, 5, 5, '20'); */


--6) Количество дат
 SELECT c.currency_name AS Валюта, COUNT(DISTINCT d.data_year) AS КоличествоДатПродажи
FROM sale s
JOIN data d ON s.dataID = d.id
JOIN sale_price sp ON s.sale_priceID = sp.id
JOIN currency c ON sp.currencyID = c.id
GROUP BY c.currency_name; 
