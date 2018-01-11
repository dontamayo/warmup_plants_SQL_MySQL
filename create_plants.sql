\c plants_store_db

CREATE TABLE plants (
  id SERIAL PRIMARY KEY,
  name varchar(225) NOT NULL UNIQUE,
  flowering boolean NOT NULL,
  edible boolean NOT NULL,
  leaf_color varchar(50) NOT NULL,
  soil_type varchar(100) NOT NULL
);

CREATE TYPE plant_life_span AS ENUM ('annual', 'biennial', 'perennial', 'unknown');
CREATE TYPE plant_size AS ENUM ('tiny', 'small', 'medium', 'large', 'huge', 'unknown');

ALTER TABLE plants
  ADD COLUMN lifecyle plant_life_span NOT NULL DEFAULT 'unknown',
  ADD COLUMN size plant_size NOT NULL DEFAULT 'unknown';
