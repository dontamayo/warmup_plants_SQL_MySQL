\c plants_store_db
INSERT
  INTO plants
    (name, flowering, edible, soil_type, leaf_color, lifecyle, size)
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
