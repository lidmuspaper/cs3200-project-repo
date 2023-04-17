DROP DATABASE IF EXISTS plantapp;
CREATE DATABASE IF NOT EXISTS plantapp;

grant all privileges on plantapp.* to 'webapp'@'%';
flush privileges;

use plantapp;

CREATE TABLE IF NOT EXISTS User
(
    user_id          int UNIQUE AUTO_INCREMENT PRIMARY KEY,
    full_name        varchar(100),
    email            varchar(100) NOT NULL,
    Experience_level int,
    city             varchar(50),
    state            varchar(50),
    zip_code         int
);

CREATE TABLE IF NOT EXISTS Weather
(
    Chance_of_rain float,
    Temperature    float,
    Sunlight       float,
    Humidity       float,
    user_id        int UNIQUE,
    FOREIGN KEY (user_id) REFERENCES User (user_id)
);

CREATE TABLE IF NOT EXISTS Plant_info
(
    name                varchar(200) PRIMARY KEY,
    ideal_humidity      float,
    ideal_temp          float,
    conservation_status varchar(200),
    taxonomy            varchar(200),
    visual_description  varchar(200),
    description         varchar(200)
);

CREATE TABLE IF NOT EXISTS Plant
(
    size       float,
    age        int,
    plant_name varchar(50),
    shown_name varchar(50),
    plant_id   int PRIMARY KEY AUTO_INCREMENT,
    user_id    int,
    FOREIGN KEY (plant_name) REFERENCES Plant_info (name),
    FOREIGN KEY (user_id) REFERENCES User (user_id)
);

CREATE TABLE IF NOT EXISTS Plant_care_routine
(
    plant_id          int UNIQUE,
    routine_name      varchar(200),
    watering_timer    int,
    fertilizing_timer int,
    repotting_timer   int,
    last_fertilized   date,
    last_repotted     date,
    last_watered      date,
    type_fertilizer   varchar(50),
    pot_size          float,
    soil_type         varchar(50),
    watering_amount   float,

    FOREIGN KEY (plant_id) REFERENCES Plant (plant_id)
);

CREATE TABLE IF NOT EXISTS Illness
(
    illness_name varchar(50) PRIMARY KEY,
    severity     int,
    treatments   varchar(50),
    symptoms     varchar(50)
);

CREATE TABLE IF NOT EXISTS PLANT_ILLNESS
(
    illness_id   int AUTO_INCREMENT PRIMARY KEY,
    plant_id     int,
    illness_name varchar(50),
    FOREIGN KEY (plant_id) references Plant (plant_id),
    FOREIGN KEY (illness_name) references Illness (illness_name)
);

CREATE TABLE IF NOT EXISTS Location
(
    location_name varchar(50) PRIMARY KEY,
    temp          float,
    humidity      float,
    sunlight      float
);

CREATE TABLE IF NOT EXISTS PLANT_LOCATION
(
    location_id   int AUTO_INCREMENT primary key,
    plant_id      int,
    location_name varchar(50),
    FOREIGN KEY (plant_id) references Plant (plant_id),
    FOREIGN KEY (location_name) references Location (location_name)
);

CREATE TABLE IF NOT EXISTS Gardens
(
    ID       int UNIQUE AUTO_INCREMENT PRIMARY KEY,
    name     varchar(50),
    city     varchar(50),
    state    varchar(50),
    zip_code int,
    email    varchar(100) NOT NULL,
    phone    varchar(20)  NOT NULL
);

CREATE TABLE IF NOT EXISTS Product
(
    product_id  int AUTO_INCREMENT PRIMARY KEY,
    type        varchar(50),
    name        varchar(50),
    description varchar(500) NOT NULL,
    stock       boolean,
    garden_id   int,
    FOREIGN KEY (garden_id) references Gardens (id)
);

CREATE TABLE IF NOT EXISTS Inventory
(
    ID          int AUTO_INCREMENT PRIMARY KEY,
    garden_id   int,
    last_update datetime DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (garden_id) references Gardens (id)
);

CREATE TABLE IF NOT EXISTS Purchases
(
    order_id      int AUTO_INCREMENT PRIMARY KEY,
    Shipment_type varchar(50),
    Storage       varchar(50),
    Product_ID    int UNIQUE,
    Order_date    datetime DEFAULT CURRENT_TIMESTAMP,
    Arrival_date  datetime DEFAULT CURRENT_TIMESTAMP,
    user_id       int UNIQUE,
    FOREIGN KEY (user_id) references User (user_id),
    FOREIGN KEY (product_id) REFERENCES Product (product_id)
);

