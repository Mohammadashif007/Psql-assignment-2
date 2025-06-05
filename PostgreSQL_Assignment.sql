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

-- ! insert data into rangers table
INSERT INTO
    rangers (name, region)
VALUES
    ('Alice Green', 'Northern Hills'),
    ('Bob White', 'River Delta'),
    ('Carol King', 'Mountain Range');

-- ! insert data into species table
INSERT INTO
    species (
        common_name,
        scientific_name,
        discovery_date,
        conservation_status
    )
VALUES
    (
        'Snow Leopard',
        'Panthera uncia',
        '1775-01-01',
        'Endangered'
    ),
    (
        'Bengal Tiger',
        'Panthera tigris tigris',
        '1758-01-01',
        'Endangered'
    ),
    (
        'Red Panda',
        'Ailurus fulgens',
        '1825-01-01',
        'Vulnerable'
    ),
    (
        'Asiatic Elephant',
        'Elephas maximus indicus',
        '1758-01-01',
        'Endangered'
    );

-- ! insert data into sightings table
INSERT INTO
    sightings (
        species_id,
        ranger_id,
        location,
        sighting_time,
        notes
    )
VALUES
    (
        1,
        1,
        'Peak Ridge',
        '2024-05-10 07:45:00',
        'Camera trap image captured'
    ),
    (
        2,
        2,
        'Bankwood Area',
        '2024-05-12 16:20:00',
        'Juvenile seen'
    ),
    (
        3,
        3,
        'Bamboo Grove East',
        '2024-05-15 09:10:00',
        'Feeding observed'
    ),
    (
        1,
        2,
        'Snowfall Pass',
        '2024-05-18 18:30:00',
        (NULL)
    );


-- ! Problem No. 1
INSERT INTO
    rangers (name, region)
VALUES
    ('Derek Fox', 'Coastal Plains');

-- ! Problem No. 2
SELECT
    count(DISTINCT species_id) as unique_species_count
FROM
    sightings;

-- ! Problem No. 3
SELECT
    *
FROM
    sightings
WHERE
    location ILIKE '%pass%';

-- ! Problem No. 4
SELECT
    name,
    count(rangers.name) as total_sightings
FROM
    sightings
    JOIN rangers ON sightings.ranger_id = rangers.ranger_id
GROUP BY
    rangers.name
ORDER BY
    name;

-- ! Problem No. 5
SELECT
    common_name
FROM
    sightings
    RIGHT JOIN species ON sightings.species_id = species.species_id
WHERE
    sighting_id is NULL;

-- ! Problem No. 6
SELECT
    common_name,
    sighting_time,
    name
FROM
    sightings
    JOIN rangers ON sightings.ranger_id = rangers.ranger_id
    JOIN species ON sightings.species_id = species.species_id
ORDER BY
    sighting_time DESC
LIMIT
    2;

-- ! Problem No. 7
UPDATE species
SET
    conservation_status = 'Historic'
WHERE
    discovery_date < '1800-01-01';

-- ! Problem No. 8
SELECT
    sighting_id,
    CASE
        WHEN EXTRACT(
            HOUR
            FROM
                sighting_time
        ) < 12 THEN 'Morning'
        WHEN EXTRACT(
            HOUR
            FROM
                sighting_time
        ) >= 12
        AND EXTRACT(
            HOUR
            FROM
                sighting_time
        ) < 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM
    sightings;

-- ! Problem No. 9
DELETE FROM rangers
WHERE ranger_id IN
    (
        SELECT
            rangers.ranger_id
        FROM
            sightings
            RIGHT JOIN rangers ON sightings.ranger_id = rangers.ranger_id
        WHERE
            sightings.ranger_id is NULL
    );
