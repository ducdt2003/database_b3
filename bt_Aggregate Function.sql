USE sakila;

-- Tính số lượng bản ghi ở bảng actor
SELECT COUNT(*) AS so_luong_ban_ghi
FROM actor;


-- Xác định thời lượng dài nhất và ngắn nhất của các bộ phim trong bảng film
SELECT 
    MAX(length) AS max_length,
    MIN(length) AS min_length
FROM film;



-- Có bao nhiêu bộ phim có rating = 'R'

SELECT COUNT(*) AS total_rated_R
FROM film
WHERE rating = 'R';


-- Trung bình rental_rate của các bộ phim dài hơn 60 phút

SELECT AVG(rental_rate) AS avg_rental_rate
FROM film
WHERE length > 60;

-- 1b 2c 3c 4d 5a
