/*Queries that provide answers to the questions from all projects.*/
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.3 AND 17.2;

/* transaction*/
BEGIN;
UPDATE animals
SET species = 'unspecified';

ROLLBACK;

/* transaction*/
BEGIN;
UPDATE animals
SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon' WHERE name NOT LIKE '%mon';
COMMIT;

/* transaction*/
BEGIN;
DELETE FROM animals;
ROLLBACK;

/* transaction*/
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT P1;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO P1;
UPDATE animals
SET weight_kg = weight_kg * -1 WHERE SIGN(weight_kg) = -1;
COMMIT;

/* queries */
SELECT COUNT(*) FROM animals;
SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT name FROM animals WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);
SELECT species, MAX(weight_kg) AS Max_weight, MIN(weight_kg) AS Min_weight FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) AS AVG_escape_attempts FROM animals WHERE date_of_birth >= '1990-01-01' and date_of_birth < '2001-01-01' GROUP BY species;
