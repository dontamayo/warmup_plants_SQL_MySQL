# SQL
## WARM UP


![Seeding Understanding](http://tipsplants.com/sites/default/files/peace_lily_indoor_0.jpg)



Create a project directory to play with your SQL tables.

 ```shell
 mkdir plants_warmup
 cd plants_warmup
 ```

Let's make a plants database

  ```shell
  createdb plant_store_db
  ```

 Then sketch out some entities

 ```

 |            Plant           |
 |----------------------------|
 | id: pk                     |
 | name: varchar(255)         |
 | lifecycle: plant_life_span |
 | flowering: boolean         |
 | edible: boolean            |
 | leaf_color: varchar(50)    |
 | size: plant_size           |
 | soil_type: varchar         |

 | CompanionChart                 |
 |--------------------------------|
 | id: serial                     |
 | plant_id: references plant     |
 | companion_id: references plant |
 | category: varchar              |
 | score: integer                 |

 |      Plant Pot         |
 |------------------------|
 | size: plant_size       |
 | color: varchar(50)     |
 | material: varchar(50)  |
 | biodegradable: boolean |
 | draining: boolean      |

 ```


Let's begin creating our actual plant table  

 |            Plant           |
 | :-------------------------- |
 | id: pk                     |
 | name: varchar(255)         |
 | lifecycle: plant_life_span |
 | flowering: boolean         |
 | edible: boolean            |
 | leaf_color: varchar(50)    |
 | size: plant_size           |
 | soil_type: varchar         |

```sql
CREATE TABLE plants (
  id SERIAL PRIMARY KEY,
  name varchar(255) NOT NULL UNIQUE,
  flowering boolean NOT NULL,
  edible boolean NOT NULL,
  leaf_color varchar(50) NOT NULL,
  soil_type varchar(100) NOT NULL
);
```

 Then we need to define **special data types** for `plant_size` and `lifecycle`.

 ```sql
 CREATE TYPE plant_life_span AS ENUM ('annual', 'biennial', 'perennial', 'unknown');
 CREATE TYPE plant_size AS ENUM ('tiny', 'small', 'medium', 'large', 'huge', 'unknown');
 ```

 This creates a custom enumerated type where the column has to have one of the specified values.

 Then we can alter our plant table to include the new type.

 ```sql
  ALTER TABLE plants
   ADD COLUMN lifecycle plant_life_span NOT NULL DEFAULT 'unknown',
   ADD COLUMN size plant_size  NOT NULL DEFAULT 'unknown';
 ```

 Let's insert some seed data for plants

 ```
 INSERT
   INTO plants
     (name, flowering, edible, soil_type, leaf_color, lifecycle, size)
   VALUES
     ('Peace Lilly', true, false, 'peat,perlite,bark', 'green', 'perennial', 'small'),
     -- effectively not flowering
     ('Snake Plant - Sansevieria Zeylanica', false, false, 'cacti mix', 'varigated greens', 'perennial', 'medium'),
     ('Snake Plant - Sansevieria Laurentii', false, false, 'cacti mix', 'varigated green yellow', 'perennial', 'small'),
     ('Maidenhair Fern - Adiantum raddianum', false, false, 'peat mix with moss', 'light green', 'perennial', 'medium'),
     ('Tomatoes', true, true, 'sandy loam',  'green', 'annual', 'medium'),
     ('Carrot', true, true,  'sandy loam', 'green', 'biennial', 'small'),
     ('Basil', true, true, 'sandy loam', 'green', 'annual', 'small'),
     ('Potato', true, true, 'loam soil', 'dark green', 'annual', 'medium');
 ```


 ![Cacti](http://www.costafarms.com/CostaFarms/1-Costa-Fams-Cactus-Hero.jpg?height=411&width=856&scale=both)

 Let's create companion scores


 | CompanionChart                 |
 | :------------------------------- |
 | id: serial                     |
 | plant_id: references plant     |
 | companion_id: references plant |
 | category: varchar              |
 | score: integer                 |

 ```sql
 CREATE TABLE companion_chart (
   id SERIAL PRIMARY KEY,
   plant_id integer NOT NULL references plants,
   companion_id integer NOT NULL references plants,
   category varchar(255),
   score integer NOT NULL
 );
 ```


 ```sql
 INSERT
  INTO companion_chart
    (plant_id, companion_id, category, score)
  VALUES
    -- Potato & Carrot
    (8, 6, 'stunting growth ', -2),
    -- Potato & Basil
    (8, 7, 'enhances flavor', 4),
    -- Tomato & Carrot
    (5, 6, 'encourages growth', 5),
    -- Tomato & Basil
    (5, 7, 'enhances flavor', 5);
 ```

 ![carrot](https://insteading-wpengine.netdna-ssl.com/wp-content/uploads/2017/01/carrots-growing.jpeg)


 ### Exercises

 ![Plant pot](http://plantsrescue.com/wp-content/uploads/2013/05/ornamental-pots.jpg)

 * Create a `plant_pots` table.
 * Insert some plants pots of various sizes and colors.
 * **GOOGLING**: Find three house plants and insert their data into your `plants` table. Bonus: points for finding plants that are edible or non-flowering. SUPER BONUS: can you find a `binennial` plant?
 * Utilize a join to select all `medium` size plants and pots.
    * Try selecting only their colors
 * Someone is repoting their `peace lilly`. What kind of soil mix do they need?
 * Someone is looking for a **small** perennial plant and a biodegradable pot. Write a query to show them some names.
