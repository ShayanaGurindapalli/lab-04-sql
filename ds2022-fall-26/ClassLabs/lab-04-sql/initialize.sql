USE uyc4cf_media;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users; 

CREATE TABLE users (
	user_id VARCHAR (5) NOT NULL,
	username VARCHAR(30),
	email VARCHAR (50),
	year_joined YEAR,
	PRIMARY KEY(user_id)
);
CREATE TABLE posts(
	post_id VARCHAR(5) NOT NULL,
	title VARCHAR (150) NOT NULL,
	body TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	user_id VARCHAR(5) NOT NULL,
	PRIMARY KEY (post_id),
	FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO users (user_id, username, email, year_joined) VALUES ('001', 'guy1', 'guy1@example.com', '2007');
INSERT INTO users (user_id, username, email, year_joined) VALUES ('002', 'person123', 'person@example.com', '2008');
INSERT INTO users (user_id, username, email, year_joined) VALUES ('003', 'dogsarecute', 'doggies@example.com', '2010');
INSERT INTO users (user_id, username, email, year_joined) VALUES ('004', 'girl9', 'girl@example.com', '1999');
INSERT INTO users (user_id, username, email, year_joined) VALUES ('005', 'sunsetsky', 'sunny@example.com', '2001');
INSERT INTO users (user_id, username, email, year_joined) VALUES ('006', 'guy2', 'guy2@example.com', '2002');
INSERT INTO users (user_id, username, email, year_joined) VALUES ('007', 'randomusername', 'noclue@example.com', '2012');
INSERT INTO users (user_id, username, email, year_joined) VALUES ('008', 'ipadkid', '2021born@example.com', '2026');
INSERT INTO users (user_id, username, email, year_joined) VALUES ('009', 'noideas', 'original@example.com', '2016');
INSERT INTO users (user_id, username, email, year_joined) VALUES ('010', 'guy3', 'guy3@example.com', '2020');

INSERT INTO posts (post_id, title, body, created_at, user_id) VALUES ('P01', 'First post', 'Hi! This is my first post', '2026-02-01 10:00:00', '001');
INSERT INTO posts (post_id, title, body, created_at, user_id) VALUES ('P02', 'Studying at the Library', 'Midterm this friday', '2026-02-02 11:30:00', '002');
INSERT INTO posts (post_id, title, body, created_at, user_id) VALUES ('P03', 'Doggo', 'Got a new dog', '2026-02-03 09:15:00', '003');
INSERT INTO posts (post_id, title, body, created_at, user_id) VALUES ('P04', 'Coffee Shop', 'New coffee place down the street', '2026-02-04 14:00:00', '004');
INSERT INTO posts (post_id, title, body, created_at, user_id) VALUES ('P05', 'Sunset', 'Sunset on September', '2026-02-05 16:20:00', '005');
INSERT INTO posts (post_id, title, body, created_at, user_id) VALUES ('P06', '09/26', 'Fit check', '2026-02-06 18:45:00', '006');
INSERT INTO posts (post_id, title, body, created_at, user_id) VALUES ('P07', 'Work', 'Internship for 2027', '2026-02-07 08:30:00', '007');
INSERT INTO posts (post_id, title, body, created_at, user_id) VALUES ('P08', 'Class', 'Doing Math HW', '2026-02-08 12:10:00', '008');
INSERT INTO posts (post_id, title, body, created_at, user_id) VALUES ('P09', '09/27', 'Post#1', '2026-02-09 15:50:00', '009');
INSERT INTO posts (post_id, title, body, created_at, user_id) VALUES ('P10', 'Last post', 'Hi! This is my last post', '2026-02-10 20:00:00', '010');

