\c plants_store_db
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
