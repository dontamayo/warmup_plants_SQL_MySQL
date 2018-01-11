\c plants_store_db

-- Utilize a join to select all medium size plants and pots.
SELECT * FROM plants JOIN plant_pots ON plants.size = plant_pots.size WHERE plant_pots.size = 'medium';

-- More specific join on columns
SELECT plants.name, pots.size, pots.color, pots.material  FROM plants JOIN plant_pots AS pots  ON plants.size = pots.size WHERE plants.size = 'medium';

-- Find any perennial plants and biodegradeable pots
SELECT plants.name, plants.lifecyle, pots.biodegradeable FROM plants JOIN plant_pots AS pots ON plants.size = pots.size WHERE pots.biodegradeable = True and plants.lifecyle = 'perennial';
