/* Database Schema */

DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS labels;
DROP TABLE IF EXISTS genres;
DROP TABLE IF EXISTS music_albums;
DROP TABLE IF EXISTS games;
DROP TABLE IF EXISTS authors;

-- genres Table
CREATE TABLE genres(
  id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
)

-- music_albums Table
CREATE TABLE music_albums(
  id SERIAL NOT NULL PRIMARY KEY,
  publish_date DATE NOT NULL,
  name VARCHAR(100) NOT NULL,
  on_spotify BOOLEAN NOT NULL,
  archived BOOLEAN NOT NULL DEFAULT false 
)

-- games Table
CREATE TABLE games(
  id SERIAL NOT NULL PRIMARY KEY,
  multiplayer BOOLEAN NOT NULL,
  last_Played_at DATE NOT NULL,
  publish_date DATETIME NOT NULL,
  archived BOOLEAN NOT NULL DEFAULT false
);

-- authors Table
CREATE TABLE authors(
  id SERIAL NOT NULL PRIMARY KEY,
  first_name VARCHAR(150) NOT NULL,
  last_name VARCHAR(150) NOT NULL
);


-- books Table
CREATE TABLE books(
  id SERIAL NOT NULL PRIMARY KEY,
  author_id INT NULL REFERENCES authors(id) ON DELETE CASCADE,
  label_id INT NULL REFERENCES labels(id) ON DELETE CASCADE,
  publisher VARCHAR(255) NOT NULL,
  publication_date DATE NOT NULL,
  cover_state VARCHAR(100) NOT NULL,
  archived BOOLEAN NOT NULL DEFAULT false 
);

-- labels Table
CREATE TABLE labels(
  id SERIAL NOT NULL PRIMARY,
  title VARCHAR(200) NOT NULL,
  color VARCHAR(200) NOT NULL
);
