DROP DATABASE IF EXISTS Management_Employee;
CREATE DATABASE Management_Employee;
USE Management_Employee;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
	Department_number		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Department_name		VARCHAR(50) UNIQUE KEY NOT NULL
);

DROP TABLE IF EXISTS Employee_table;
CREATE TABLE Employee_table(
	Employee_number			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Employee_name			VARCHAR(50),
    Department_number		TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY (Department_number) REFERENCES Department (Department_number)
);

DROP TABLE IF EXISTS Employee_skill_table;
CREATE TABLE Employee_skill_table(
	id						TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Employee_number			TINYINT UNSIGNED NOT NULL,
    Skill_code				VARCHAR(50) NOT NULL,
    Date_registered			DATETIME,
	FOREIGN KEY (Employee_number) REFERENCES Employee_table (Employee_number)
);