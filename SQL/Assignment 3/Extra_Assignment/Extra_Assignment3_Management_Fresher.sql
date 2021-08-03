USE Management_Fresher;

/* Question 2: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào,
nhóm chúng thành các tháng sinh khác nhau: iq > 6, grmath >= 10, english > 10 */

SELECT month(birth_date) `month`, COUNT(*)
FROM Trainee
WHERE et_iq > 6 AND et_gmath >=10 AND et_english > 10
GROUP BY month(birth_date);

/* Question 3: Viết lệnh để lấy ra thực tập sinh có tên dài nhất, lấy ra các thông tin sau:
tên, tuổi, các thông tin cơ bản như đã được định nghĩa trong table */

SELECT *
FROM Trainee
WHERE LENGTH(full_name) = (SELECT MAX(LENGTH(full_name)) FROM Trainee);

/* Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là
những người đã vượt qua bài test đầu vào và thỏa mãn số điểm như sau:
 ET_IQ + ET_Gmath>=20
 ET_IQ>=8
 ET_Gmath>=8
 ET_English>=18 */

SELECT *
FROM Trainee
WHERE (et_iq + et_gmath) >=20 AND et_iq >=8 AND et_gmath >=8 AND et_english >=18;

/* Question 5: xóa thực tập sinh có TraineeID = 3 */

DELETE
FROM Trainee
WHERE trainee_id = 3;

/*Question 6: Thực tập sinh có TraineeID = 2 được chuyển sang lớp "5". Hãy cập nhật
thông tin vào database*/

UPDATE	Trainee
SET 	training_class = 'VTI5'
WHERE 	trainee_id = '2';