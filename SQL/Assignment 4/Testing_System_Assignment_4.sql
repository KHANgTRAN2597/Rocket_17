USE testing_system;


/*Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ*/

SELECT a.username, a.email, a.fullname, d.department_id
FROM `account` a
JOIN department d
ON a.department_id = d.department_id;

/*Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010 */

/*cách 1*/
SELECT a.account_id, a.create_date, a.fullname, d.department_name, d.department_id
FROM `account` a
JOIN department d
ON a.department_id = d.department_id
WHERE a.create_date < '2020-04-07';
/*cách 2*/
SELECT *
FROM `account` 
WHERE create_date < '2020-04-07'
ORDER BY account_id;

/*Question 3: Viết lệnh để lấy ra tất cả các developer*/

SELECT a.account_id, a.fullname, p.position_name
FROM `account` a
JOIN `position` p
ON a.position_id = p.position_id
WHERE p.position_name = 'Dev';

/*Câu 4: Lấy ra tất cả phòng ban có nhân viên > 3*/

SELECT department_name, COUNT(d.department_id)
FROM department d
JOIN `account` a
ON d.department_id = a.department_id
GROUP BY d.department_id
HAVING COUNT(d.department_id) >= 3;

/*Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất*/

SELECT q.question_id, COUNT(eq.question_id) AS Cau_Hoi_Duoc_Su_Dung_Nhieu
FROM question q
JOIN exam_question eq
ON q.question_id = eq.question_id
GROUP BY eq.question_id
ORDER BY COUNT(eq.question_id) DESC
LIMIT 1;

/*Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question*/

SELECT cq.category_id, cq.category_name, q.content, COUNT(q.question_id) AS SoCauHoiDuocSuDungTronQuestion
FROM category_question cq
JOIN question q
ON cq.category_id = q.category_id
GROUP BY q.question_id;

/*Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam*/

SELECT q.content, q.category_id, COUNT(eq.question_id)
FROM question q
LEFT JOIN exam_question eq 
ON eq.question_id = q.question_id 
GROUP BY q.question_id
ORDER BY eq.question_id DESC;

/*Question 8: Lấy ra Question có nhiều câu trả lời nhất*/
SELECT q.content, a.question_id, COUNT(a.question_id) AS CauHoiCoNhieuCauTraLoiNhat
FROM question q
JOIN answer a
ON q.question_id = a.question_id
GROUP BY a.question_id;

/*Question 9: Thống kê số lượng account trong mỗi group*/
-- tự biến tấu thêm GROUP_CONCAT VÀ DISTINCT
SELECT g.group_id, GROUP_CONCAT(DISTINCT ga.account_id) AS ChiTiet, COUNT(ga.account_id)
FROM group_account ga
JOIN `group` g
ON ga.group_id = g.group_id
GROUP BY g.group_id;

/*Question 10: Tìm chức vụ có ít người nhất*/

SELECT p.position_name, COUNT(a.position_id), MIN(a.position_id)
FROM `position` p
JOIN `account` a
ON p.position_id = a.position_id
GROUP BY p.position_name;

/*Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM*/

SELECT d.department_id, d.department_name, p.position_name, COUNT(a.position_id)
FROM `account` a
JOIN department d
ON a.position_id = d.department_id
JOIN `position` p
ON a.position_id = p.position_id
GROUP BY d.department_id;

/*Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của
question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...*/

SELECT q.question_id, q.type_id AS 'LoaiCauHoi', tq.type_name AS 'TenLoai', q.content AS 'ChuDe', q.creator_id AS 'NguoiTao', a.answer_id AS 'IDCauTraLoi'
FROM question q
JOIN answer a
ON q.question_id = a.question_id
JOIN type_question tq
ON q.type_id = tq.type_id;

/*Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm*/

SELECT tq.type_id AS 'ID', tq.type_name AS 'TenLoai', COUNT(q.question_id) AS 'SoLuongCauHoi', GROUP_CONCAT(q.question_id) AS 'ChiTietLoaiCauHoi'
FROM question q
JOIN type_question tq
ON q.type_id = tq.type_id
GROUP BY tq.type_id;

/*Question 14: Lấy ra group không có account nào*/

SELECT ga.group_id, ga.account_id
FROM `group` g
LEFT JOIN group_account ga
ON g.group_id = ga.group_id
WHERE ga.account_id IS NULL;

/*Lay ra account khong nam trong group nao*/

SELECT *
FROM `account` a
RIGHT JOIN group_account ga
ON a.account_id = ga.account_id
WHERE ga.account_id IS NULL;

/*Question 16: Lấy ra question không có answer nào*/

SELECT q.question_id
FROM answer a
RIGHT JOIN question q
ON q.question_id = a.question_id
WHERE a.answer_id IS NULL;

/*Question 17:
a) Lấy các account thuộc nhóm thứ 1
b) Lấy các account thuộc nhóm thứ 2
c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau*/

SELECT a.account_id, ga.group_id
FROM group_account ga
JOIN `account` a
ON ga.account_id = a.account_id
WHERE ga.group_id IN(1)
UNION
SELECT a.account_id, ga.group_id
FROM group_account ga
JOIN `account` a
ON ga.account_id = a.account_id
WHERE ga.group_id IN(2);

/*Question 18:
a) Lấy các group có lớn hơn 5 thành viên
b) Lấy các group có nhỏ hơn 7 thành viên
c) Ghép 2 kết quả từ câu a) và câu b)*/


SELECT g.group_name, count(ga.group_id)
FROM group_account ga
JOIN `group` g
ON g.group_id = ga.group_id
GROUP BY g.group_id
HAVING COUNT(ga.group_id) >= 5
UNION
SELECT g.group_name, count(ga.group_id)
FROM group_account ga
JOIN `group` g
ON g.group_id = ga.group_id
GROUP BY g.group_id
HAVING COUNT(ga.group_id) <= 7;


-- lay ra ten account va ten group cua nhung account da tham gia vao group

SELECT a.username, g.group_name
FROM `account`a
JOIN group_account ga
ON a.account_id = ga.account_id
JOIN `group` g
ON g.group_id = ga.group_id;