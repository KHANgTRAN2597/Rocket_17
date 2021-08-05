USE Management_Employee;

-- Question 3: Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java

SELECT et.Employee_name, est.Skill_code
FROM Employee_table et
JOIN Employee_skill_table est
ON et.Employee_number = est.Employee_number
WHERE est.Skill_code = 'JAVA';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên

SELECT d.Department_name, COUNT(1)
FROM Department d
JOIN Employee_table et
ON d.Department_number = et.Department_number
GROUP BY d.Department_number
HAVING COUNT(d.Department_number) > '3';

-- Question 5: Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban.

SELECT d.Department_number, COUNT(et.Department_number), GROUP_CONCAT(Employee_name)
FROM Employee_table et
JOIN Department d
ON d.Department_number = et.Department_number
GROUP BY et.Department_number
HAVING COUNT(et.Department_number);

-- Question 6: Viết lệnh để lấy ra danh sách nhân viên có > 1 skills.

SELECT et.Employee_name, COUNT(est.Skill_code), GROUP_CONCAT(est.Skill_code)
FROM Employee_table et
JOIN Employee_skill_table est
ON et.Employee_number = est.Employee_number
GROUP BY est.Employee_number
HAVING COUNT(est.Skill_code);



