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