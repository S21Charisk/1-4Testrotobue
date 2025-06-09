--CREATE DATABASE NotaryOffiece;
use NotaryOffiece
/*Create table Clients (
	client_id int primary key,
	name varchar(100),
	business_type varchar(100),
	address varchar(200),
	phone varchar(20)
);*/
/*create table Services (
	servise_id int primary key,
	name varchar(100) not null,
	description text,
	fixed_price decimal(10,2) not null
);*/
/*create table Document (
	document_id int primary key,
	client_id int not null,
	total_amount decimal(10,2) not null,
	commission decimal(10,2) not null,
	description text,
	date DATE NOT NULL,
	foreign key (client_id) references Clients (client_id)
);*/
/*create table DocumentServies (
	quantity int not null,
	amount decimal(10,2) not null,
	document_id int not null,
	service_id int not null,
	primary key (document_id, service_id),
	foreign key (document_id) references Document (document_id),
	foreign key (service_id) references Services (service_id)
);*/
/*insert into Clients(client_id, name, business_type, address, phone) 
values
('1','Алексей','цветы','полевая 5', 'айфон'),
('2','Марина','ягоды','полевая 5', 'айфон'),
('3','Екатерина','игрушки','полевая 5', 'айфон'),
('4','Васелиса','магазины','полевая 5', 'айфон'),
('5','Алина','конфеты','полевая 5', 'айфон')*/
/*insert into Services(servise_id, name, description, fixed_price)
values
('1', 'Алексей', 'Крутой', '123'),
('2', 'Марина', 'крутая', '334'),
('3', 'Екатерина', 'Крутая', '345'),
('4', 'Юля', 'Крутая', '333'),
('5', 'Алина', 'Крутая', '444')*/
/*insert into Document(document_id, client_id, total_amount, commission, description, date)
values 
('1', '1', '100', '10', 'круто','2025-09-09'),
('2', '2', '200', '20', 'плохо','2025-07-07'),
('3', '3', '300', '30', 'здорово','2025-06-06'),
('4', '4', '400', '40', 'красиво','2025-05-05'),
('5', '5', '500', '50', 'замечательно','2025-04-04')*/
/*insert into DocumentServies(quantity, amount, document_id, service_id)
values
('1', '1', '1', '1'),
('2', '2', '2', '2'),
('3', '3', '3', '3'),
('4', '4', '4', '4'),
('5', '5', '5', '5')*/
--task1
/*select servise_id, name, description, fixed_price
FROM Services
ORDER BY name;*/
--task2
SELECT c.name AS client_name, s.name AS
servis_name, ds.quantity, ds.amount, d.date
FROM Clients c
JOIN Document d ON c.client_id = d.client_id
join DocumentServies ds on d.document_id = ds.document_id
join Services s ON ds.service_id = ds.service_id
ORDER BY c.name, d.date;
--task3
/*SELECT c.client_id, c.name,
sum(d.total_amount) AS total_paid,
count(d.document_id) AS document_count
FROM Client c
LEFT JOIN Document d ON c.client_id = d.client_id
GROUP BY c.client_id, c.name
ORDER BY total_paid DESC;*/

