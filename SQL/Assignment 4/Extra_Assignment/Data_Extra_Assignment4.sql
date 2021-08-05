USE Management_Employee;

INSERT INTO Department(Department_number, Department_name)
VALUES 							(1, 	'Senior developer'),
								(2, 	'Technical leader'),
								(3, 	'software'),
								(4, 	'CTO'),
								(5, 	'Team leader'),
								(6, 	'Project manager'),
								(7, 	'Manager'),
								(8, 	'Freelance'),
								(9, 	'Architect'),
								(10, 	'Upwork');
                                
							
INSERT INTO Employee_table(Employee_number, Employee_name, Department_number)
VALUES 							(1, 	'TRAN THAI HOANG',		1),
								(2, 	'NGUYEN VAN THANG', 	2),
								(3, 	'PHAM THI NGA',			4),
								(4, 	'VU MINH TUAN', 		3),
								(5, 	'PHAM THE PHUONG',		5),
								(6, 	'TRAN TIEN KHANG',		4),
								(7, 	'HOANG VAN MANH',		4),
								(8, 	'LE VAN CHINH',			4),
								(9, 	'NGUYEN MANH CUONG',	6),
								(10, 	'NGUYEN TUYET MAI',		10);		

INSERT INTO Employee_skill_table(Employee_number, Skill_code, Date_registered)
VALUES 							(1, 	'JAVA',		'2020/02/07'),
								(1, 	'ML', 		'2020/03/08'),
								(2, 	'AI',		'2020/03/08'),
								(1, 	'JS', 		'2020/02/08'),
								(3, 	'NODEJS',	'2020/04/04'),
								(4, 	'C#',		'2020/03/10'),
								(2, 	'C++',		'2020/05/07'),
								(5, 	'HTML',		'2020/01/02'),
								(6, 	'PHP',		'2020/02/09'),
								(7, 	'RUBY',		'2020/04/06');		