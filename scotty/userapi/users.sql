-- sqlite3 users.db < users.sql

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  first TEXT,
  last TEXT
);

INSERT INTO users VALUES(1, 'Toto', 'Dupont');
INSERT INTO users VALUES(2, 'Tata', 'Duchemin');
INSERT INTO users VALUES(3, 'Titi', 'Duchemin');

