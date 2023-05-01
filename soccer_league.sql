-- psql < soccer_league.sql

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE league
(
id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
start_date DATE NOT NULL,
end_date DATE NOT NULL
);

CREATE TABLE teams
(
id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
league_id INTEGER REFERENCES league,
standing TEXT NOT NULL
);

CREATE TABLE players
(
id SERIAL PRIMARY KEY,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL,
team_id INTEGER REFERENCES teams
);

CREATE TABLE referees
(
id SERIAL PRIMARY KEY,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL
);

CREATE TABLE matches
(
id SERIAL PRIMARY KEY,
team1_id INTEGER REFERENCES teams,
team2_id INTEGER REFERENCES teams,
referee_id INTEGER REFERENCES referees,
goal_scorer_id INTEGER REFERENCES players
);

--  _____________________________________________

INSERT INTO league
(name, start_date, end_date)
VALUES
('Champions League', '2022-08-25', '2023-04-14');

INSERT INTO teams
(name, league_id, standing)
VALUES
('Chelsea', 1, '2nd'),
('Barcelona', 1, '1st'),
('Arsenal', 1, '3rd'),
('PSG', 1, '4th');

INSERT INTO players
(first_name, last_name, team_id)
VALUES
('Robert', 'Lewandowski', 2),
('Gabriel', 'Jesus', 3),
('Christian', 'Pulisic', 1),
('Lionel', 'Messi', 4);

INSERT INTO referees
(first_name, last_name)
VALUES
('Matt', 'Lahoz'),
('Gianni', 'Loui'),
('Craig', 'Jarrett');

INSERT INTO matches
(team1_id, team2_id, referee_id, goal_scorer_id)
VALUES
(1, 2, 1, 1),
(3, 4, 2, 4);

-- QUERY


SELECT m.id AS match, team1.name AS team1, team2.name AS team2, r.first_name AS referee_first_name, r.last_name AS referee_last_name, p.first_name AS goalscorer_first_name, p.last_name AS goalscorer_last_name
FROM matches m
JOIN teams AS team1 ON m.team1_id = team1.id
JOIN teams AS team2 ON m.team2_id = team2.id
JOIN referees r ON m.referee_id = r.id
JOIN players p on m.goal_scorer_id = p.id;
