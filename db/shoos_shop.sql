DROP TABLE IF EXISTS orders;

CREATE TABLE orders(
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  address VARCHAR(255),
  quantity INT2,
  size VARCHAR(255)
);