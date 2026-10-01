USE uyc4cf_media;

SELECT
	posts.post_id,
	posts.title,
	users.username,
	users.year_joined,
	users.email
FROM posts
JOIN users on posts.user_id = users.user_id
WHERE users.year_joined >= 2010; 
