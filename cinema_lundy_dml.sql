-- I'm going to keep my DML inserts brief since I struggled so hard with the 
-- ERD and DDL.

-- First, insert a couple old but passable movies into our movies table
-- We don't want to lose money like that dvd rental company we heard about recently..

INSERT INTO movies(
    movie_name,
    director_name,
    year_made
) VALUES (
    'Insidious',
    'James Wan',
    2010
);


-- deleting... kind of a hard reset

DELETE FROM movies;

-- It does not reset the SERIAL count for the PK.. but going to leave as is..


-- DEBUG

SELECT *
FROM employees;

-- Add second movie

INSERT INTO movies(
    movie_name,
    director_name,
    year_made
 ) VALUES(
    'Star Wars: A New Hope',
    'George Lucas',
    1977
 );

 -- Add a third

 INSERT INTO movies(
    movie_name,
    director_name,
    year_made
 ) VALUES(
    'Shrek',
    'Andrew Adamson',
    2001
 );

 -- Create a ticket

 INSERT INTO tickets(
    showing_time,
    ticket_price
 ) VALUES(
    1600,
    5.99
 );

-- Create a customer

INSERT INTO customers(
    point_bal,
    birth_month,
    phone_num,
    age
) VALUES(
    1500,
    'September',
    '7773423207',
    27
);

INSERT INTO ratings(
    rating_value
) VALUES 
    ('R'),
    ('PG'),
    ('PG-13'),
    ('G');
 
 UPDATE movies
 SET rating_value = 'PG-13'
 WHERE movie_id = 5

 UPDATE movies
 SET rating_value = 'PG'
 WHERE movie_id = 7

UPDATE movies
SET rating_value = 'PG'
WHERE movie_id = 6

-- Add to concessions.. had to remove the FK columns... idk why

INSERT INTO concessions(
    item_sku,
    item_price,
    short_description
) VALUES(
    00001,
    10,
    'Buttered Popcorn'
);

INSERT INTO concessions(
    item_sku,
    item_price,
    short_description
) VALUES (
    00002,
    8.95,
    'Sourpatch Kids'
)

-- Add location 1

INSERT INTO locations(
    city_name,
    country_name,
    screen_count,
    seats_per_screen
) VALUES (
    'Cuernavaca',
    'Mexico',
    5,
    52
);

-- add location 2

INSERT INTO locations(
    city_name,
    country_name,
    screen_count,
    seats_per_screen
) VALUES (
    'Tepoztlan',
    'Mexico',
    12,
    34
);

-- add employee 1

INSERT INTO employees(
    emp_lastname,
    job_title,
    hire_date,
    perf_review
) VALUES (
    'Lundy',
    'Janitor',
    '1998-05-05',
    'F-'
);

-- add employee 2

INSERT INTO employees(
    emp_lastname,
    job_title,
    hire_date,
    perf_review
) VALUES (
    'Flores',
    'Manager',
    '2013-02-18',
    'C+'
);

