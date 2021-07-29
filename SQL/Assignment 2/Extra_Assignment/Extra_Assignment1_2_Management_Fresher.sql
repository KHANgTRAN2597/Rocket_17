DROP DATABASE IF EXISTS Management_Fresher;
CREATE DATABASE Management_Fresher;
USE Management_Fresher;

-- CREATE TABLE TRAINEE
DROP TABLE IF EXISTS Trainee;
CREATE TABLE Trainee(
	vti_account					CHAR(10) NOT NULL UNIQUE KEY,
	trainee_id					INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    full_name					VARCHAR(20) NOT NULL,
    birth_date					DATE NOT NULL,
    gender						INT NULL,
    entry_test_point_iq			INT UNSIGNED NOT NULL,
    entry_test_point_gmath		INT UNSIGNED NOT NULL,
    entry_test_point_english	INT UNSIGNED NOT NULL,
    training_class				CHAR(5) NOT NULL,
    evaluation_notes			CHAR(20),
    modified_Date				DATETIME,
    is_deleted_flag				BIT
);