USE sakila;


-- 1. Danh sách diễn viên có họ bắt đầu bằng chữ “S”
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE 'S%';

-- 2. Danh sách bộ phim được phát hành từ năm 2000 đến năm 2010
SELECT title, release_year
FROM film
WHERE release_year BETWEEN 2000 AND 2010;

-- 3. Danh sách bộ phim có rating là “PG” hoặc “PG-13”
SELECT title, rating
FROM film
WHERE rating IN ('PG', 'PG-13');

-- 4. Danh sách diễn viên và số lượng bộ phim mà họ tham gia, sắp xếp giảm dần
SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS film_count
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY film_count DESC;


-- 5 Lấy danh sách các bộ phim (films) và thể loại (categories) của chúng.
-- 6 Lấy danh sách các bộ phim (films) và tổng số diễn viên (actors) tham gia trong mỗi bộ phim, sắp xếp theo tổng số diễn viên giảm dần.
-- 7 Lấy danh sách các diễn viên (actors) có số lượng bộ phim (films) tham gia lớn hơn 30.
-- 8 Lấy danh sách các diễn viên (actors) không tham gia trong bất kỳ bộ phim nào.
-- 9 Lấy danh sách bộ phim (films) và tổng doanh thu (revenue) của từng bộ phim, sắp xếp theo tổng doanh thu giảm dần.
-- 10 Lấy danh sách các bộ phim (films) và thể loại (categories) của chúng, với điều kiện mỗi bộ phim thuộc thể loại “Horror”.

