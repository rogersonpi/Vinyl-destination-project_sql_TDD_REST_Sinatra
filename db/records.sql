DROP TABLE artists;
DROP TABLE albums;


CREATE TABLE albums
(
  id SERIAL8 primary key,
  title VARCHAR(255),
  genre VARCHAR(255),
  quantity INT2,
  price INT2,
  cost INT2
);

CREATE TABLE artists
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  album_id INT2 references albums(id)
);