INSERT INTO User (full_name, user_id, email, Experience_level, city, state, zip_code)
VALUES ('Jane Doe', 1, 'jane@example.com', 1, 'Los Angeles', 'CA', 90001),
       ('John Smith', 2, 'john@example.com', 2, 'New York', 'NY', 10001);

INSERT INTO Weather (Chance_of_rain, Temperature, Sunlight, Humidity, user_id)
VALUES (50.0, 100.0, 100.0, 0.0, 1),
       (0.0, 0.0, 10.0, 10.0, 2);

INSERT INTO Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description,
                        description)
VALUES ('Spider plant', 60.0, 20.0, 'Not threatened', 'Chlorophytum comosum', 'Green and white striped leaves',
        'A hardy and adaptable plant that is great for beginners'),
       ('Peace Lily', 70.0, 22.0, 'Least Concern', 'Spathiphyllum wallisii',
        'Glossy dark green leaves and white flowers',
        'A popular and easy-to-care-for indoor plant');

INSERT INTO Plant (size, age, plant_name, shown_name, user_id)
VALUES (12.5, 2, 'Spider Plant', 'First Spider Plant', 1),
       (16.8, 3, 'Peace Lily', 'Peace Lily in the Backyard', 2);


INSERT INTO Plant_care_routine (plant_id, routine_name, watering_timer, fertilizing_timer, repotting_timer,
                                last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type,
                                watering_amount)
VALUES (1, 'Summer Routine', 1, 5, 10, '2022-02-01', '2022-03-01', '2022-03-01', 'All-purpose fertilizer', 6.0,
        'Potting mix', 250.5),
       (2, 'Peace Lily', 2, 10, 20, '2022-02-15', '2022-01-15', '2022-02-28', 'Liquid fertilizer', 8.0,
        'Potting mix with perlite', 300.75);

INSERT INTO Illness (illness_name, severity, treatments, symptoms)
VALUES ('Blight', 2, 'Remove infected leaves, increase humidity', 'Yellowing leaves, brown spots'),
       ('Common Cold', 3, 'Remove infected leaves, treat with fungicide', 'Brown tips on leaves, wilting leaves');

INSERT INTO PLANT_ILLNESS (illness_id, plant_id, illness_name)
VALUES (1, 1, 'Blight'),
       (2, 2, 'Common Cold');

INSERT INTO Location (location_name, temp, humidity, sunlight)
VALUES ('Backyard', 10.0, 50.0, 10.0),
       ('Living Room', 30.0, 70.0, 0.0);

INSERT INTO PLANT_LOCATION (location_id, plant_id, location_name)
VALUES (1, 1, 'Backyard'),
       (2, 2, 'Living Room');

INSERT INTO Gardens (ID, name, city, state, zip_code, email, phone)
VALUES (1, 'The Big Garden', 'Austin', 'Texas', 10000, 'thebiggarden@thebiggdarden.com', '8008888888'),
       (2, 'The Small Garden', 'Portland', 'Ohio', 99999, 'thesmallgarden@thesmallgdarden.com', '911');

INSERT INTO Product (product_id, type, name, description, stock, garden_id)
VALUES (1, 'Fertilizer', 'Miracle-Gro All Purpose Plant Food',
        'A water-soluble fertilizer that provides all essential nutrients for plants', true, 1),
       (2, 'Fungicide', 'Bonide Fung-onil Multi-purpose Fungicide',
        'A broad-spectrum fungicide that controls and prevents many fungal diseases on plants', false, 2);

INSERT INTO Inventory (garden_id, last_update)
VALUES (1, '2022-02-01'),
       (2, '2022-02-01');

INSERT INTO Purchases (order_id, Shipment_type, Storage, Product_ID, Order_date, Arrival_date, user_id)
VALUES (1, 'Standard', 'Cool and dry place', 1, '2022-02-15 10:30:00', '2022-02-22 14:30:00', 1),
       (2, 'Express', 'Refrigerated', 2, '2022-02-28 13:15:00', '2022-03-02 16:45:00', 2);