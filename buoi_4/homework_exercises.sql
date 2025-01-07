SELECT * FROM test.person;

-- Lấy ra danh sách các nghề nghiệp (job) duy nhất mà người trong bảng không làm trùng lặp
SELECT DISTINCT job AS khongtrunglap_job
FROM person;

-- Lấy ra danh sách các người có nghề nghiệp (job) là ‘Manager’ và lương (salary) lớn hơn 70000.

SELECT *
FROM person
WHERE job = 'Pilot' AND salary < 70000;

-- Lấy ra người có tuổi từ 25 đến 35.


-- Lấy ra danh sách các quốc gia (country) và tổng số lượng người từng quốc gia.

SELECT DISTINCT country, COUNT(*) AS cau4
FROM person
GROUP BY country;

-- Tính số lượng nam (gender = ‘Male’) và nữ (gender = ‘Female’) trong bảng

SELECT gender, COUNT(*) AS tong
FROM person
WHERE gender IN ('M', 'F')
GROUP BY gender;

-- Lấy ra số lượng người có cùng nghề nghiệp (job) và quốc gia (country).
SELECT job, country, COUNT(*) AS job_people
FROM person
GROUP BY job, country;

-- Lấy ra danh sách người theo thứ tự giảm dần của ngày sinh (birthday).
SELECT *
FROM person
ORDER BY birthday DESC;
