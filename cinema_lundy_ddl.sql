-- Alright, I decided to reuse the existing elephantSQL connection we used in class, renamed the connection, and now
-- I will delete the tables we created before

DROP TABLE bank;
DROP TABLE car;
DROP TABLE customer;

-- ...Okay I thought I would be all fancy and have various FK links to other columns.. But I had to learn the hard way that 
-- They have to be linked to either a UNIQUE constraint or be PK for some reason. Seems semantic?


-- Using my ERD that I lovingly created, I will create my tables. Now, the hard part
-- is knowing which order to do them in... I guess movies will come first!


CREATE TABLE movies(
    movie_id SERIAL PRIMARY KEY,
    movie_name VARCHAR(75),
    director_name VARCHAR(50),
    rating_value VARCHAR(5)
);


-- Next we create tickets so that we can link the FK to movies

CREATE TABLE tickets(
    ticket_id SERIAL PRIMARY KEY,
    showing_time INTEGER,
    ticket_price FLOAT,
    movie_id INTEGER,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

-- Then we can create the customers table to link to tickets

CREATE TABLE customers(
    loyalty_id SERIAL PRIMARY KEY,
    point_bal INTEGER,
    birth_month VARCHAR(10),
    phone_num VARCHAR(15),
    ticket_id INTEGER,
    FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id)
);

-- Next, concessions will be created to link to customers

CREATE TABLE concessions(
    item_sku INTEGER PRIMARY KEY,
    item_price MONEY,
    short_description VARCHAR(25),
    stock_amt INTEGER,
    discount_avail BOOLEAN
);

-- Now, location and employees

CREATE TABLE locations(
    store_id SERIAL PRIMARY KEY,
    city_name VARCHAR(50),
    country_name VARCHAR(50),
    screen_count INTEGER,
    seats_per_screen INTEGER,
    employee_count INTEGER
);

CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    emp_lastname VARCHAR(25),
    job_title VARCHAR(25),
    hire_date DATE,
    perf_review VARCHAR(3)
);

CREATE TABLE ratings(
    rating_id SERIAL PRIMARY KEY,
    rating_value VARCHAR(5) UNIQUE
)

-- After creating the ratings table, I had to add the previous refs to FKs back pointing to it..
-- Added new column to tickets and link FK to ratings

ALTER TABLE tickets
ADD COLUMN rated_r_check BOOLEAN;

-- I wanted to change it from BOOLEAN to just VARCHAR

ALTER TABLE tickets
ALTER COLUMN rated_r_check TYPE VARCHAR(5);

-- Which allowed me to add the FK:

ALTER TABLE tickets
ADD FOREIGN KEY (rated_r_check) REFERENCES ratings(rating_value);

-- I should be able to point movies(rating_value) to our new table..??

ALTER TABLE movies
ADD FOREIGN KEY (rating_value) REFERENCES ratings(rating_value);

-- Changing concessions discount_avail to VARCHAR

ALTER TABLE concessions
ALTER COLUMN discount_avail TYPE VARCHAR(5);

-- Adding FK link from concessions to location

ALTER TABLE concessions
ADD FOREIGN KEY (stock_amt) REFERENCES locations(store_id);


-- Aight so apparently FKs need the same datatype as PKs... cool
-- Deleting discount_avail, readding it..

ALTER TABLE concessions
DROP COLUMN discount_avail;

ALTER TABLE concessions
ADD COLUMN discount_avail INTEGER;

ALTER TABLE concessions
ADD FOREIGN KEY (discount_avail) REFERENCES customers(loyalty_id);

-- Adding year to movies, makes sense..

ALTER TABLE movies
ADD COLUMN year_made INTEGER;

-- Adding age to customers

ALTER TABLE customers
ADD COLUMN age INTEGER;