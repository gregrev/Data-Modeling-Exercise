-- psql < craigslist.sql

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE region
(
id SERIAL PRIMARY KEY,
city TEXT NOT NULL,
state TEXT NOT NULL
);

CREATE TABLE users
(
id SERIAL PRIMARY KEY,
username TEXT NOT NULL,
region_id INTEGER REFERENCES region
);

CREATE TABLE categories
(
id SERIAL PRIMARY KEY,
name TEXT NOT NULL
);

CREATE TABLE posts
(
id SERIAL PRIMARY KEY,
user_id INTEGER REFERENCES users,
post_text TEXT NOT NULL,
location TEXT NOT NULL,
region_id INTEGER REFERENCES region,
category_id INTEGER REFERENCES categories
);

-- _______________________________________________________

INSERT INTO region
(city, state)
VALUES
('San Francisco', 'California'),
('Atlanta', 'Georgia'),
('Seattle', 'Washington');

INSERT INTO users
(username, region_id)
VALUES
('JohnDoe', 2),
('LeoBEE', 1),
('CristyXL', 1);

INSERT INTO categories
(name)
VALUES
('Clothing'),
('Electronic'),
('Sports Goods');

INSERT INTO posts
(user_id, post_text, location, region_id, category_id)
VALUES
(2, 'T-Shirt', 'Bay Bridge Rd', 1, 1),
(1, 'Cellphone', 'Cook Street', 3, 2),
(3, 'Baseball Bat', 'Straight Ave', 2, 3);


-- Queries

SELECT u.username, p.post_text AS item, p.location, r.city, r.state, c.name AS category
FROM users u
JOIN posts p
ON u.id = p.user_id
JOIN region r
ON p.region_id = r.id
JOIN categories c
ON p.category_id = c.id;
