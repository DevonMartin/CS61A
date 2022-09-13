CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;

-- copy your solution from prev hw!
-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT name, size FROM dogs JOIN sizes
         WHERE height > min AND height <= max;

-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
      SELECT child 
        FROM parents 
        JOIN dogs
       WHERE name = parent
       ORDER BY height DESC;

-- Filling out this helper table is optional
CREATE TABLE siblings AS
      SELECT DISTINCT a.name as a_name, b.name as b_name
        FROM dogs as a 
        JOIN dogs as b 
        JOIN parents 
       WHERE (SELECT parent FROM parents           WHERE child = a.name)  = (SELECT parent FROM parents           WHERE child = b.name)
         AND (SELECT size   FROM size_of_dogs as c WHERE a.name = c.name) = (SELECT size   FROM size_of_dogs as c WHERE b.name = c.name)
         AND a.name < b.name;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT a_name || " and " || b_name || " are " || 
         (SELECT size from size_of_dogs WHERE name = a_name)
         || " siblings" 
    FROM siblings;