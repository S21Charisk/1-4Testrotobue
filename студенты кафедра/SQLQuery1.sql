--create database kupcov_obd
USE kupcov_obd;
GO
/*
CREATE TABLE Department (
    department_id INT PRIMARY KEY IDENTITY(1,1),
    department_name NVARCHAR(100) UNIQUE NOT NULL,
    head_of_department NVARCHAR(100) NOT NULL
);

CREATE TABLE [Group] (
    group_id INT PRIMARY KEY IDENTITY(1,1),
    group_name NVARCHAR(50) UNIQUE NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    last_name NVARCHAR(50) NOT NULL,
    first_name NVARCHAR(50) NOT NULL,
    middle_name NVARCHAR(50),
    birth_year INT NOT NULL,
    address NVARCHAR(200) NOT NULL,
    group_id INT NOT NULL,
    FOREIGN KEY (group_id) REFERENCES [Group](group_id)
); 

INSERT INTO Department (department_name, head_of_department)
VALUES 
('������� �����������', '������ ���� ��������'),
('������� ����������', '������ ���� ��������'),
('������� ������', '������� ����� ���������'),
('������� �����', '��������� ����� ������������'),
('������� ��������', '�������� ����� �������������');

INSERT INTO [Group] (group_name, department_id)
VALUES 
('���-101', 1),
('���-102', 1),
('���-201', 2),
('���-202', 2),
('���-301', 3),
('���-401', 4);

INSERT INTO Student (student_id, last_name, first_name, middle_name, birth_year, address, group_id)
VALUES 
(1001, '�������', '�������', '�������������', 2000, '��. ������, 10', 1),
(1002, '��������', '�������', '���������', 2001, '��. �������, 15', 1),
(1003, '�����', '������', '��������', 2000, '��. ��������, 20', 2),
(1004, '��������', '������', '����������', 2001, '��. ���������, 25', 3),
(1005, '������', '������', '����������', 2002, '��. ����, 30', 4),
(1006, '�������', '����', '�������������', 2000, '��. �������, 35', 5),
(1007, '��������', '���������', '���������', 2001, '��. �����������, 40', 2),
(1008, '��������', '���������', '������������', 2002, '��. �������, 45', 6),
(1009, '��������', '����', '���������', 2000, '��. ������, 50', 3);
*/

SELECT 
    g.group_name,
    s.student_id,
    s.last_name + ' ' + s.first_name + ' ' + ISNULL(s.middle_name, '') AS full_name,
    s.birth_year,
    s.address
FROM 
    Student s
JOIN 
    [Group] g ON s.group_id = g.group_id
ORDER BY 
    g.group_name, s.last_name;


	USE kupcov_obd;
	GO
/*	CREATE PROCEDURE GetGroupsByDepartments
AS
BEGIN
    SELECT 
        d.department_name,
        g.group_name
    FROM 
        Department d
    JOIN 
        [Group] g ON d.department_id = g.department_id
    ORDER BY 
        d.department_name, g.group_name;
END;
GO
*/

EXEC GetGroupsByDepartments;

DECLARE @department_name NVARCHAR(100) = '������� �����������';

SELECT 
    d.department_name,
    COUNT(g.group_id) AS group_count
FROM 
    Department d
LEFT JOIN 
    [Group] g ON d.department_id = g.department_id
WHERE 
    d.department_name = @department_name
GROUP BY 
    d.department_name;