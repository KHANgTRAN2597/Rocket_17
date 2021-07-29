USE testing_system;

/*==============Thêm dữ liệu cho Database testing_system=========*/

/*===Du lieu bang department===*/
INSERT INTO department(department_name)
VALUES 					('Marketing'),
						('Sales'),
                        ('Sercurity'),
                        (N'Nhân sự'),
                        (N'Kỹ thuật'),
                        (N'Tài chính'),
						(N'Phó giám đốc'),
                        (N'Giám đốc'),
                        (N'Thư kí'),
                        ('No person'),
                        (N'Bán hàng');
                        
/*===Du lieu bang Position===*/                        
INSERT INTO `position`(position_name) 
VALUES					('Dev'),
						('Test'),
                        ('Scrum Master'),
                        ('PM');
                        
/*===Du lieu bang `Account`===*/                        
INSERT INTO `account`(email, username, fullname, department_id, position_id, create_date) 
VALUES
					('email1@gmail.com', 	'username1', 'fullname1',      '5', '1', 	'2020-03-05'),
					('email2@gmail.com', 	'username2', 'fullname2',      '1', '2', 	'2020-03-05'),
					('email3@gmail.com', 	'username3', 'Nguyen Duc Do',  '2', '2', 	'2020-03-07'),
					('email4@gmail.com', 	'username4', 'Phung Thanh Do', '3', '4', 	'2020-03-08'),
					('email5@gmail.com', 	'username5', 'fullname5',      '4', '4', 	'2020-03-10'),
					('email6@gmail.com', 	'username6', 'fullname6',      '6', '3', 	'2020-04-05'),
					('email7@gmail.com', 	'username7', 'fullname7',      '2', '2', 	'2020-04-07'),
					('email8@gmail.com', 	'username8', 'fullname8',      '8', '1', 	'2020-04-07'),
					('email9@gmail.com', 	'username9', 'fullname9',      '2', '2', 	'2020-04-09'),
					('email10@gmail.com',	'username10','fullname10',     '1', '1', 	'2019-03-05');      

/*===Du lieu bang `Group`===*/                        
INSERT INTO `group`(group_name, creator_id, create_date) 
VALUES
			('Testing System',		'5',	'2019-03-05'),
            ('Development',			'5',	'2019-03-07'),
            ('VTI Sale 01',			'5',	'2019-03-09'),
            ('VTI Sale 02',			'5',	'2019-03-10'),
            ('VTI Sale 03',			'5',	'2019-03-28'),
            ('VTI Creator',			'5',	'2019-04-06'),
            ('VTI Marketing 01',	'5',	'2019-04-07'),
            ('Management',			'5',	'2019-04-08'),
            ('Chat with love',		'5',	'2019-04-09'),
            ('Vi Ti Ai',			'5',	'2019-04-10');

/*===Du lieu bang `Group Account`===*/                        
INSERT INTO `group_account`(group_id, account_id, join_date) 
VALUES
								('1',	'1',	'2019-03-05'),
                                ('2',	'2',	'2019-03-05'),
                                ('3',	'3',	'2019-03-05'),
                                ('4',	'1',	'2019-03-05'),
                                ('5',	'1',	'2019-03-05'),
                                ('6',	'1',	'2019-03-05'),
                                ('7',	'1',	'2019-03-05'),
                                ('8',	'1',	'2019-03-05'),
                                ('9',	'1',	'2019-03-05'),
                                ('10',	'1',	'2019-03-05');

/*===Du lieu bang type question===*/                        
INSERT INTO type_question(type_name) 
VALUE
						('Essay'), 
                        ('Multi-Choice');

/*===Du lieu bang category_question===*/                        
INSERT INTO category_question(category_name) 
VALUES
							('Java'),
                            ('ASP.NET'),
                            ('ADO.NET'),
                            ('SQL'),
                            ('Postman'),
                            ('Ruby'),
                            ('Python'),
                            ('C++'),
                            ('C Sharp'),
                            ('PHP');

/*===Du lieu bang question===*/                        
INSERT INTO question(		content, category_id, type_id, creator_id, create_date) 
VALUES
					(N'Câu hỏi về Java', 	'1', 	'1', 	'2', 	'2020-04-05'),
                    (N'Câu hỏi về PHP', 	'10',	'2', 	'2', 	'2020-04-05'),
                    (N'Hỏi về C#', 			'9', 	'2', 	'3', 	'2020-04-06'),
                    (N'Hỏi về Ruby', 		'6', 	'1', 	'4', 	'2020-04-06'),
                    (N'Hỏi về Postman', 	'5', 	'1', 	'5', 	'2020-04-06'),
                    (N'Hỏi về ADO.NET', 	'3', 	'2', 	'6', 	'2020-04-06'),
                    (N'Hỏi về ASP.NET', 	'2', 	'1', 	'7', 	'2020-04-07'),
                    (N'Hỏi về C++', 		'8', 	'1', 	'8', 	'2020-04-07'),
                    (N'Hỏi về SQL', 		'4', 	'2', 	'9', 	'2020-04-07'),
                    (N'Hỏi về Python', 		'7', 	'1', 	'10',	'2020-04-07');

/*===Du lieu bang answer===*/                        
INSERT INTO answer(content, question_id, is_correct) 
VALUES
				(N'Trả lời 1', '1', b'0'),
                (N'Trả lời 2', '1', b'1'),
                (N'Trả lời 3', '1', b'0'),
                (N'Trả lời 4', '1', b'1'),
                (N'Trả lời 5', '2', b'1'),
                (N'Trả lời 6', '3', b'1'),
                (N'Trả lời 7', '4', b'0'),
                (N'Trả lời 8', '8', b'0'),
                (N'Trả lời 9', '9', b'1'),
                (N'Trả lời 10','10',b'1');

/*===Du lieu bang exam===*/                        
INSERT INTO exam(`code`, title, category_id, duration, creator_id, create_date) 
VALUES
				('VTIQ001', 	N'Đề thi C#', 		'1', '60', '5', '2019-04-05'),
                ('VTIQ002', 	N'Đề thi PHP', 		'1', '60', '5', '2019-04-05'),
                ('VTIQ003', 	N'Đề thi C++', 		'1', '60', '5', '2019-04-05'),
                ('VTIQ004', 	N'Đề thi Java', 	'1', '60', '5', '2019-04-05'),
                ('VTIQ005', 	N'Đề thi Ruby', 	'1', '60', '5', '2019-04-05'),
                ('VTIQ006', 	N'Đề thi Postman', 	'1', '60', '5', '2019-04-05'),
                ('VTIQ007', 	N'Đề thi SQL', 		'1', '60', '5', '2019-04-05'),
                ('VTIQ008', 	N'Đề thi Pythol', 	'1', '60', '5', '2020-04-06'),
                ('VTIQ009', 	N'Đề thi ADO.NET', 	'1', '60', '5', '2020-04-05'),
                ('VTIQ0010',	N'Đề thi ASP.NET', 	'1', '60', '5', '2020-04-05');

/*===Du lieu bang exam_question===*/                        
INSERT INTO exam_question(exam_id, question_id) 
VALUES
						('1',	'5'),
                        ('2',	'10'),
                        ('3',	'4'),
                        ('4',	'3'),
                        ('5',	'7'),
                        ('6',	'10'),
                        ('7',	'2'),
                        ('8',	'10'),
                        ('9',	'9'),
                        ('10',	'8');