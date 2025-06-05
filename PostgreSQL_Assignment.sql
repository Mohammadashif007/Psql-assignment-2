-- ! table creation for rangers
CREATE TABLE
    rangers (
        ranger_id SERIAL NOT NULL PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        region VARCHAR(100) NOT NULL
    );
    -- ! table creation for species
CREATE TABLE
    species (
        species_id SERIAL NOT NULL PRIMARY KEY,
        common_name VARCHAR(100) NOT NULL,
        scientific_name VARCHAR(100) NOT NULL,
        discovery_date DATE NOT NULL,
        conservation_status VARCHAR(100) NOT NULL
    );
    -- ! table creation for sightings
CREATE TABLE
    sightings (
        sighting_id SERIAL NOT NULL PRIMARY KEY,
        ranger_id INT NOT NULL,
        species_id INT NOT NULL,
        sighting_time TIMESTAMP NOT NULL,
        location VARCHAR(100) NOT NULL,
        notes VARCHAR(100),
        FOREIGN KEY (ranger_id) REFERENCES rangers (ranger_id),
        FOREIGN KEY (species_id) REFERENCES species (species_id)
    );