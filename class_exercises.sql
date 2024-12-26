SELECT * FROM test.person;

-- Lấy danh sách các quốc gia duy nhất
SELECT DISTINCT country
FROM person;

-- Sắp xếp danh sách người theo tên đầy đủ (fullname) theo thứ tự tăng dần
SELECT * 
FROM person 
ORDER BY fullname ASC;

-- Sắp xếp danh sách người theo nghề nghiệp (job) theo thứ tự giảm dần.
SELECT *
FROM person
ORDER BY job DESC;

-- Lấy danh sách các nghề nghiệp (job) duy nhất mà người trong bảng đang làm
SELECT DISTINCT job
FROM person;

-- Đếm số người theo từng quốc gia và sắp xếp theo số lượng người giảm dần

SELECT country, COUNT(*) AS sort_person
FROM person
GROUP BY country
ORDER BY sort_person DESC;

-- Tính tổng lương (salary) của tất cả người trong bảng.

SELECT SUM(salary) AS sum_salary
FROM person;

-- câu 7 câu 8 câu 9


-- Lấy ra danh sách các nghề nghiệp (job) duy nhất mà có ít nhất 3 người làm.
SELECT job
FROM person
GROUP BY job
HAVING COUNT(*) >= 3;


-- Lấy ra người nam (gender = ‘Male’) có lương (salary) cao nhất

SELECT *
FROM person
WHERE gender = 'M'
ORDER BY salary DESC
LIMIT 1;

-- Lấy ra người nữ (gender = ‘Female’) có lương (salary) thấp nhất.

SELECT *
FROM person
WHERE gender = 'F'
ORDER BY salary ASC
LIMIT 1;

-- Lấy danh sách người (không trùng lặp) theo thứ tự tên đầy đủ tăng dần.

SELECT DISTINCT fullname AS person_fullname
FROM person
ORDER BY person_fullname ASC;

-- Đếm số người sinh vào các tháng khác nhau và sắp xếp theo thứ tự số lượng tăng dần.

SELECT MONTH(birthday) AS month, COUNT(*) AS count
FROM person
GROUP BY MONTH(birthday)
ORDER BY count ASC;

