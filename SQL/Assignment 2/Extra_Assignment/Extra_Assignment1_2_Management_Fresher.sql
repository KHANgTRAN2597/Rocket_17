DROP DATABASE IF EXISTS Management_Fresher;
CREATE DATABASE Management_Fresher;
USE Management_Fresher;

-- CREATE TABLE TRAINEE
DROP TABLE IF EXISTS Trainee;
CREATE TABLE Trainee(
	trainee_id					SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    full_name					VARCHAR(50) NOT NULL,
    birth_date					DATE NOT NULL,
    gender						ENUM('male', 'female', 'unknown'),
    et_iq			TINYINT UNSIGNED NOT NULL CHECK (et_iq <= 20),
    et_gmath		TINYINT UNSIGNED NOT NULL CHECK (et_gmath <= 20),
    et_english	TINYINT UNSIGNED NOT NULL CHECK (et_english <= 50),
    training_class				CHAR(5) NOT NULL,
    evaluation_notes			VARCHAR(200),
    modified_Date				DATE
);

-- Question 2:

ALTER TABLE Trainee
ADD COLUMN vti_account 	INT UNSIGNED NOT NULL UNIQUE KEY;

-- Exercise 2: Data types
DROP TABLE IF EXISTS Code_exam;
CREATE TABLE Code_exam(
id				MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`name`			VARCHAR(50),
`code`			CHAR(5),
modified_date	DATETIME DEFAULT NOW()
);

-- Exercise 3: Data types (2)
DROP TABLE IF EXISTS Infor_fresher;
CREATE TABLE Infor_fresher(
id				MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`name`			VARCHAR(50),
birth_date		DATE,
gender			BIT DEFAULT ('unknown'),
is_deleted_flag	BIT
);

