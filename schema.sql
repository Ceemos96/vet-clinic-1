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

/*create vets table*/
CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    age INT,
    date_of_graduation date
    );

/*create many-to-many table for vets*/
 CREATE TABLE specializations ( 
    id SERIAL PRiMARY KEY, 
    species_id INT REFERENCES 
    species(id) ON DELETE CASCADE, 
    vet_id INT REFERENCES vets(id) ON DELETE CASCADE 
    );

/*create many-to-many table for visits*/
CREATE TABLE visits ( 
    id SERIAL PRIMARY KEY, 
    animal_id INT REFERENCES animals(id) ON DELETE CASCADE, 
    vet_id INT REFERENCES vets(id) ON DELETE CASCADE, 
    date_of_visit DATE 
    );