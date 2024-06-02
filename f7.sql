create database p7;
use p7;

-- Table: Country
CREATE TABLE Country (
    CountryId INT PRIMARY KEY,
    Country_Name VARCHAR(100),
    RegionId INT
);

-- Sample data for Country table
INSERT INTO Country (CountryId, Country_Name, RegionId)
VALUES
(1, 'USA', 1),
(2, 'Canada', 1),
(3, 'Mexico', 2),
(4, 'UK', 3),
(5, 'Germany', 3);

-- Table: Jobs
CREATE TABLE Jobs (
    JobId INT PRIMARY KEY,
    JobTitle VARCHAR(100),
    Maximum_Salary DECIMAL(10,2),
    Minimum_Salary DECIMAL(10,2)
);

-- Sample data for Jobs table
INSERT INTO Jobs (JobId, JobTitle, Maximum_Salary, Minimum_Salary)
VALUES
(1, 'HR Manager', 80000.00, 60000.00),
(2, 'Financial Analyst', 70000.00, 50000.00),
(3, 'Software Engineer', 90000.00, 65000.00);

-- Table: Employee
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

-- Sample data for Employee table
INSERT INTO Employee (EmployeeId, FName, LName, Email, Phone, HireDate, JobId, Salary, Commission, ManagerId, DeptId)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '2023-01-15', 1, 50000.00, NULL, NULL, 1),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', '2023-02-20', 2, 60000.00, 2000.00, 1, 2),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', '555-555-5555', '2023-03-10', 3, 70000.00, NULL, 1, 2),
(4, 'Emily', 'Brown', 'emily.brown@example.com', '111-222-3333', '2023-04-05', 1, 55000.00, 1500.00, 2, 1),
(5, 'David', 'Wilson', 'david.wilson@example.com', '444-444-4444', '2023-05-20', 2, 62000.00, NULL, 2, 1);

-- Table: Department
CREATE TABLE Department (
    DeptId INT PRIMARY KEY,
    DeptName VARCHAR(100),
    ManagerId INT,
    LocationId INT,
    FOREIGN KEY (ManagerId) REFERENCES Employee(EmployeeId),
    FOREIGN KEY (LocationId) REFERENCES Location(LocationId)
);

-- Sample data for Department table
INSERT INTO Department (DeptId, DeptName, ManagerId, LocationId)
VALUES
(1, 'HR', 1, 1),
(2, 'Finance', 2, 2),
(3, 'IT', 3, 1),
(4, 'Sales', 4, 3),
(5, 'Marketing', 5, 2);

-- Table: Location
CREATE TABLE Location (
    LocationId INT PRIMARY KEY,
    Street_Address VARCHAR(255),
    Postal_Code VARCHAR(20),
    City VARCHAR(100),
    CountryId INT,
    FOREIGN KEY (CountryId) REFERENCES Country(CountryId)
);

-- Sample data for Location table
INSERT INTO Location (LocationId, Street_Address, Postal_Code, City, CountryId)
VALUES
(1, '123 Main St', '12345', 'New York', 1),
(2, '456 Oak Ave', '54321', 'Los Angeles', 2),
(3, '789 Pine St', '67890', 'Chicago', 1),
(4, '101 Elm St', '13579', 'Houston', 3),
(5, '202 Maple Ave', '97531', 'San Francisco', 2);

-- Table: Job_History
CREATE TABLE Job_History (
    EmployeeId INT,
    Start_Date DATE,
    End_Date DATE,
    Job_Id INT,
    DeptId INT,
    FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId),
    FOREIGN KEY (Job_Id) REFERENCES Jobs(JobId),
    FOREIGN KEY (DeptId) REFERENCES Department(DeptId)
);

-- Sample data for Job_History table
INSERT INTO Job_History (EmployeeId, Start_Date, End_Date, Job_Id, DeptId)
VALUES
(1, '2020-01-01', '2023-01-14', 1, 1),
(2, '2019-05-01', '2023-02-19', 2, 2),
(3, '2018-08-01', '2023-03-09', 3, 2),
(4, '2021-03-01', '2023-04-04', 1, 1),
(5, '2017-11-01', '2023-05-19', 2, 1);


UPDATE product
SET discount = CASE 
                    WHEN uprice > 100 THEN uprice * 0.1
                    ELSE 0
              END;

