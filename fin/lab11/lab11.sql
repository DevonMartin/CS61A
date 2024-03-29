.read sp20data.sql

CREATE TABLE obedience AS
      SELECT seven, instructor 
        FROM students;

CREATE TABLE smallest_int AS
      SELECT time, smallest 
        FROM students 
       WHERE smallest > 2 
       ORDER BY smallest 
       LIMIT 20;

CREATE TABLE matchmaker AS
      SELECT a.pet, a.song, a.color, b.color
        FROM students as a, students as b
       WHERE a.pet = b.pet 
         AND a.song = b.song
         AND a.time < b.time;

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

-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks_helper(dogs, stack_height, last_height);

INSERT INTO stacks_helper 
     SELECT name, height, height
       FROM dogs 
      ORDER BY height DESC
      LIMIT (SELECT COUNT(*) FROM dogs) - 3;

INSERT INTO stacks_helper
     SELECT dogs || ", " || 
            (SELECT name
               FROM dogs
              WHERE height < last_height
              ORDER BY height DESC),
            1, 1
       FROM stacks_helper;


CREATE TABLE stacks AS
      SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";

CREATE TABLE smallest_int_having AS
      SELECT time, smallest 
        FROM students 
       WHERE smallest > 2 
       GROUP BY smallest 
      HAVING COUNT(*) = 1;

CREATE TABLE sp20favpets AS
      SELECT pet, COUNT(*) 
        FROM students 
       GROUP BY pet 
       ORDER BY -COUNT(*) 
       LIMIT 10;


CREATE TABLE sp20dog AS
  SELECT pet, COUNT(*) 
    FROM students 
   WHERE pet = "dog";


CREATE TABLE obedienceimages AS
  SELECT seven, instructor, COUNT(*) 
    FROM students 
   WHERE seven = '7' 
   GROUP BY instructor;