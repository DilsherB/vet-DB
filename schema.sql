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

ALTER TABLE
  animals
ADD
  COLUMN species TEXT;

