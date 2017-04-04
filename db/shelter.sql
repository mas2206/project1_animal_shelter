DROP TABLE IF EXISTS adoptions;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS animals;

CREATE TABLE animals (
  id SERIAL2 PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  admission_date DATE,
  availability BOOLEAN
);

CREATE TABLE owners (
  id SERIAL2 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE adoptions (
  id SERIAL2 PRIMARY KEY,
  animal_id INT2 REFERENCES animals(id) ON DELETE CASCADE,
  owner_id INT2 REFERENCES owners(id) ON DELETE CASCADE
);