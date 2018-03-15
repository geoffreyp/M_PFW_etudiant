
-- sqlite3 music1.db < music1.sql

CREATE TABLE artists (
  id INTEGER PRIMARY KEY, 
  name TEXT
);
INSERT INTO artists VALUES(0, 'Radiohead');
INSERT INTO artists VALUES(1, 'Rage against the machine');
INSERT INTO artists VALUES(2, 'Ibrahim Maalouf');

CREATE TABLE titles (
  id INTEGER PRIMARY KEY, 
  artist INTEGER, 
  name TEXT, 
  FOREIGN KEY(artist) REFERENCES artists(id)
);
INSERT INTO titles VALUES(0, 0, 'Paranoid android');
INSERT INTO titles VALUES(1, 0, 'Just');
INSERT INTO titles VALUES(2, 1, 'Take the power back');
INSERT INTO titles VALUES(3, 1, 'How could I just kill a man');
INSERT INTO titles VALUES(4, 2, 'La porte bonheur');

