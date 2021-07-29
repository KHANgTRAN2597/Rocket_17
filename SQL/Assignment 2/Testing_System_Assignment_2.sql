DROP DATABASE IF EXISTS testing_system;
CREATE DATABASE testing_system;
USE testing_system;

DROP TABLE IF EXISTS department;
CREATE TABLE department(
	department_id 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    department_name 		NVARCHAR(50) UNIQUE KEY NULL
);

DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`(
	position_id 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    position_name 			ENUM('DEV', 'TEST', 'SCRUM MASTER', 'PM') UNIQUE KEY NOT NULL
);

DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`(
	account_id 				INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email 					VARCHAR(50) UNIQUE KEY,
    username 				VARCHAR(50) UNIQUE KEY NOT NULL CHECK (length(username) >= 6),
    fullname 				VARCHAR(50) NOT NULL,
    department_id 			TINYINT UNSIGNED DEFAULT(1),
    position_id 			TINYINT UNSIGNED NOT NULL,
    create_date 			DATETIME DEFAULT NOW(),
    FOREIGN KEY (department_id) REFERENCES department(department_id),
    FOREIGN KEY (position_id) REFERENCES `position`(position_id)
);

DROP TABLE IF EXISTS `group`;
CREATE TABLE `group`(
	group_id 				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    group_name 				VARCHAR(50) NOT NULL,
    creator_id 				INT UNSIGNED NOT NULL,
    create_date 			DATE,
    FOREIGN KEY(creator_id) REFERENCES `account`(account_id)
);

DROP TABLE IF EXISTS group_account;
CREATE TABLE group_account(
	group_id 				TINYINT UNSIGNED,
    account_id				INT UNSIGNED NOT NULL,
    join_date 				DATE,
    PRIMARY KEY (group_id, account_id),
    FOREIGN KEY(account_id) REFERENCES `account`(account_id),
    FOREIGN KEY(group_id) REFERENCES `group`(group_id)
);

-- create bang 6
DROP TABLE IF EXISTS type_question;
CREATE TABLE type_question(
	type_id					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    type_name				ENUM('Essay','Multi-Choice') UNIQUE KEY NOT NULL
);

-- create bang 7
DROP TABLE IF EXISTS category_question;
CREATE TABLE category_question(
	category_id				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    category_name			NVARCHAR(50) NOT NULL
);

-- creatte bang 8
DROP TABLE IF EXISTS question;
CREATE TABLE question(
	question_id				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content					VARCHAR(100) NOT NULL,
    category_id				TINYINT UNSIGNED NOT NULL,
    type_id					TINYINT UNSIGNED NOT NULL,
    creator_id				INT UNSIGNED NOT NULL,
    create_date				DATE NOT NULL,
    FOREIGN KEY (type_id) REFERENCES type_question(type_id),
    FOREIGN KEY (creator_id) REFERENCES `account`(account_id),
    FOREIGN KEY (category_id) REFERENCES category_question(category_id)
);

-- create bang 9
DROP TABLE IF EXISTS answer;
CREATE TABLE answer(
	answer_id				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content					NVARCHAR(100) NOT NULL,
    question_id				TINYINT UNSIGNED NOT NULL,
    is_correct				BIT NOT NULL,
    FOREIGN KEY (question_id) REFERENCES question(question_id)
);

-- create bang 10
DROP TABLE IF EXISTS exam;
CREATE TABLE exam(
	exam_id					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `code`					CHAR(8) UNIQUE KEY NOT NULL,
    title					VARCHAR(50),
    category_id				TINYINT UNSIGNED,
    duration				TINYINT NOT NULL,
    creator_id				INT UNSIGNED NOT NULL,
    create_date				DATE,
    FOREIGN KEY (category_id) REFERENCES category_question (category_id),
    FOREIGN KEY (creator_id) REFERENCES `account`(account_id)
);

-- create bang 11
DROP TABLE IF EXISTS exam_question;
CREATE TABLE exam_question(
	exam_id					TINYINT UNSIGNED,
    question_id				TINYINT UNSIGNED,
    FOREIGN KEY (exam_id) REFERENCES exam(exam_id),
    FOREIGN KEY (question_id) REFERENCES question(question_id),
    PRIMARY KEY(exam_id, question_id)
);