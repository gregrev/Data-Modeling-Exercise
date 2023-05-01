-- psql < medical_center.sql

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE hospitals
(
id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
address TEXT NOT NULL,
phone_number TEXT NOT NULL);

CREATE TABLE doctors
(
id SERIAL PRIMARY KEY,
doctor_first_name TEXT NOT NULL,
doctor_last_name TEXT NOT NULL,
hospital_id INTEGER REFERENCES hospitals);

CREATE TABLE diseases
(
id SERIAL PRIMARY KEY,
type TEXT NOT NULL
);

CREATE TABLE patients
(
id SERIAL PRIMARY KEY,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL,
doctor_id INTEGER REFERENCES doctors,
disease_id INTEGER REFERENCES diseases);

INSERT INTO hospitals
(name, address, phone_number)
VALUES
('St. Josephs Hospital', '123 Cook Street', '973-888-5545'),
('Wayne General Hospital', '11 Valley Road', '901-828-5005'),
('Georgetown University Hospital', '2300 23rd Ave', '202-234-0001');

INSERT INTO doctors
(doctor_first_name, doctor_last_name, hospital_id)
VALUES
('Jess', 'Wilks', 1),
('Gary', 'Neel', 2),
('Paul', 'Blart', 3);

INSERT INTO diseases
(type)
VALUES
('diabetes'),
('arthritis'),
('concussion');

INSERT INTO patients
(first_name, last_name, doctor_id, disease_id)
VALUES
('Joe', 'Dirt', 2, 1),
('Joe', 'Dirt', 3, 2),
('John', 'Cena', 1, 2),
('Greg', 'Olsen', 3, 3);

-- QUERIES
SELECT p.first_name, p.last_name, d.type, z.doctor_first_name, z.doctor_last_name
FROM patients p
JOIN diseases d
ON p.disease_id = d.id
JOIN doctors z
ON p.doctor_id = z.id;

SELECT p.first_name, p.last_name, d.type
FROM patients p
JOIN diseases d
ON p.disease_id = d.id;

SELECT p.first_name, p.last_name, d.type, z.doctor_first_name, z.doctor_last_name, h.name
FROM patients p
JOIN diseases d
ON p.disease_id = d.id
JOIN doctors z
ON p.doctor_id = z.id
JOIN hospitals h
ON z.hospital_id = h.id;


