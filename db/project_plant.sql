CREATE DATABASE plantapp;
Use plantapp;


CREATE TABLE Plant_care_routline
(
    plant_name          varchar(50) PRIMARY KEY,
    fertilizer_Schedule date,
    type_fertilizer     varchar(50),
    last_fertilizer     date,
    repotting_schedule  date,
    pot_size            varchar(50),
    soil_type           varchar(50),
    last_repotting      date,
    watering_amount     float,
    watering_schedule   date,
    last_watering       date
);

CREATE TABLE Illness
(
    plant_name varchar(50) PRIMARY KEY,
    severity varchar(50),
    treatments varchar(50),
    symptoms varchar(50)
);

CREATE TABLE Plant_info
(
    plant_id int PRIMARY KEY,
    ideal_humidity varchar(50),
    ideal_temp float,
    conservation_status varchar(200),
    taxonomy varchar(200),
    visual_description varchar(200),
    description varchar(200)
);

CREATE TABLE User
(
    full_name varchar(100) PRIMARY KEY,
    user_id int UNIQUE ,
    email varchar(100) NOT NULL,
    Experience_level varchar(50),
    city varchar(50),
    state varchar(50),
    zip_code int,
    order_id int UNIQUE ,
    plant_name varchar(50)
);

CREATE TABLE Plant
(
    size       float,
    age        int,
    plant_name varchar(50),
    plant_id int PRIMARY KEY,
    user_id int UNIQUE,
    FOREIGN KEY (plant_name) REFERENCES Plant_care_routline (plant_name),
    FOREIGN KEY (plant_name) REFERENCES Illness (plant_name),
    FOREIGN KEY (plant_id) REFERENCES Plant_info (plant_id),
    FOREIGN KEY (user_id) REFERENCES User (user_id)
);

CREATE TABLE Inventory
(
    ID int PRIMARY KEY ,
    last_update datetime DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Purchases
(
    order_id int PRIMARY KEY,
    Shipment_type varchar(50),
    Storage varchar(50),
    Product_ID int UNIQUE ,
    Order_date datetime DEFAULT CURRENT_TIMESTAMP,
    Arrival_date datetime DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES User (order_id)
);

CREATE TABLE Product
(
    P_ID int,
    type varchar(50),
    name varchar(50) PRIMARY KEY,
    description varchar(500) NOT NULL,
    FOREIGN KEY (P_ID) REFERENCES Purchases (Product_ID)
);

CREATE TABLE Gardens
(
    ID int UNIQUE ,
    name varchar(50) PRIMARY KEY ,
    city varchar(50),
    state varchar(50),
    zip_code int,
    email varchar(100) NOT NULL ,
    phone int NOT NULL,
    FOREIGN KEY (ID) REFERENCES Product (P_ID),
    FOREIGN KEY (ID) REFERENCES Inventory (ID)
);


CREATE TABLE Location
(
    location_name varchar(50) PRIMARY KEY,
    temp float,
    humidity varchar(50),
    sunlight varchar(50),
    user_id int UNIQUE,
    FOREIGN KEY (user_id) REFERENCES User (user_id)
);

CREATE TABLE Weather
(
    rain_chance float,
    temp float,
    sunlight varchar(50),
    humidity varchar(50),
    user_id int PRIMARY KEY,
    FOREIGN KEY (user_id) REFERENCES User (user_id)
);

INSERT INTO Plant_care_routline (plant_name, fertilizer_Schedule, type_fertilizer, last_fertilizer, repotting_schedule,
                                 pot_size, soil_type, last_repotting, watering_amount, watering_schedule, last_watering)
VALUES ('Spider Plant', '2022-03-01', 'All-purpose fertilizer', '2022-02-01', '2023-03-01', '6-inch', 'Potting mix',
        '2022-10-01', 250.5, '2022-02-01', '2022-03-15'),
       ('Peace Lily', '2022-02-15', 'Liquid fertilizer', '2022-01-15', '2023-02-15', '8-inch',
        'Potting mix with perlite', '2022-09-15', 300.75, '2022-01-15', '2022-02-28');

INSERT INTO Illness (plant_name, severity, treatments, symptoms)
VALUES ('Spider Plant', 'Mild', 'Remove infected leaves, increase humidity', 'Yellowing leaves, brown spots'),
       ('Peace Lily', 'Severe', 'Remove infected leaves, treat with fungicide', 'Brown tips on leaves, wilting leaves');

INSERT INTO Plant_info (plant_id, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description,
                        description)
VALUES (1, '40-60%', 20.0, 'Not threatened', 'Chlorophytum comosum', 'Green and white striped leaves',
        'A hardy and adaptable plant that is great for beginners'),
       (2, '50-70%', 22.0, 'Least Concern', 'Spathiphyllum wallisii', 'Glossy dark green leaves and white flowers',
        'A popular and easy-to-care-for indoor plant');

INSERT INTO User (full_name, user_id, email, Experience_level, city, state, zip_code, order_id, plant_name)
VALUES ('Jane Doe', 1, 'jane@example.com', 'Beginner', 'Los Angeles', 'CA', 90001, 1, 'Spider Plant'),
       ('John Smith', 2, 'john@example.com', 'Intermediate', 'New York', 'NY', 10001, 2, 'Peace Lily');

INSERT INTO Plant (size, age, plant_name, plant_id, user_id)
VALUES (12.5, 2, 'Spider Plant', 1, 1),
       (16.8, 3, 'Peace Lily', 2, 2);

INSERT INTO Inventory (ID)
VALUES (1),
       (2);

INSERT INTO Purchases (order_id, Shipment_type, Storage, Product_ID, Order_date, Arrival_date)
VALUES (1, 'Standard', 'Cool and dry place', 1, '2022-02-15 10:30:00', '2022-02-22 14:30:00'),
       (2, 'Express', 'Refrigerated', 2, '2022-02-28 13:15:00', '2022-03-02 16:45:00');

INSERT INTO Product (P_ID, type, name, description)
VALUES (1, 'Fertilizer', 'Miracle-Gro All Purpose Plant Food',
        'A water-soluble fertilizer that provides all essential nutrients for plants'),
       (2, 'Fungicide', 'Bonide Fung-onil Multi-purpose Fungicide',
        'A broad-spectrum fungicide that controls and prevents many fungal diseases on plants');
