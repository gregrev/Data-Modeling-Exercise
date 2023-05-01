-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airline
(
id SERIAL PRIMARY KEY,
name text NOT NULL
);

CREATE TABLE airport_locations
(
id SERIAL PRIMARY KEY,
city TEXT NOT NULL,
country TEXT NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER REFERENCES airline,
  from_city_id INTEGER REFERENCES airport_locations(id),
  to_city_id INTEGER REFERENCES airport_locations(id)
);


INSERT INTO airline
(name)
VALUES
('United'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('Air China'),
('American Airlines'),
('Avianca Brasil');

INSERT INTO airport_locations
(city, country)
VALUES
  ('Washington DC', 'United States'),
  ('Tokyo', 'Japan'),
  ('Los Angeles', 'United States'),
  ('Seattle', 'United States'),
  ('Paris', 'France'),
  ('Dubai', 'UAE'),
  ('New York', 'United States'),
  ('Cedar Rapids', 'United States'),
  ('Charlotte', 'United States'),
  ('Sao Paolo', 'Brazil'),
  ('Santiago', 'Chile'),
  ('Seattle', 'United States'),
  ('London', 'United Kingdom'),
  ('Las Vegas', 'United States'),
  ('Mexico City', 'Mexico'),
  ('Casablanca', 'Morocco'),
  ('Beijing', 'China'),
  ('Chicago', 'United States'),
  ('New Orleans', 'United States');


INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline_id, from_city_id, to_city_id)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 4),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 2, 13),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 3, 14),
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 4, 15),
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 5, 16),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 6, 17),
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 7, 9),
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 8, 18),
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 9, 19),
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 10, 11);
