USE sakila;

-- Bài tập 1: Lấy danh sách các bộ phim (films) thuộc thể loại “Action.”
SELECT film.title
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE category.name = 'Action';

-- Bài tập 2: Lấy danh sách các bộ phim (films) và thể loại (categories) của chúng
SELECT film.title, category.name AS category
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id;

-- Bài tập 3: Lấy danh sách các bộ phim (films) và số lượng thể loại (categories) của mỗi bộ phim.
SELECT film.title, COUNT(category.category_id) AS category_count
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
GROUP BY film.film_id, film.title;
-- Bài tập 4: Lấy danh sách các bộ phim (films) và thể loại (categories) của bộ phim có rating “PG-13.”
SELECT f.title, c.name AS category
FROM category AS c
JOIN film_category AS fc ON c.category_id = fc.category_id
JOIN film AS f ON fc.film_id = f.film_id
WHERE f.rating = 'PG-13';
-- Bài tập 5: Lấy danh sách các diễn viên (actors) và số lượng bộ phim (films) thuộc thể loại “Family,” sắp xếp theo số lượng bộ phim giảm dần
-- Bài tập 6: Lấy danh sách các bộ phim (films) và số lượng diễn viên (actors) tham gia, sắp xếp theo số lượng diễn viên giảm dần.
-- Bài tập 7: Lấy danh sách tất cả diễn viên có họ là “Smith” và tên bắt đầu bằng “J.”
SELECT actor_id, first_name, last_name
FROM actor
WHERE last_name = 'Smith' AND first_name LIKE 'J%';

-- Bài tập 8: Lấy danh sách các bộ phim phát hành trong năm 2015 với tổng doanh thu lớn hơn 5000.
-- Bài tập 9: Lấy danh sách bộ phim và ngôn ngữ của từng bộ phim

SELECT f.title, l.name AS language
FROM film f
JOIN language l ON f.language_id = l.language_id;


-- Bài tập 10: Lấy danh sách bộ phim có tên bắt đầu bằng chữ ‘I’ và kết thúc bằng chữ ‘N.’
SELECT title
FROM film
WHERE title LIKE 'I%N';


