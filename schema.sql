/* Database schema to keep the structure of entire database. */
CREATE TABLE animals ( 
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL, 
    name varchar(100), 
    date_of_birth date, 
    escape_attempts int, 
    neutered boolean, 
    weight_kg decimal

    );

/*add species column to animals table*/
    ALTER TABLE animals ADD species VARCHAR(255);

/*create owners table*/
CREATE TABLE owners (
    id SERIAL PRIMARY KEY, 
    full_name VARCHAR(255), 
    age INT
    );

/*create species table*/
 CREATE TABLE species ( 
    id SERIAL PRIMARY KEY, 
    name VARCHAR(255)
    );


    ALTER TABLE animals DROP species;
    ALTER TABLE animals ADD species_id INT;
    ALTER TABLE animals ADD owner_id INT;