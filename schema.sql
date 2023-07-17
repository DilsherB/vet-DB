/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

CREATE TABLE animals(
  id INT GENERATED BY DEFAULT AS IDENTITY,
  name varchar(50),
  date_of_birth date,
  escape_attempts INT,
  neutered bool,
  weight_kg decimal
);

ALTER TABLE animals ADD COLUMN species TEXT;

CREATE TABLE owners(
  id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  full_name varchar(50),
  age INT
);

CREATE TABLE species(
  id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  name varchar(50)
);

ALTER TABLE animals ADD PRIMARY KEY(id),
  DROP COLUMN species,
  ADD COLUMN species_id INT REFERENCES species(id),
  ADD COLUMN owner_id INT REFERENCES owners(id);

CREATE TABLE vets(
  id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  name varchar(50),
  age INT,
  date_of_graduation date
);

CREATE TABLE specializations(
  species_id INT REFERENCES species(id),
  vet_id INT REFERENCES vets(id)
);

CREATE TABLE visits(
  animal_id INT REFERENCES animals(id),
  vet_id INT REFERENCES vets(id),
  date_of_visit date
);

ALTER TABLE owners ADD COLUMN email varchar(120);