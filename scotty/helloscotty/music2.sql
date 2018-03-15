
-- sqlite3 music2.db < music2.sql

CREATE TABLE artists (
  id INTEGER PRIMARY KEY, 
  name TEXT
);
INSERT INTO artists VALUES(0, 'Beethoven');
INSERT INTO artists VALUES(1, 'System of a down');

CREATE TABLE titles (
  id INTEGER PRIMARY KEY, 
  artist INTEGER, 
  name TEXT, 
  FOREIGN KEY(artist) REFERENCES artists(id)
);
INSERT INTO titles VALUES(0, 0, 'Sonate au clair de lune');
INSERT INTO titles VALUES(1, 1, 'Toxicity');
INSERT INTO titles VALUES(2, 1, 'Roulette');

