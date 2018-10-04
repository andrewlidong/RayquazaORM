CREATE TABLE dogs (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  owner_id INTEGER,

  FOREIGN_KEY(owner_id) REFERENCES human(id)
);

CREATE TABLE humans (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL,
  house_id INTEGER,

  FOREIGN_KEY(house_id) REFERENCES human(id)
);

CREATE TABLE houses (
  id INTEGER PRIMARY KEY,
  address VARCHAR(255) NOT NULL
);

INSERT INTO
  houses (id, address)
VALUES
  (1, "301 E 79th Street"), (2, "22 W 38th Street");
INSERT INTO
  humans (id, fname, lname, house_id)
VALUES
  (1, "Andrew", "Dong", 1),
  (2, "Karen", "Xu", 1),
  (3, "Abigail", "Hirsch", 2),
  (4, "Dogless", "Human", NULL);

INSERT INTO
  dogs (id, name, owner_id)
VALUES
  (1, "Martingale", 1),
  (2, "Picasso", 2),
  (3, "Oscar", 3),
  (4, "Mashu", 3),
  (5, "Stray Dog", NULL)
