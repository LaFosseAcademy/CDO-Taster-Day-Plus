DROP TABLE IF EXISTS players;

CREATE TABLE players (
    player_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name text NOT NULL, 
    nationality text NOT NULL,
    age int NOT NULL,
    position text NOT NULL,
    team text NOT NULL
); 

INSERT INTO players (name, nationality, age, position, team) VALUES
('Erling Haaland', 'Norwegian', 24, 'Forward', 'Manchester City'),
('Bukayo Saka', 'English', 23, 'Midfielder', 'Arsenal'),
('Mohamed Salah', 'Egyptian', 32, 'Forward', 'Liverpool'),
('Bruno Fernandes', 'Portuguese', 29, 'Midfielder', 'Manchester United'),
('Son Heung-min', 'South Korean', 32, 'Forward', 'Tottenham Hotspur'),
('Declan Rice', 'English', 25, 'Midfielder', 'Arsenal'),
('Virgil van Dijk', 'Dutch', 33, 'Defender', 'Liverpool'),
('Nick Pope', 'English', 32, 'Goalkeeper', 'Newcastle United'),
('James Maddison', 'English', 27, 'Midfielder', 'Tottenham Hotspur'),
('Marcus Rashford', 'English', 26, 'Forward', 'Manchester United'),
('Rodri', 'Spanish', 28, 'Midfielder', 'Manchester City'),
('Kai Havertz', 'German', 25, 'Forward', 'Arsenal'),
('Kieran Trippier', 'English', 34, 'Defender', 'Newcastle United'),
('Gabriel Jesus', 'Brazilian', 27, 'Forward', 'Arsenal'),
('Ruben Dias', 'Portuguese', 27, 'Defender', 'Manchester City'),
('Dominic Calvert-Lewin', 'English', 27, 'Forward', 'Everton'),
('Alexander Isak', 'Swedish', 25, 'Forward', 'Newcastle United'),
('Amadou Onana', 'Belgian', 23, 'Midfielder', 'Everton');

