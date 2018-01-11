\c plants_store_db
CREATE TABLE companion_chart (
  id SERIAL PRIMARY KEY,
  plant_id integer NOT NULL references plants,
  companion_id integer NOT NULL references plants,
  category varchar(255),
  score integer NOT NULL
);
