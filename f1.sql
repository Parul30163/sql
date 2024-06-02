CREATE TABLE Jobs (
    JobId INT PRIMARY KEY,
    JobTitle VARCHAR(100),
    Maximum_Salary DECIMAL(10,2),
    Minimum_Salary DECIMAL(10,2)
);

INSERT INTO Jobs (JobId, JobTitle, Maximum_Salary, Minimum_Salary)
VALUES
(1, 'Manager', 80000.00, 60000.00),
(2, 'Financial Analyst', 70000.00, 50000.00),
(3, 'Software Engineer', 90000.00, 65000.00);

CREATE TABLE Employee (
    EmployeeId INT PRIMARY KEY,
    FName VARCHAR(50),
    LName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    HireDate DATE,
    JobId INT,
    Salary DECIMAL(10,2),
    Commission DECIMAL(10,2),
    ManagerId INT,
    DeptId INT,
    FOREIGN KEY (JobId) REFERENCES Jobs(JobId),
    FOREIGN KEY (ManagerId) REFERENCES Employee(EmployeeId),
    FOREIGN KEY (DeptId) REFERENCES Department(DeptId)
);

INSERT INTO Employee (EmployeeId, FName, LName, Email, Phone, HireDate, JobId, Salary, Commission, ManagerId, DeptId)
VALUES
(1, 'Vikas', 'Godiya', 'vikasgodiya@gmail.com', '9694643401', '2023-01-15', 1, 50000.00, NULL, NULL, 1),
(2, 'Ashi', 'Phulwani', 'ashiphulwani@gmail.com', '7300140241', '2023-02-20', 2, 60000.00, 2000.00, 1, 2),
(3, 'Vishal', 'Soni', 'vishalsoni@gmail.com', '7073340691', '2023-03-10', 3, 70000.00, NULL, 1, 2),
(4, 'Anish', 'Chouhan', 'anishchouhan@gmail.com', '8954125478', '2023-04-05', 1, 55000.00, 1500.00, 2, 1),
(5, 'Vinay', 'Gehlot', 'vinaygehlot@gmail.com', '7845124589', '2023-05-20', 2, 62000.00, NULL, 2, 1);

CREATE TABLE Department (
    DeptId INT PRIMARY KEY,
    DeptName VARCHAR(100),
    ManagerId INT,
    LocationId INT,
    FOREIGN KEY (ManagerId) REFERENCES Employee(EmployeeId),
    FOREIGN KEY (LocationId) REFERENCES Location(LocationId)
);

INSERT INTO Department (DeptId, DeptName, ManagerId, LocationId)
VALUES
(70, 'HR', 1, 1),
(71, 'Manager', 2, 2),
(72, 'IT', 3, 1),
(73, 'Sales', 4, 3),
(74, 'Marketing', 5, 2);

CREATE TABLE Location (
    LocationId INT PRIMARY KEY,
    Street_Address VARCHAR(255),
    Postal_Code VARCHAR(20),
    City VARCHAR(100),
    CountryId INT,
    FOREIGN KEY (CountryId) REFERENCES Country(CountryId)
);

INSERT INTO Location (LocationId, Street_Address, Postal_Code, City, CountryId)
VALUES
(1, 'Sardarpura', '12345', 'Jodhpur', 1),
(2, 'Sardarpura', '54321', 'Jodhpur', 2),
(3, 'Kudi', '67890', 'Basni', 1),
(4, 'BGKT', '13579', 'Pali', 3),
(5, '202 CtrySide', '97531', 'San Francisco', 2);

CREATE TABLE Country (
    CountryId INT PRIMARY KEY,
    Country_Name VARCHAR(100),
    RegionId INT
);

INSERT INTO Country (CountryId, Country_Name, RegionId)
VALUES
(1, 'India', 1),
(2, 'Austria', 1),
(3, 'Indiana', 2),
(4, 'Czech', 3),
(5, 'UK', 3);

CREATE TABLE Job_History (
    EmployeeId INT,
    Start_Date DATE,
    End_Date DATE,
    Job_Id INT,
    FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId),
    FOREIGN KEY (Job_Id) REFERENCES Jobs(JobId)
);

INSERT INTO Job_History (EmployeeId, Start_Date, End_Date, Job_Id)
VALUES
(1, '2020-01-01', '2023-01-14', 1),
(2, '2019-05-01', '2023-02-19', 2),
(3, '2018-08-01', '2023-03-09', 3),
(4, '2021-03-01', '2023-04-04', 1),
(5, '2017-11-01', '2023-05-19', 2);

