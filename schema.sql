/* Database Schema */

DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS labels;
DROP TABLE IF EXISTS genres;
DROP TABLE IF EXISTS music_albums;
DROP TABLE IF EXISTS games;
DROP TABLE IF EXISTS authors;

-- genres Table


-- music_albums Table


-- games Table



-- authors


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