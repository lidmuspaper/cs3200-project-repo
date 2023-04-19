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
    watering_timer    int,
    fertilizing_timer int,
    repotting_timer   int,
    last_fertilized   datetime DEFAULT CURRENT_TIMESTAMP,
    last_repotted     datetime DEFAULT CURRENT_TIMESTAMP,
    last_watered      datetime DEFAULT CURRENT_TIMESTAMP,
    type_fertilizer   varchar(50),
    pot_size          float,
    soil_type         varchar(50),
    watering_amount   float,

    FOREIGN KEY (plant_id) REFERENCES Plant (plant_id)
    ON DELETE CASCADE
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
    ON DELETE CASCADE
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
    FOREIGN KEY (plant_id) references Plant (plant_id) ON DELETE CASCADE,
    FOREIGN KEY (location_name) references Location (location_name) ON DELETE CASCADE
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



insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (1, 'Shir Larrington', 'slarrington0@smh.com.au', 5, 'Torrance', 'California', '90505');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (2, 'Lorianna Shasnan', 'lshasnan1@google.co.jp', 8, 'Washington', 'District of Columbia', '20409');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (3, 'Shell Birkby', 'sbirkby2@apache.org', 3, 'Huntington', 'West Virginia', '25711');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (4, 'Helsa Scritch', 'hscritch3@jugem.jp', 9, 'Arlington', 'Virginia', '22244');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (5, 'Giovanni Allbrook', 'gallbrook4@livejournal.com', 6, 'Fort Lauderdale', 'Florida', '33305');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (6, 'Prisca Gerrets', 'pgerrets5@addthis.com', 10, 'San Antonio', 'Texas', '78291');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (7, 'Donovan Groves', 'dgroves6@nyu.edu', 8, 'Miami', 'Florida', '33180');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (8, 'Susana McDougall', 'smcdougall7@acquirethisname.com', 6, 'Austin', 'Texas', '78703');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (9, 'Creigh Heineking', 'cheineking8@flavors.me', 5, 'Pompano Beach', 'Florida', '33064');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (10, 'Wyatt Shrive', 'wshrive9@blinklist.com', 6, 'San Jose', 'California', '95133');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (11, 'Roana Paur', 'rpaura@addthis.com', 9, 'Lancaster', 'California', '93584');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (12, 'Karisa Kretschmer', 'kkretschmerb@home.pl', 1, 'Arlington', 'Virginia', '22234');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (13, 'Ricky Unitt', 'runittc@stumbleupon.com', 10, 'Duluth', 'Minnesota', '55811');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (14, 'Emmeline Wolters', 'ewoltersd@tiny.cc', 2, 'Minneapolis', 'Minnesota', '55436');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (15, 'Olivia Kohnert', 'okohnerte@slashdot.org', 10, 'Raleigh', 'North Carolina', '27610');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (16, 'Arlan Fathers', 'afathersf@mozilla.com', 3, 'San Antonio', 'Texas', '78215');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (17, 'Emmie Bousquet', 'ebousquetg@google.com.br', 2, 'El Paso', 'Texas', '88579');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (18, 'Janis Chazotte', 'jchazotteh@hugedomains.com', 1, 'Tucson', 'Arizona', '85743');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (19, 'Carr Babbidge', 'cbabbidgei@google.com.au', 9, 'Washington', 'District of Columbia', '20566');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (20, 'Orsola Belleny', 'obellenyj@1und1.de', 8, 'Wichita', 'Kansas', '67230');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (21, 'Darrick Petett', 'dpetettk@google.it', 3, 'Saint Paul', 'Minnesota', '55114');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (22, 'Dugald Bachura', 'dbachural@netlog.com', 8, 'North Hollywood', 'California', '91606');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (23, 'Chloris Lermouth', 'clermouthm@mashable.com', 8, 'Peoria', 'Illinois', '61635');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (24, 'Niel Primo', 'nprimon@nsw.gov.au', 4, 'Syracuse', 'New York', '13224');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (25, 'Valaree Burtenshaw', 'vburtenshawo@biglobe.ne.jp', 7, 'Philadelphia', 'Pennsylvania', '19120');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (26, 'Toddie Clemmow', 'tclemmowp@mozilla.com', 10, 'Indianapolis', 'Indiana', '46239');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (27, 'Page Crannis', 'pcrannisq@istockphoto.com', 1, 'Memphis', 'Tennessee', '38104');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (28, 'Janie Oleksinski', 'joleksinskir@un.org', 6, 'Largo', 'Florida', '34643');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (29, 'Geneva Sancto', 'gsanctos@mozilla.com', 10, 'Tacoma', 'Washington', '98405');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (30, 'Herbert Clampe', 'hclampet@washingtonpost.com', 5, 'Tulsa', 'Oklahoma', '74116');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (31, 'Corbie Kahen', 'ckahenu@yandex.ru', 9, 'Tucson', 'Arizona', '85743');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (32, 'Francisco Bamlett', 'fbamlettv@unicef.org', 5, 'Saint Louis', 'Missouri', '63180');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (33, 'Bree Hannabus', 'bhannabusw@economist.com', 3, 'Gainesville', 'Florida', '32605');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (34, 'Eric Glendenning', 'eglendenningx@delicious.com', 6, 'East Saint Louis', 'Illinois', '62205');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (35, 'Coletta Allchorn', 'callchorny@fotki.com', 4, 'Decatur', 'Illinois', '62525');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (36, 'Tammie Peasee', 'tpeaseez@geocities.com', 10, 'Milwaukee', 'Wisconsin', '53225');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (37, 'Consuela Whissell', 'cwhissell10@utexas.edu', 9, 'El Paso', 'Texas', '88589');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (38, 'Valeria Shorrock', 'vshorrock11@mozilla.org', 9, 'Minneapolis', 'Minnesota', '55402');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (39, 'Ruthie Eckhard', 'reckhard12@addthis.com', 2, 'Washington', 'District of Columbia', '20016');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (40, 'Anna-diana Denty', 'adenty13@seesaa.net', 1, 'Schaumburg', 'Illinois', '60193');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (41, 'Josepha Harding', 'jharding14@oaic.gov.au', 8, 'New Orleans', 'Louisiana', '70160');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (42, 'Rori Weekes', 'rweekes15@tuttocitta.it', 5, 'Arlington', 'Virginia', '22244');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (43, 'Roma Gruszecki', 'rgruszecki16@dell.com', 4, 'Sioux Falls', 'South Dakota', '57198');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (44, 'Phebe Jarrard', 'pjarrard17@salon.com', 4, 'Colorado Springs', 'Colorado', '80910');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (45, 'Annamaria Elks', 'aelks18@wordpress.com', 1, 'Bradenton', 'Florida', '34205');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (46, 'Mario Ilyushkin', 'milyushkin19@independent.co.uk', 2, 'Clearwater', 'Florida', '34620');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (47, 'Nonnah Ayars', 'nayars1a@oracle.com', 2, 'Spokane', 'Washington', '99210');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (48, 'Hasty Jovasevic', 'hjovasevic1b@addthis.com', 5, 'Oakland', 'California', '94627');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (49, 'Fay Bendel', 'fbendel1c@netlog.com', 9, 'Washington', 'District of Columbia', '20525');
insert into User (user_id, full_name, email, Experience_level, city, state, zip_code) values (50, 'Fayth Mielnik', 'fmielnik1d@shareasale.com', 4, 'Sacramento', 'California', '94263');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (71.63, 39.58, 20.79, 63.51, '1');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (49.18, 24.52, 11.79, 68.53, '2');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (34.9, 97.99, 23.05, 12.05, '3');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (91.38, 10.29, 59.5, 6.48, '4');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (3.07, 78.96, 17.88, 98.59, '5');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (7.82, 44.63, 60.27, 16.75, '6');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (5.48, 78.45, 15.31, 15.74, '7');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (59.2, 87.9, 77.6, 75.1, '8');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (57.34, 41.43, 58.6, 83.56, '9');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (2.93, 78.73, 20.47, 84.1, '10');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (20.77, 45.49, 63.17, 1.32, '11');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (62.82, 79.49, 25.16, 58.76, '12');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (16.86, 78.46, 79.9, 10.38, '13');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (14.95, 39.94, 41.2, 9.18, '14');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (70.46, 67.04, 94.74, 40.11, '15');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (65.04, 98.77, 81.83, 17.23, '16');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (42.57, 34.34, 87.33, 79.33, '17');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (66.35, 1.44, 59.83, 16.83, '18');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (2.54, 43.61, 34.34, 74.99, '19');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (61.56, 58.2, 52.96, 83.88, '20');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (9.13, 74.08, 61.59, 58.59, '21');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (39.88, 78.1, 16.66, 31.52, '22');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (52.6, 1.45, 42.5, 61.73, '23');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (68.96, 7.58, 29.9, 58.13, '24');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (58.19, 65.65, 68.05, 82.14, '25');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (54.32, 71.27, 76.71, 16.35, '26');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (69.29, 52.99, 82.54, 40.33, '27');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (21.45, 85.36, 94.52, 6.73, '28');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (99.98, 38.03, 36.5, 15.04, '29');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (64.68, 27.79, 58.68, 62.06, '30');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (14.41, 17.89, 44.83, 32.06, '31');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (93.65, 38.02, 59.5, 10.34, '32');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (42.9, 26.37, 92.07, 29.45, '33');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (55.37, 92.46, 7.66, 79.72, '34');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (23.08, 96.19, 30.83, 2.81, '35');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (26.43, 11.71, 65.38, 22.38, '36');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (28.07, 5.45, 33.42, 31.88, '37');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (94.71, 30.0, 81.47, 22.8, '38');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (5.68, 13.88, 36.22, 12.65, '39');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (5.57, 4.77, 47.43, 29.02, '40');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (45.71, 17.12, 24.73, 36.31, '41');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (54.86, 74.47, 26.25, 96.24, '42');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (58.8, 72.29, 81.22, 51.91, '43');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (16.25, 48.05, 39.02, 97.9, '44');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (61.99, 58.98, 4.85, 7.79, '45');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (39.26, 24.96, 2.18, 70.49, '46');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (93.3, 43.02, 19.22, 17.32, '47');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (91.63, 38.38, 48.55, 64.71, '48');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (35.68, 88.38, 88.13, 81.61, '49');
insert into Weather (Chance_of_rain, Temperature, sunlight, humidity, user_id) values (1.79, 43.8, 78.12, 7.2, '50');

insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Chamaesyce laredana (Millsp.) Small', 12.51, 80.92, 'Daily', 'lorem vitae mattis nibh ligula nec sem duis aliquam convallis', 'montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis', 'eleifend quam a odio in hac habitasse platea dictumst maecenas');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Scutellaria glabriuscula Fernald', 37.86, 34.48, 'Yearly', 'justo eu massa donec dapibus duis at velit eu est', 'cum sociis natoque penatibus et magnis dis parturient montes nascetur', 'nulla nunc purus phasellus in felis donec semper sapien a');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Parmotrema mordenii (Hale) Hale', 36.86, 34.54, 'Weekly', 'lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed', 'eu magna vulputate luctus cum sociis natoque penatibus et magnis', 'consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Castilleja applegatei Fernald ssp. pallida (Eastw.) T.I. Chuang & Heckard', 88.1, 31.47, 'Once', 'elit proin risus praesent lectus vestibulum quam sapien varius ut', 'justo in hac habitasse platea dictumst etiam faucibus cursus urna', 'semper rutrum nulla nunc purus phasellus in felis donec semper');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Oryzopsis Michx.', 94.53, 98.65, 'Never', 'sit amet eleifend pede libero quis orci nullam molestie nibh', 'libero nam dui proin leo odio porttitor id consequat in', 'id ornare imperdiet sapien urna pretium nisl ut volutpat sapien');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Crescentia alata Kunth', 67.28, 16.09, 'Never', 'ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue', 'mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum', 'congue eget semper rutrum nulla nunc purus phasellus in felis');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Fuscidea gyrodes (H. Magn.) ?, ined.?', 60.27, 95.17, 'Often', 'nec molestie sed justo pellentesque viverra pede ac diam cras', 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia', 'risus semper porta volutpat quam pede lobortis ligula sit amet');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Stigmidium marinum (Deakin) Swinscow', 25.46, 95.23, 'Monthly', 'non mi integer ac neque duis bibendum morbi non quam', 'habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam', 'tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Eutrema edwardsii R. Br.', 23.7, 31.86, 'Daily', 'donec semper sapien a libero nam dui proin leo odio', 'fermentum justo nec condimentum neque sapien placerat ante nulla justo', 'nisl duis bibendum felis sed interdum venenatis turpis enim blandit');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Hibiscus clypeatus L.', 22.2, 75.92, 'Daily', 'est congue elementum in hac habitasse platea dictumst morbi vestibulum', 'curae duis faucibus accumsan odio curabitur convallis duis consequat dui', 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Hippocratea L.', 9.51, 87.31, 'Monthly', 'aliquam non mauris morbi non lectus aliquam sit amet diam', 'vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem', 'lacus at turpis donec posuere metus vitae ipsum aliquam non');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Agastache pallidiflora (A. Heller) Rydb. ssp. neomexicana (Briq.) Lint & Epling', 45.74, 50.32, 'Once', 'volutpat sapien arcu sed augue aliquam erat volutpat in congue', 'posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis', 'at turpis donec posuere metus vitae ipsum aliquam non mauris');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Eleocharis olivacea Torr. var. reductiseta (Schuyler & Ferren) Schuyler & Ferren', 12.08, 60.82, 'Often', 'vitae nisl aenean lectus pellentesque eget nunc donec quis orci', 'ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse', 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Pityopsis falcata (Pursh) Nutt.', 33.51, 86.39, 'Never', 'pede ullamcorper augue a suscipit nulla elit ac nulla sed', 'turpis integer aliquet massa id lobortis convallis tortor risus dapibus', 'massa id nisl venenatis lacinia aenean sit amet justo morbi');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Mimosa quadrivalvis L. var. floridana (Chapm.) Barneby', 32.79, 52.44, 'Daily', 'in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum', 'sit amet consectetuer adipiscing elit proin risus praesent lectus vestibulum', 'id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Asclepias verticillata L.', 40.27, 31.63, 'Monthly', 'habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam', 'rutrum ac lobortis vel dapibus at diam nam tristique tortor', 'tristique fusce congue diam id ornare imperdiet sapien urna pretium');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Cyperus polystachyos Rottb. var. miser Kük.', 80.77, 7.6, 'Often', 'faucibus cursus urna ut tellus nulla ut erat id mauris', 'leo odio porttitor id consequat in consequat ut nulla sed', 'amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Schizachyrium rhizomatum (Swallen) Gould', 87.45, 76.66, 'Weekly', 'cum sociis natoque penatibus et magnis dis parturient montes nascetur', 'justo nec condimentum neque sapien placerat ante nulla justo aliquam', 'pharetra magna ac consequat metus sapien ut nunc vestibulum ante');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Carex haydenii Dewey', 22.06, 93.7, 'Monthly', 'tellus nulla ut erat id mauris vulputate elementum nullam varius', 'varius integer ac leo pellentesque ultrices mattis odio donec vitae', 'turpis sed ante vivamus tortor duis mattis egestas metus aenean');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Sesbania cannabina Poir.', 47.3, 87.74, 'Yearly', 'ligula suspendisse ornare consequat lectus in est risus auctor sed', 'at nunc commodo placerat praesent blandit nam nulla integer pede', 'quis orci nullam molestie nibh in lectus pellentesque at nulla');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Sarea difformis (Fr.) Fr.', 99.34, 96.48, 'Weekly', 'mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et', 'phasellus in felis donec semper sapien a libero nam dui', 'vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Cordia angustifolia (West ex Willd.) Roem. & Schult.', 85.08, 87.45, 'Monthly', 'massa tempor convallis nulla neque libero convallis eget eleifend luctus', 'lacus at velit vivamus vel nulla eget eros elementum pellentesque', 'felis donec semper sapien a libero nam dui proin leo');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Sphagnum papillosum Lindb.', 65.12, 39.78, 'Weekly', 'dolor sit amet consectetuer adipiscing elit proin risus praesent lectus', 'massa id lobortis convallis tortor risus dapibus augue vel accumsan', 'enim blandit mi in porttitor pede justo eu massa donec');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Juncus georgianus Coville', 42.11, 59.87, 'Never', 'neque sapien placerat ante nulla justo aliquam quis turpis eget', 'suspendisse potenti nullam porttitor lacus at turpis donec posuere metus', 'fermentum donec ut mauris eget massa tempor convallis nulla neque');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Gentianella quinquefolia (L.) Small ssp. occidentalis (A. Gray) J.M. Gillett', 18.3, 46.04, 'Weekly', 'ac tellus semper interdum mauris ullamcorper purus sit amet nulla', 'suscipit a feugiat et eros vestibulum ac est lacinia nisi', 'justo lacinia eget tincidunt eget tempus vel pede morbi porttitor');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Salix argyrocarpa Andersson', 14.62, 87.55, 'Yearly', 'mi nulla ac enim in tempor turpis nec euismod scelerisque', 'sit amet sem fusce consequat nulla nisl nunc nisl duis', 'id ligula suspendisse ornare consequat lectus in est risus auctor');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Thelidium parvulum Arnold', 42.43, 7.85, 'Seldom', 'ut nulla sed accumsan felis ut at dolor quis odio', 'ante vel ipsum praesent blandit lacinia erat vestibulum sed magna', 'mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Tolumnia prionochila (Kraenzlin) G.J. Braem', 99.25, 91.8, 'Seldom', 'a libero nam dui proin leo odio porttitor id consequat', 'aliquam convallis nunc proin at turpis a pede posuere nonummy', 'suscipit nulla elit ac nulla sed vel enim sit amet');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Collema conglomeratum Hoffm.', 38.49, 14.21, 'Daily', 'morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl', 'condimentum id luctus nec molestie sed justo pellentesque viverra pede', 'erat tortor sollicitudin mi sit amet lobortis sapien sapien non');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Datura stramonium L.', 77.58, 62.63, 'Yearly', 'pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit', 'porttitor id consequat in consequat ut nulla sed accumsan felis', 'aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Schoenolirion wrightii Sherman', 11.44, 37.01, 'Yearly', 'massa id nisl venenatis lacinia aenean sit amet justo morbi', 'donec vitae nisi nam ultrices libero non mattis pulvinar nulla', 'suscipit a feugiat et eros vestibulum ac est lacinia nisi');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Eutrochium steelei (E.E. Lamont) E.E. Lamont', 84.79, 31.79, 'Seldom', 'sit amet cursus id turpis integer aliquet massa id lobortis', 'ac tellus semper interdum mauris ullamcorper purus sit amet nulla', 'suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Astragalus pycnostachyus A. Gray var. lanosissimus (Rydb.) Munz & McBurney', 84.59, 53.93, 'Daily', 'tincidunt eget tempus vel pede morbi porttitor lorem id ligula', 'dui vel nisl duis ac nibh fusce lacus purus aliquet', 'eu sapien cursus vestibulum proin eu mi nulla ac enim');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Entosthodon sonorae (Cardot) Steere', 15.55, 57.46, 'Often', 'mi sit amet lobortis sapien sapien non mi integer ac', 'nulla nisl nunc nisl duis bibendum felis sed interdum venenatis', 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Lantana L.', 78.38, 74.87, 'Once', 'at velit eu est congue elementum in hac habitasse platea', 'eleifend pede libero quis orci nullam molestie nibh in lectus', 'interdum in ante vestibulum ante ipsum primis in faucibus orci');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Ferocactus hamatacanthus (Muehlenpf.) Britton & Rose var. hamatacanthus', 27.96, 40.98, 'Often', 'eu magna vulputate luctus cum sociis natoque penatibus et magnis', 'est donec odio justo sollicitudin ut suscipit a feugiat et', 'posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Schistostega D. Mohr', 82.67, 56.99, 'Weekly', 'cursus vestibulum proin eu mi nulla ac enim in tempor', 'libero ut massa volutpat convallis morbi odio odio elementum eu', 'a pede posuere nonummy integer non velit donec diam neque');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Xylographa hians Tuck.', 56.82, 61.15, 'Monthly', 'lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper', 'consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien', 'amet erat nulla tempus vivamus in felis eu sapien cursus');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Zinnia angustifolia Kunth', 90.8, 98.62, 'Seldom', 'odio porttitor id consequat in consequat ut nulla sed accumsan', 'mauris vulputate elementum nullam varius nulla facilisi cras non velit', 'duis consequat dui nec nisi volutpat eleifend donec ut dolor');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Iwatsukiella leucotricha (Mitt.) W.R. Buck & H.A. Crum', 93.56, 43.59, 'Weekly', 'pellentesque volutpat dui maecenas tristique est et tempus semper est', 'pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas', 'pede justo lacinia eget tincidunt eget tempus vel pede morbi');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Flyriella R.M. King & H. Rob.', 54.14, 99.2, 'Seldom', 'eget rutrum at lorem integer tincidunt ante vel ipsum praesent', 'suscipit a feugiat et eros vestibulum ac est lacinia nisi', 'id consequat in consequat ut nulla sed accumsan felis ut');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Chaenotheca chlorella (Ach.) Müll. Arg.', 6.15, 31.46, 'Daily', 'est quam pharetra magna ac consequat metus sapien ut nunc', 'id luctus nec molestie sed justo pellentesque viverra pede ac', 'tortor id nulla ultrices aliquet maecenas leo odio condimentum id');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Sagittaria lancifolia L.', 71.29, 57.59, 'Never', 'purus phasellus in felis donec semper sapien a libero nam', 'dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum', 'a libero nam dui proin leo odio porttitor id consequat');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Carex scoparia Schkuhr ex Willd. var. scoparia', 89.86, 21.61, 'Often', 'sapien a libero nam dui proin leo odio porttitor id', 'nullam orci pede venenatis non sodales sed tincidunt eu felis', 'massa id nisl venenatis lacinia aenean sit amet justo morbi');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Oreochrysum parryi (A. Gray) Rydb.', 70.17, 32.6, 'Daily', 'feugiat non pretium quis lectus suspendisse potenti in eleifend quam', 'sit amet eros suspendisse accumsan tortor quis turpis sed ante', 'quis tortor id nulla ultrices aliquet maecenas leo odio condimentum');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Camissonia breviflora (Torr. & A. Gray) P.H. Raven', 23.09, 7.69, 'Monthly', 'amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque', 'est phasellus sit amet erat nulla tempus vivamus in felis', 'elementum ligula vehicula consequat morbi a ipsum integer a nibh');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Chamaesyce urbanii Millsp.', 37.96, 43.99, 'Once', 'bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt', 'molestie lorem quisque ut erat curabitur gravida nisi at nibh', 'blandit nam nulla integer pede justo lacinia eget tincidunt eget');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Hypericum ×inodorum Mill.', 68.1, 46.21, 'Weekly', 'lorem vitae mattis nibh ligula nec sem duis aliquam convallis', 'sem duis aliquam convallis nunc proin at turpis a pede', 'non mi integer ac neque duis bibendum morbi non quam');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Epixiphium (A. Gray) Munz', 74.97, 95.51, 'Yearly', 'at turpis a pede posuere nonummy integer non velit donec', 'nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum', 'velit id pretium iaculis diam erat fermentum justo nec condimentum');
insert into Plant_info (name, ideal_humidity, ideal_temp, conservation_status, taxonomy, visual_description, description) values ('Xyris difformis Chapm. var. difformis', 16.46, 35.24, 'Yearly', 'porttitor pede justo eu massa donec dapibus duis at velit', 'nisi venenatis tristique fusce congue diam id ornare imperdiet sapien', 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia');

insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (2.73, 14, null, 'Taxithelium Moss', 1, '1');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (7.21, 25, null, 'Assyrian Plum', 2, '2');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (0.17, 1, null, 'Alaska Moonwort', 3, '3');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (6.57, 18, null, 'Saltmeadow Plantain', 4, '4');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (7.65, 18, null, 'Macawflower', 5, '5');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (0.79, 20, null, '''ohi''a Ha', 6, '6');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (7.59, 8, null, 'Cracked Lichen', 7, '7');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (1.51, 15, null, 'Scabland Penstemon', 8, '8');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (1.22, 5, null, 'Purple Woodsorrel', 9, '9');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (5.75, 6, null, 'Pricklyash', 10, '10');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (5.65, 23, null, 'Heartleaf Buttercup', 11, '11');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (7.06, 18, null, 'Grassleaf Barbara''s Buttons', 12, '12');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (9.0, 9, null, 'Plectranthus', 13, '13');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (3.76, 11, null, 'Gypsum Springbeauty', 14, '14');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (8.7, 21, null, 'Shortspike Canarygrass', 15, '15');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (4.3, 6, null, 'Kern River Clarkia', 16, '16');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (9.99, 14, null, 'Hudson Bay Sedge', 17, '17');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (3.13, 11, null, 'Forest Danafern', 18, '18');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (1.44, 20, null, 'Beard Lichen', 19, '19');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (9.28, 11, null, 'Pringle''s Swallow-wort', 20, '20');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (3.24, 23, null, 'Forest Spleenwort', 21, '21');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (5.9, 9, null, 'Pineywoods Geranium', 22, '22');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (2.22, 7, null, 'Xanthoparmelia Lichen', 23, '23');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (9.15, 19, null, 'July Gold', 24, '24');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (4.62, 21, null, 'Bolander''s Map Lichen', 25, '25');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (1.32, 25, null, 'California Maidenhair', 26, '26');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (8.5, 15, null, 'Autumn Dwarf Gentian', 27, '27');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (5.44, 13, null, 'Cottongrass', 28, '28');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (1.29, 16, null, 'Santa Barbara Milkvetch', 29, '29');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (5.08, 23, null, 'Wart Lichen', 30, '30');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (9.48, 14, null, 'Streambank Mock Orange', 31, '31');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (5.33, 18, null, 'Variableleaf Yellowcress', 32, '32');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (3.68, 16, null, 'Livid Sedge', 33, '33');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (1.35, 24, null, 'Myurella Moss', 34, '34');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (6.19, 24, null, 'Mapleleaf Goosefoot', 35, '35');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (3.54, 24, null, 'Limestone Phacelia', 36, '36');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (6.92, 2, null, 'Protoblastenia Lichen', 37, '37');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (5.52, 3, null, 'Tapellaria Lichen', 38, '38');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (5.86, 24, null, 'Alkali Buttercup', 39, '39');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (5.91, 23, null, 'Cardinal Beardtongue', 40, '40');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (2.53, 16, null, 'Constance''s Bittercress', 41, '41');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (3.35, 24, null, 'Wiegand''s Sedge', 42, '42');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (0.99, 19, null, 'Wildcane', 43, '43');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (8.15, 12, null, 'Island Chinchweed', 44, '44');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (7.24, 16, null, 'Selfing Willowherb', 45, '45');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (0.79, 24, null, 'Mt. Mazama Collomia', 46, '46');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (8.89, 19, null, 'Old Man''s Whiskers', 47, '47');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (5.73, 5, null, 'Ballhead Ipomopsis', 48, '48');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (6.6, 23, null, 'Venus'' Slipper', 49, '49');
insert into Plant (size, age, plant_name, shown_name, plant_id, user_id) values (0.58, 8, null, 'Swampmallow', 50, '50');
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('1', 6, 9, 8, '2022-11-24', '2023-03-27', '2022-04-18', 'Remedy Cleansing Body', 34.59, 'standard', 100);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('2', 3, 13, 4, '2022-11-07', '2023-03-04', '2023-03-28', 'Bio Olive', 31.66, 'nitrogen-rich', 38);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('3', 14, 6, 4, '2022-09-09', '2022-11-05', '2022-05-21', 'Metronidazole', 3.2, 'compact', 85);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('4', 11, 5, 9, '2022-10-08', '2023-01-29', '2022-05-25', 'Best Choice', 8.67, 'orchid', 58);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('5', 12, 9, 12, '2022-06-19', '2023-02-25', '2022-07-24', 'Lotrimin', 20.31, 'compact', 64);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('6', 12, 7, 6, '2022-12-10', '2022-06-08', '2022-05-03', 'Spongia Ovi', 81.93, 'nitrogen-rich', 19);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('7', 3, 1, 6, '2022-04-27', '2023-01-28', '2022-11-28', 'Ibuprofen', 53.72, 'nitrogen-rich', 58);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('8', 10, 14, 8, '2022-04-25', '2022-07-06', '2022-08-19', 'Aplicare Povidone', 39.03, 'flowering', 26);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('9', 14, 6, 1, '2023-03-25', '2022-05-04', '2023-03-22', 'Chaetomium globosum', 99.82, 'flowering', 73);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('10', 13, 3, 13, '2023-01-11', '2022-09-16', '2022-12-28', 'Zippity Doos', 23.26, 'compact', 32);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('11', 12, 4, 9, '2022-06-25', '2022-09-07', '2022-10-23', 'Phenazopyridine HCl', 51.35, 'nitrogen-rich', 74);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('12', 11, 10, 1, '2022-07-29', '2022-09-14', '2022-12-05', 'Peptic Relief', 50.99, 'compact', 35);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('13', 8, 13, 6, '2022-11-17', '2022-12-16', '2022-06-30', 'Topcare Mucus Relief', 63.28, 'compact', 99);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('14', 1, 10, 13, '2023-01-21', '2022-07-03', '2022-11-12', 'Parrot He', 88.61, 'compact', 72);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('15', 11, 7, 3, '2022-06-05', '2022-12-03', '2023-04-13', 'TOURCIA NUTRI EYE', 21.89, 'nitrogen-rich', 17);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('16', 12, 12, 2, '2022-06-21', '2022-08-24', '2023-04-12', 'Calcium', 82.89, 'orchid', 49);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('17', 13, 14, 3, '2022-07-16', '2023-03-05', '2022-12-07', 'Anti-Bacterial Hand', 17.46, 'nitrogen-rich', 91);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('18', 14, 7, 6, '2023-02-07', '2022-06-09', '2022-10-05', 'Prevantics Maxi Swabstick', 54.17, 'compact', 72);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('19', 1, 9, 8, '2023-03-07', '2022-12-03', '2023-01-23', 'Adapalene', 46.68, 'flowering', 64);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('20', 12, 1, 11, '2023-03-28', '2023-01-31', '2022-11-27', 'SEROQUEL', 53.02, 'standard', 92);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('21', 10, 4, 13, '2023-01-02', '2022-05-07', '2022-09-10', 'Lovastatin', 65.27, 'standard', 73);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('22', 4, 14, 1, '2022-06-04', '2022-04-23', '2022-11-08', 'Tramadol Hydrochloride', 31.79, 'flowering', 64);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('23', 10, 3, 14, '2022-06-21', '2023-02-09', '2023-03-02', 'Degree Girl Friends Forever', 64.62, 'flowering', 87);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('24', 5, 1, 12, '2022-06-06', '2022-12-22', '2022-08-11', 'ACREMONIUM STRICTUM', 84.73, 'compact', 38);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('25', 1, 4, 3, '2022-10-18', '2022-08-15', '2023-01-01', 'Pure Petroleum Cocoa Butter Scented', 47.68, 'standard', 84);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('26', 8, 7, 6, '2022-06-11', '2022-08-15', '2022-06-30', 'Motion Sickness', 40.52, 'orchid', 50);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('27', 2, 10, 2, '2022-07-31', '2022-09-22', '2022-10-05', 'NWC21 NATURAL SUN PROTECTOR', 50.07, 'orchid', 39);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('28', 3, 5, 10, '2022-09-21', '2022-08-23', '2022-11-04', 'Mineral oil', 49.76, 'flowering', 85);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('29', 3, 11, 7, '2022-06-01', '2023-03-04', '2022-09-09', 'EPIVIR', 50.84, 'flowering', 51);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('30', 9, 14, 1, '2022-12-12', '2022-05-05', '2022-12-24', 'Ondansetron', 23.85, 'nitrogen-rich', 5);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('31', 12, 4, 6, '2022-10-09', '2022-10-18', '2022-10-26', 'Glipizide', 89.15, 'compact', 2);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('32', 2, 2, 8, '2022-08-21', '2023-04-07', '2023-01-30', 'Bupropion Hydrochloride', 15.24, 'compact', 21);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('33', 9, 9, 8, '2022-11-19', '2022-11-19', '2022-08-24', 'Cefepime', 1.45, 'orchid', 51);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('34', 7, 4, 13, '2022-08-20', '2022-05-05', '2023-03-27', 'Topcare Milk of Magnesia', 82.93, 'compact', 57);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('35', 6, 7, 14, '2022-07-25', '2023-02-26', '2023-03-14', 'SINGULAIR', 39.32, 'flowering', 9);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('36', 9, 3, 10, '2023-01-07', '2022-06-08', '2022-11-26', 'Cool n Heat Patch for', 95.11, 'orchid', 35);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('37', 5, 5, 8, '2022-05-16', '2022-08-20', '2023-04-15', 'ANTIBACTERIAL FOAMING', 40.83, 'flowering', 10);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('38', 7, 11, 11, '2022-06-24', '2022-05-27', '2023-02-09', 'Childrens Pain and Fever', 32.54, 'flowering', 33);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('39', 4, 9, 6, '2022-11-23', '2022-10-10', '2022-08-03', 'Norepinephrine', 90.43, 'standard', 91);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('40', 9, 8, 3, '2022-09-29', '2023-03-24', '2022-11-26', 'Sodium Chloride', 39.88, 'flowering', 25);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('41', 5, 8, 12, '2023-01-20', '2022-09-28', '2023-01-31', 'Gabapentin', 71.92, 'nitrogen-rich', 88);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('42', 12, 7, 2, '2023-02-13', '2022-10-15', '2022-07-10', 'Natural Concept Body Wash', 70.47, 'orchid', 96);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('43', 9, 12, 11, '2022-09-24', '2022-06-20', '2022-09-27', 'Metoprolol Tartrate', 89.44, 'flowering', 27);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('44', 11, 11, 5, '2022-07-17', '2023-01-10', '2022-06-01', 'SEROQUEL', 64.15, 'compact', 62);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('45', 8, 14, 7, '2022-07-14', '2023-03-01', '2022-12-09', 'Parcopa', 42.51, 'flowering', 88);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('46', 10, 2, 13, '2023-02-18', '2023-03-06', '2022-06-21', 'Enoxaparin Sodium', 70.9, 'nitrogen-rich', 11);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('47', 13, 11, 10, '2022-06-06', '2022-07-27', '2023-01-22', 'Cetirizine Hydrochloride', 18.65, 'compact', 3);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('48', 9, 9, 4, '2023-04-07', '2022-10-07', '2023-01-24', 'BICILLIN CR', 20.22, 'flowering', 80);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('49', 14, 1, 9, '2023-01-06', '2022-07-27', '2022-08-02', 'Indium in 111', 7.41, 'nitrogen-rich', 79);
insert into Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, last_fertilized, last_repotted, last_watered, type_fertilizer, pot_size, soil_type, watering_amount) values ('50', 3, 10, 10, '2022-10-16', '2022-11-10', '2022-11-01', 'SCHINUS MOLLE POLLEN', 17.29, 'standard', 23);

insert into Illness (illness_name, severity, treatments, symptoms) values ('a', 84, 'OXYGEN', 'brittle');
insert into Illness (illness_name, severity, treatments, symptoms) values ('b', 97, 'sertraline hydrochloride', 'drooping');
insert into Illness (illness_name, severity, treatments, symptoms) values ('c', 67, 'prednicarbate', 'bugs');
insert into Illness (illness_name, severity, treatments, symptoms) values ('d', 60, 'lisinopril', 'yellow');
insert into Illness (illness_name, severity, treatments, symptoms) values ('e', 94, 'Regular Strength', 'bugs');
insert into Illness (illness_name, severity, treatments, symptoms) values ('f', 80, 'desipramine hydrochloride', 'brown');
insert into Illness (illness_name, severity, treatments, symptoms) values ('g', 54, 'Benzocaine, Zinc Chloride', 'yellow');
insert into Illness (illness_name, severity, treatments, symptoms) values ('h', 94, 'Bryonia, Ruta Graveolens', 'brittle');
insert into Illness (illness_name, severity, treatments, symptoms) values ('i', 30, 'SERTRALINE HYDROCHLORIDE', 'dry');
insert into Illness (illness_name, severity, treatments, symptoms) values ('j', 61, 'OXYGEN', 'bugs');
insert into Illness (illness_name, severity, treatments, symptoms) values ('k', 79, 'ATROPA BELLADONNA, SANGUINARIA CANADENSIS ROOT', 'drooping');
insert into Illness (illness_name, severity, treatments, symptoms) values ('l', 95, 'fluocinolone a', 'bugs');
insert into Illness (illness_name, severity, treatments, symptoms) values ('m', 100, 'somatropin (rDNA origin)', 'wilt');
insert into Illness (illness_name, severity, treatments, symptoms) values ('n', 10, 'Levetiracetam', 'brown');
insert into Illness (illness_name, severity, treatments, symptoms) values ('o', 16, 'Albuterol Sulfate', 'wet');
insert into Illness (illness_name, severity, treatments, symptoms) values ('p', 33, 'Acetaminophen, Dextromethorphan HBr', 'wet');
insert into Illness (illness_name, severity, treatments, symptoms) values ('q', 68, 'Ibuprofen', 'brown');
insert into Illness (illness_name, severity, treatments, symptoms) values ('r', 63, 'AVOBENZONE,HOMOSALATE', 'brittle');
insert into Illness (illness_name, severity, treatments, symptoms) values ('s', 2, 'Oxygen', 'brittle');
insert into Illness (illness_name, severity, treatments, symptoms) values ('t', 43, 'Fentanyl', 'bugs');
insert into Illness (illness_name, severity, treatments, symptoms) values ('u', 86, 'AZITHROMYCIN MONOHYDRATE', 'yellow');
insert into Illness (illness_name, severity, treatments, symptoms) values ('v', 45, 'Ethyl Alcohol', 'brittle');
insert into Illness (illness_name, severity, treatments, symptoms) values ('w', 80, 'Meropenem', 'brown');
insert into Illness (illness_name, severity, treatments, symptoms) values ('x', 57, 'Norepinephrine,', 'bugs');
insert into Illness (illness_name, severity, treatments, symptoms) values ('y', 98, 'demeclocycline hydrochloride', 'wet');
insert into Illness (illness_name, severity, treatments, symptoms) values ('z', 80, 'diazepam', 'wilt');
insert into Illness (illness_name, severity, treatments, symptoms) values ('aa', 30, 'Benzocain', 'bugs');
insert into Illness (illness_name, severity, treatments, symptoms) values ('bb', 85, 'Doxycycline Hyclate', 'wet');
insert into Illness (illness_name, severity, treatments, symptoms) values ('cc', 93, 'CARBAMAZEPINE', 'brown');
insert into Illness (illness_name, severity, treatments, symptoms) values ('dd', 43, 'Nicotine Polacrilex', 'brown');
insert into Illness (illness_name, severity, treatments, symptoms) values ('ee', 36, 'Quetiapine Fumarate', 'brittle');
insert into Illness (illness_name, severity, treatments, symptoms) values ('ff', 51, 'Echinacea (Angustifolins,', 'brittle');
insert into Illness (illness_name, severity, treatments, symptoms) values ('gg', 32, 'Olibanummunis.', 'brittle');
insert into Illness (illness_name, severity, treatments, symptoms) values ('hh', 57, 'Post Oak', 'bugs');
insert into Illness (illness_name, severity, treatments, symptoms) values ('ii', 68, 'Enalapril Maleate', 'brittle');
insert into Illness (illness_name, severity, treatments, symptoms) values ('jj', 78, 'Duloxetine', 'bugs');
insert into Illness (illness_name, severity, treatments, symptoms) values ('kk', 40, 'Triamcinolone Acetonide', 'brittle');
insert into Illness (illness_name, severity, treatments, symptoms) values ('ll', 75, 'Safflower Seed', 'brittle');
insert into Illness (illness_name, severity, treatments, symptoms) values ('mm', 56, 'Trazodone Hydrochloride', 'wilt');
insert into Illness (illness_name, severity, treatments, symptoms) values ('nn', 44, 'Penicillin V Potassium', 'yellow');
insert into Illness (illness_name, severity, treatments, symptoms) values ('oo', 2, 'acetaminophen,', 'yellow');
insert into Illness (illness_name, severity, treatments, symptoms) values ('pp', 86, 'Ibuprofen, ', 'brittle');
insert into Illness (illness_name, severity, treatments, symptoms) values ('qq', 41, 'aluminum hydro', 'wilt');
insert into Illness (illness_name, severity, treatments, symptoms) values ('rr', 70, 'serratia marcescens', 'drooping');
insert into Illness (illness_name, severity, treatments, symptoms) values ('ss', 30, 'Atenolol', 'yellow');
insert into Illness (illness_name, severity, treatments, symptoms) values ('tt', 33, 'Triclosan', 'brown');
insert into Illness (illness_name, severity, treatments, symptoms) values ('uu', 26, 'Desmopressin Acetate', 'wet');
insert into Illness (illness_name, severity, treatments, symptoms) values ('vv', 61, 'Trazodone Hydrochloride', 'bugs');
insert into Illness (illness_name, severity, treatments, symptoms) values ('ww', 2, 'aspergillus niger var. niger', 'wet');
insert into Illness (illness_name, severity, treatments, symptoms) values ('xx', 53, 'PHENYLEPHRINE HYDROCHLORIDEHAN HYDROBROMIDE', 'brown');

insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (1, '1', 'a');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (2, '2', 'b');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (3, '3', 'c');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (4, '4', 'd');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (5, '5', 'e');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (6, '6', 'f');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (7, '7', 'g');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (8, '8', 'h');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (9, '9', 'i');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (10, '10', 'j');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (11, '11', 'k');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (12, '12', 'l');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (13, '13', 'm');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (14, '14', 'n');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (15, '15', 'o');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (16, '16', 'p');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (17, '17', 'q');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (18, '18', 'r');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (19, '19', 's');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (20, '20', 't');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (21, '21', 'u');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (22, '22', 'v');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (23, '23', 'w');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (24, '24', 'x');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (25, '25', 'y');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (26, '26', 'z');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (27, '27', 'aa');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (28, '28', 'bb');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (29, '29', 'cc');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (30, '30', 'dd');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (31, '31', 'ee');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (32, '32', 'ff');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (33, '33', 'gg');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (34, '34', 'hh');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (35, '35', 'ii');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (36, '36', 'jj');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (37, '37', 'kk');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (38, '38', 'll');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (39, '39', 'mm');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (40, '40', 'nn');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (41, '41', 'oo');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (42, '42', 'pp');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (43, '43', 'qq');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (44, '44', 'rr');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (45, '45', 'ss');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (46, '46', 'tt');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (47, '47', 'uu');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (48, '48', 'vv');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (49, '49', 'ww');
insert into PLANT_ILLNESS (illness_id, plant_id, illness_name) values (50, '50', 'xx');

insert into Location (location_name, temp, humidity, sunlight) values ('living room', 55, 29, 2);
insert into Location (location_name, temp, humidity, sunlight) values ('outdoors', 40, 9, 73);
insert into Location (location_name, temp, humidity, sunlight) values ('bedroom', 37, 68, 2);
insert into Location (location_name, temp, humidity, sunlight) values ('kitchen', 49, 76, 15);
insert into Location (location_name, temp, humidity, sunlight) values ('basement', 94, 36, 46);
insert into Location (location_name, temp, humidity, sunlight) values ('office', 52, 2, 37);
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (1, '1', 'office');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (2, '2', 'outdoors');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (3, '3', 'basement');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (4, '4', 'kitchen');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (5, '5', 'basement');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (6, '6', 'living room');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (7, '7', 'kitchen');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (8, '8', 'living room');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (9, '9', 'outdoors');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (10, '10', 'office');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (11, '11', 'kitchen');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (12, '12', 'living room');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (13, '13', 'outdoors');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (14, '14', 'office');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (15, '15', 'basement');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (16, '16', 'kitchen');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (17, '17', 'kitchen');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (18, '18', 'living room');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (19, '19', 'office');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (20, '20', 'kitchen');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (21, '21', 'outdoors');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (22, '22', 'living room');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (23, '23', 'kitchen');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (24, '24', 'kitchen');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (25, '25', 'kitchen');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (26, '26', 'outdoors');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (27, '27', 'bedroom');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (28, '28', 'kitchen');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (29, '29', 'basement');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (30, '30', 'office');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (31, '31', 'kitchen');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (32, '32', 'bedroom');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (33, '33', 'outdoors');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (34, '34', 'basement');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (35, '35', 'kitchen');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (36, '36', 'office');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (37, '37', 'living room');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (38, '38', 'kitchen');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (39, '39', 'living room');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (40, '40', 'living room');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (41, '41', 'kitchen');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (42, '42', 'office');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (43, '43', 'basement');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (44, '44', 'outdoors');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (45, '45', 'bedroom');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (46, '46', 'outdoors');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (47, '47', 'basement');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (48, '48', 'outdoors');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (49, '49', 'bedroom');
insert into PLANT_LOCATION (location_id, plant_id, location_name) values (50, '50', 'living room');

insert into Gardens (ID, name, city, state, zip_code, email, phone) values (1, 'Aibox', 'Dallas', 'Texas', '75367', 'egould0@cafepress.com', '214-258-5272');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (2, 'Tagtune', 'Mobile', 'Alabama', '36610', 'iwraighte1@goodreads.com', '251-461-8981');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (3, 'Dazzlesphere', 'Kansas City', 'Missouri', '64199', 'jrooksby2@sfgate.com', '816-337-8081');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (4, 'Edgewire', 'Houston', 'Texas', '77250', 'cvanderbeek3@blogger.com', '713-653-8430');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (5, 'Roomm', 'Glendale', 'California', '91205', 'hleppington4@indiatimes.com', '818-833-0968');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (6, 'Tagcat', 'Sioux Falls', 'South Dakota', '57105', 'isilwood5@unesco.org', '605-750-4517');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (7, 'Voolith', 'Clearwater', 'Florida', '33758', 'wbebis6@eventbrite.com', '813-510-6635');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (8, 'Oozz', 'Salt Lake City', 'Utah', '84199', 'etunsley7@parallels.com', '801-223-1096');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (9, 'Dynabox', 'San Diego', 'California', '92137', 'sbagguley8@ca.gov', '619-610-2603');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (10, 'Tagopia', 'Garden Grove', 'California', '92844', 'heldrid9@cyberchimps.com', '714-154-9971');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (11, 'Skidoo', 'Springfield', 'Massachusetts', '01105', 'qferrettinia@vinaora.com', '413-434-8409');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (12, 'Edgeclub', 'Lansing', 'Michigan', '48930', 'rfockeb@topsy.com', '517-541-3240');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (13, 'Snaptags', 'Saint Louis', 'Missouri', '63143', 'lbeckerc@wordpress.org', '314-172-3539');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (14, 'Dabfeed', 'Fort Collins', 'Colorado', '80525', 'dmccrillisd@hostgator.com', '970-384-9039');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (15, 'Blogspan', 'Brooklyn', 'New York', '11241', 'mbrockelsbye@epa.gov', '347-567-3198');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (16, 'Quire', 'Baltimore', 'Maryland', '21211', 'tlarouxf@dagondesign.com', '410-242-4185');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (17, 'Fivechat', 'Bakersfield', 'California', '93381', 'tbroggettig@state.gov', '661-933-0213');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (18, 'Devshare', 'Oakland', 'California', '94616', 'pmurieh@hud.gov', '415-251-8345');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (19, 'Dablist', 'Monticello', 'Minnesota', '55590', 'omclenahani@icq.com', '763-316-8776');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (20, 'Vinder', 'Punta Gorda', 'Florida', '33982', 'khoundsonj@usda.gov', '941-760-1502');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (21, 'Demivee', 'Murfreesboro', 'Tennessee', '37131', 'jwallwoodk@ning.com', '615-235-2088');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (22, 'Topiczoom', 'Springfield', 'Illinois', '62718', 'tcorbittl@w3.org', '217-345-6957');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (23, 'Edgeclub', 'Camden', 'New Jersey', '08104', 'lnarduccim@instagram.com', '856-714-7674');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (24, 'Avavee', 'Portland', 'Oregon', '97255', 'stapporn@shutterfly.com', '971-554-9223');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (25, 'Wikibox', 'San Jose', 'California', '95194', 'tcollibearo@nba.com', '408-968-9003');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (26, 'Mymm', 'Erie', 'Pennsylvania', '16505', 'njepensenp@thetimes.co.uk', '814-606-1069');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (27, 'Leenti', 'West Palm Beach', 'Florida', '33411', 'bmustoeq@purevolume.com', '954-170-4578');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (28, 'Topiclounge', 'Sioux Falls', 'South Dakota', '57105', 'idemorenor@eventbrite.com', '605-354-0797');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (29, 'Photobean', 'Colorado Springs', 'Colorado', '80995', 'efeldfishers@deviantart.com', '719-350-4230');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (30, 'Centizu', 'Washington', 'District of Columbia', '20046', 'bmcgarviet@hibu.com', '202-512-2230');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (31, 'Devshare', 'New Bedford', 'Massachusetts', '02745', 'rcristouu@boston.com', '508-725-9998');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (32, 'Skynoodle', 'Flint', 'Michigan', '48550', 'rhellardv@instagram.com', '810-186-0756');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (33, 'Devcast', 'Miami', 'Florida', '33134', 'hbarltropw@fema.gov', '305-354-7306');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (34, 'Flashspan', 'Santa Cruz', 'California', '95064', 'cschwandnerx@mtv.com', '831-927-2520');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (35, 'Twitternation', 'Detroit', 'Michigan', '48206', 'llionely@1und1.de', '734-328-4064');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (36, 'Yacero', 'Las Vegas', 'Nevada', '89115', 'cgochz@pagesperso-orange.fr', '702-984-2068');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (37, 'Realmix', 'Des Moines', 'Iowa', '50347', 'rgrabiec10@mozilla.com', '515-917-3514');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (38, 'BlogXS', 'Atlanta', 'Georgia', '31106', 'kgable11@dropbox.com', '404-299-1859');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (39, 'Agivu', 'Fairfax', 'Virginia', '22036', 'ceidler12@home.pl', '571-329-6007');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (40, 'Tanoodle', 'Charlotte', 'North Carolina', '28272', 'bepton13@quantcast.com', '704-495-2292');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (41, 'Buzzshare', 'Pasadena', 'California', '91103', 'ybeggio14@reddit.com', '626-403-0694');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (42, 'Meedoo', 'Colorado Springs', 'Colorado', '80905', 'mcropper15@addtoany.com', '719-300-8025');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (43, 'Oyoloo', 'Louisville', 'Kentucky', '40205', 'vdoniso16@marriott.com', '502-402-7038');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (44, 'Aimbu', 'Everett', 'Washington', '98206', 'sparlott17@360.cn', '425-314-1217');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (45, 'Podcat', 'Kent', 'Washington', '98042', 'lheighway18@t-online.de', '360-925-0065');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (46, 'Buzzbean', 'Tacoma', 'Washington', '98464', 'rmerchant19@engadget.com', '253-808-9551');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (47, 'Bubbletube', 'Atlanta', 'Georgia', '31106', 'dbrockie1a@shinystat.com', '404-748-9221');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (48, 'Topicshots', 'Fort Lauderdale', 'Florida', '33336', 'jcossam1b@engadget.com', '754-346-2227');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (49, 'Mynte', 'San Bernardino', 'California', '92410', 'sculmer1c@weibo.com', '951-646-0700');
insert into Gardens (ID, name, city, state, zip_code, email, phone) values (50, 'Youspan', 'El Paso', 'Texas', '88569', 'mrodie1d@technorati.com', '915-834-6287');
insert into Product (product_id, type, name, description, stock, garden_id) values (1, 'Physciaceae', 'Rinodina turfacea (Wahlenb.) Körb.', 'dui maecenas tristique est et', false, '1');
insert into Product (product_id, type, name, description, stock, garden_id) values (2, 'Lecanoraceae', 'Lecidella stigmatea (Ach.) Hertel & Leuckert', 'in consequat ut nulla sed', false, '2');
insert into Product (product_id, type, name, description, stock, garden_id) values (3, 'Asteraceae', 'Erigeron utahensis A. Gray var. utahensis', 'sed ante vivamus tortor duis', true, '3');
insert into Product (product_id, type, name, description, stock, garden_id) values (4, 'Asteraceae', 'Verbesina chapmanii J.R. Coleman', 'ante vestibulum ante ipsum primis', true, '4');
insert into Product (product_id, type, name, description, stock, garden_id) values (5, 'Scrophulariaceae', 'Castilleja caudata (Pennell) Rebr. var. caudata', 'arcu libero rutrum ac lobortis', false, '5');
insert into Product (product_id, type, name, description, stock, garden_id) values (6, 'Poaceae', 'Triticum araraticum Jakubz.', 'nec euismod scelerisque quam turpis', true, '6');
insert into Product (product_id, type, name, description, stock, garden_id) values (7, 'Asteraceae', 'Melanthera Rohr', 'arcu sed augue aliquam erat', true, '7');
insert into Product (product_id, type, name, description, stock, garden_id) values (8, 'Hydrophyllaceae', 'Phacelia suaveole', 'ut dolor morbi vel lectus', false, '8');
insert into Product (product_id, type, name, description, stock, garden_id) values (9, 'Lamiaceae', 'Phyllostegia helleri Sherff', 'convallis nunc proin at turpis', false, '9');
insert into Product (product_id, type, name, description, stock, garden_id) values (10, 'Fabaceae', 'Orbexilum simplex (Nutt. ex Torr. & A. Gray) Rydb.', 'ut rhoncus aliquet pulvinar sed', true, '10');
insert into Product (product_id, type, name, description, stock, garden_id) values (11, 'Asteraceae', 'Stevia ovata Willd. var. texana Grashoff', 'nullam orci pede venenatis non', true, '11');
insert into Product (product_id, type, name, description, stock, garden_id) values (12, 'Asteraceae', 'Artemisia nova A. Nelson', 'sit amet justo morbi ut', true, '12');
insert into Product (product_id, type, name, description, stock, garden_id) values (13, 'Splachnaceae', 'Splachnum luteum Hedw. var. luteum', 'natoque penatibus et magnis dis', true, '13');
insert into Product (product_id, type, name, description, stock, garden_id) values (14, 'Myrtaceae', 'Callistemon rug DC.', 'ante vel ipsum praesent blandit', false, '14');
insert into Product (product_id, type, name, description, stock, garden_id) values (15, 'Ranunculaceae', 'Aquilegia jonesii Parry var. jonesii', 'ipsum primis in faucibus orci', false, '15');
insert into Product (product_id, type, name, description, stock, garden_id) values (16, 'Selaginellaceae', 'Selaginella cordifolia (Desv. ex Poir.) Spring', 'nunc viverra dapibus nulla suscipit', false, '16');
insert into Product (product_id, type, name, description, stock, garden_id) values (17, 'Orchidaceae', 'Microthelys Garay', 'duis bibendum felis sed interdum', false, '17');
insert into Product (product_id, type, name, description, stock, garden_id) values (18, 'Fabaceae', 'Prosopis reptans Benth.', 'aenean auctor gravida sem praesent', false, '18');
insert into Product (product_id, type, name, description, stock, garden_id) values (19, 'Poaceae', 'Dichanthelium scoparium (Lam.) Gould', 'erat vestibulum sed magna at', false, '19');
insert into Product (product_id, type, name, description, stock, garden_id) values (20, 'Asteraceae', 'Tetradymia axillaris A.', 'vitae nisl ectus pellentesque', false, '20');
insert into Product (product_id, type, name, description, stock, garden_id) values (21, 'Verbenaceae', 'Premna L.', 'non interdum in ante vestibulum', false, '21');
insert into Product (product_id, type, name, description, stock, garden_id) values (22, 'Brassicaceae', 'Neslia paniculata (L.) Desv.', 'aliquet at feugiat non pretium', false, '22');
insert into Product (product_id, type, name, description, stock, garden_id) values (23, 'Ranunculaceae', 'Ranunculus gormanii Greene', 'mauris lacinquis libero', false, '23');
insert into Product (product_id, type, name, description, stock, garden_id) values (24, 'Hymeneliaceae', 'Aspicilia lesleyana Darbish.', 'ipsum primis in faucibus orci', true, '24');
insert into Product (product_id, type, name, description, stock, garden_id) values (25, 'Campanulaceae', 'Downingia ornatissima Greener) McVaugh', 'a feugiat et eros vestibulum', false, '25');
insert into Product (product_id, type, name, description, stock, garden_id) values (26, 'Pteridaceae', 'Cheilanthes leucopoda Link', 'dapibus at diam nam tristique', true, '26');
insert into Product (product_id, type, name, description, stock, garden_id) values (27, 'Cupressaceae', 'Chamaecyparis pisifera Siebo', 'in hac habitasse platea dictumst', false, '27');
insert into Product (product_id, type, name, description, stock, garden_id) values (28, 'Crassulaceae', 'Crassula solieri (Gay) F. Meigen', 'libero nam dui proin leo', false, '28');
insert into Product (product_id, type, name, description, stock, garden_id) values (29, 'Bromeliaceae', 'Tillandsia setacea Sw.', 'sapien arcu sed augue aliquam', false, '29');
insert into Product (product_id, type, name, description, stock, garden_id) values (30, 'Cyperaceae', 'Rhynchospora depressirostris M.T. Strong', 'est congue elementum in hac', true, '30');
insert into Product (product_id, type, name, description, stock, garden_id) values (31, 'Orchidaceae', 'Masdevallia Ruiz & Pav.', 'convallis nulla neque libero convallis', false, '31');
insert into Product (product_id, type, name, description, stock, garden_id) values (32, 'Cyperaceae', 'Carex oligocarpa Schkuhr ex Willd.', 'volutpat eleifend donec ut dolor', false, '32');
insert into Product (product_id, type, name, description, stock, garden_id) values (33, 'Amblystegiaceae', 'Hygrohypnum luridum (Hedw.) Jenn.', 'diam cras pellentesque volutpat dui', false, '33');
insert into Product (product_id, type, name, description, stock, garden_id) values (34, 'Orchidaceae', 'Mesadenus Schltr.', 'luctus rutrum nulla tellus in', false, '34');
insert into Product (product_id, type, name, description, stock, garden_id) values (35, 'Fabaceae', 'Tephrosia cinerea (L.) Pers.', 'arcu adipiscing molestie hendrerit at', true, '35');
insert into Product (product_id, type, name, description, stock, garden_id) values (36, 'Asteraceae', 'Artemisia serrata Nutt.', 'interdum venenatis turpis enim blandit', false, '36');
insert into Product (product_id, type, name, description, stock, garden_id) values (37, 'Lamiaceae', 'Scutellaria muriculata Epling', 'cum sociis natoque penatibus et', false, '37');
insert into Product (product_id, type, name, description, stock, garden_id) values (38, 'Polygonaceae', 'Triplaris Loefl. ex L.', 'rutrum nulla tellus in sagittis', true, '38');
insert into Product (product_id, type, name, description, stock, garden_id) values (39, 'Poaceae', 'Hypogynium virgatum (Desv. ex Ham.) Dandy', 'mattis egestas metus aenean fermentum', false, '39');
insert into Product (product_id, type, name, description, stock, garden_id) values (40, 'Poaceae', 'Agrostis canina L.', 'morbi vestibulum velit id pretium', false, '40');
insert into Product (product_id, type, name, description, stock, garden_id) values (41, 'Magnoliaceae', 'Liriodendron tulipifera L.', 'porttitor lacus at turpis donec', false, '41');
insert into Product (product_id, type, name, description, stock, garden_id) values (42, 'Apiaceae', 'Oenanthe javanica (Blume) DC. ssp. javanica', 'ultrices vel augue vestibulum ante', false, '42');
insert into Product (product_id, type, name, description, stock, garden_id) values (43, 'Solanaceae', 'Solanum melanocerasum All.', 'convallis tortor risus dapibus augue', true, '43');
insert into Product (product_id, type, name, description, stock, garden_id) values (44, 'Fabaceae', 'Cologania Kunth', 'sapien urna pretium nisl ut', false, '44');
insert into Product (product_id, type, name, description, stock, garden_id) values (45, 'Passifloraceae', 'Passiflora foetida L.', 'suspendisse ornare consequat lectus in', true, '45');
insert into Product (product_id, type, name, description, stock, garden_id) values (46, 'Apiaceae', 'Lomatium scabrum', 'felis sed lacus morbi sem', true, '46');
insert into Product (product_id, type, name, description, stock, garden_id) values (47, 'Fabaceae', 'Astragalus magdalenae Greene', 'vel enim sit amet nunc', true, '47');
insert into Product (product_id, type, name, description, stock, garden_id) values (48, 'Asteraceae', 'Cnicus L.', 'sit amet consectetuer adipiscing elit', true, '48');
insert into Product (product_id, type, name, description, stock, garden_id) values (49, 'Fabaceae', 'Oxytropis campestriselsh', 'placerat praesent blandit nam nulla', false, '49');
insert into Product (product_id, type, name, description, stock, garden_id) values (50, 'Poaceae', 'Neostapfia colusana (Burtt', 'vitae consectetuer eget rutrum at', true, '50');

insert into Inventory (id, garden_id, last_update) values (1, '1', '2022-09-05');
insert into Inventory (id, garden_id, last_update) values (2, '2', '2023-04-07');
insert into Inventory (id, garden_id, last_update) values (3, '3', '2023-03-02');
insert into Inventory (id, garden_id, last_update) values (4, '4', '2022-12-03');
insert into Inventory (id, garden_id, last_update) values (5, '5', '2022-05-20');
insert into Inventory (id, garden_id, last_update) values (6, '6', '2022-04-21');
insert into Inventory (id, garden_id, last_update) values (7, '7', '2022-07-14');
insert into Inventory (id, garden_id, last_update) values (8, '8', '2022-08-04');
insert into Inventory (id, garden_id, last_update) values (9, '9', '2023-01-26');
insert into Inventory (id, garden_id, last_update) values (10, '10', '2022-08-25');
insert into Inventory (id, garden_id, last_update) values (11, '11', '2022-07-27');
insert into Inventory (id, garden_id, last_update) values (12, '12', '2022-08-16');
insert into Inventory (id, garden_id, last_update) values (13, '13', '2023-02-15');
insert into Inventory (id, garden_id, last_update) values (14, '14', '2022-12-16');
insert into Inventory (id, garden_id, last_update) values (15, '15', '2022-12-18');
insert into Inventory (id, garden_id, last_update) values (16, '16', '2022-05-17');
insert into Inventory (id, garden_id, last_update) values (17, '17', '2022-06-07');
insert into Inventory (id, garden_id, last_update) values (18, '18', '2023-01-18');
insert into Inventory (id, garden_id, last_update) values (19, '19', '2023-02-05');
insert into Inventory (id, garden_id, last_update) values (20, '20', '2022-06-04');
insert into Inventory (id, garden_id, last_update) values (21, '21', '2022-12-03');
insert into Inventory (id, garden_id, last_update) values (22, '22', '2022-10-11');
insert into Inventory (id, garden_id, last_update) values (23, '23', '2022-07-15');
insert into Inventory (id, garden_id, last_update) values (24, '24', '2022-10-26');
insert into Inventory (id, garden_id, last_update) values (25, '25', '2023-04-06');
insert into Inventory (id, garden_id, last_update) values (26, '26', '2023-03-26');
insert into Inventory (id, garden_id, last_update) values (27, '27', '2022-08-31');
insert into Inventory (id, garden_id, last_update) values (28, '28', '2022-06-17');
insert into Inventory (id, garden_id, last_update) values (29, '29', '2023-01-12');
insert into Inventory (id, garden_id, last_update) values (30, '30', '2022-11-24');
insert into Inventory (id, garden_id, last_update) values (31, '31', '2023-02-18');
insert into Inventory (id, garden_id, last_update) values (32, '32', '2022-05-17');
insert into Inventory (id, garden_id, last_update) values (33, '33', '2023-03-21');
insert into Inventory (id, garden_id, last_update) values (34, '34', '2022-06-11');
insert into Inventory (id, garden_id, last_update) values (35, '35', '2022-11-26');
insert into Inventory (id, garden_id, last_update) values (36, '36', '2022-05-05');
insert into Inventory (id, garden_id, last_update) values (37, '37', '2022-10-26');
insert into Inventory (id, garden_id, last_update) values (38, '38', '2022-10-07');
insert into Inventory (id, garden_id, last_update) values (39, '39', '2023-03-27');
insert into Inventory (id, garden_id, last_update) values (40, '40', '2023-03-30');
insert into Inventory (id, garden_id, last_update) values (41, '41', '2022-12-14');
insert into Inventory (id, garden_id, last_update) values (42, '42', '2022-08-13');
insert into Inventory (id, garden_id, last_update) values (43, '43', '2022-09-03');
insert into Inventory (id, garden_id, last_update) values (44, '44', '2022-10-16');
insert into Inventory (id, garden_id, last_update) values (45, '45', '2022-09-07');
insert into Inventory (id, garden_id, last_update) values (46, '46', '2022-12-28');
insert into Inventory (id, garden_id, last_update) values (47, '47', '2022-09-03');
insert into Inventory (id, garden_id, last_update) values (48, '48', '2022-05-23');
insert into Inventory (id, garden_id, last_update) values (49, '49', '2023-01-05');
insert into Inventory (id, garden_id, last_update) values (50, '50', '2022-06-01');

insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (1, 'WBAGL83554D618793', 'Plexiglass', '1', '2023-04-08', '2022-06-14', '1');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (2, 'JH4DC53084S095112', 'Wood', '2', '2022-12-22', '2022-10-01', '2');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (3, '1G6DC8EY9B0290590', 'Granite', '3', '2022-09-24', '2022-07-10', '3');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (4, '2HNYD2H27DH034389', 'Vinyl', '4', '2022-08-06', '2022-11-16', '4');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (5, 'WAULC68E75A800493', 'Glass', '5', '2022-11-11', '2022-11-05', '5');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (6, '3VW467AT4DM313361', 'Wood', '6', '2022-12-18', '2023-01-10', '6');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (7, '1D4RE5GG7BC845134', 'Aluminum', '7', '2022-08-30', '2022-11-17', '7');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (8, 'KNADM4A3XF6052213', 'Wood', '8', '2022-12-27', '2022-07-20', '8');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (9, '1GYEE637570596407', 'Plexiglass', '9', '2023-03-10', '2023-01-03', '9');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (10, 'JN1CV6FE0EM550127', 'Wood', '10', '2022-07-16', '2022-12-29', '10');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (11, 'WBANV13549B035658', 'Rubber', '11', '2022-12-16', '2022-06-17', '11');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (12, '5YMKW8C57F0661246', 'Steel', '12', '2022-06-02', '2022-08-19', '12');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (13, 'JN8AZ2KR0BT131954', 'Plastic', '13', '2022-09-13', '2023-01-26', '13');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (14, 'WBADS33411G527675', 'Stone', '14', '2022-10-15', '2023-04-12', '14');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (15, '1VWAP7A35EC982676', 'Granite', '15', '2022-12-10', '2022-08-17', '15');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (16, '1G4HP54K35U327785', 'Plastic', '16', '2023-03-19', '2022-10-07', '16');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (17, 'KM8JT3AB1DU160914', 'Plastic', '17', '2022-09-21', '2023-01-09', '17');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (18, 'WBA3K5C58EK586743', 'Wood', '18', '2023-01-11', '2023-01-14', '18');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (19, '3D73M4HL0AG958212', 'Vinyl', '19', '2023-03-02', '2023-03-09', '19');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (20, '3VW4A7AT5CM489526', 'Plexiglass', '20', '2022-08-04', '2023-01-19', '20');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (21, 'WAUNG74F99N924488', 'Plastic', '21', '2022-07-24', '2023-02-22', '21');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (22, '1C3BCBEB8CN877367', 'Glass', '22', '2022-08-02', '2022-06-15', '22');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (23, 'WP0AA2A91FS894730', 'Granite', '23', '2023-03-19', '2022-08-08', '23');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (24, 'JHMZF1C4XBS646632', 'Wood', '24', '2022-11-20', '2022-04-21', '24');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (25, '1D7RB1GP0AS250344', 'Plastic', '25', '2022-07-14', '2022-07-12', '25');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (26, '3C63DRJL0CG427359', 'Stone', '26', '2022-11-30', '2022-11-09', '26');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (27, '5TFCW5F19DX330130', 'Glass', '27', '2023-02-13', '2023-03-19', '27');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (28, 'WBAYF8C55ED168527', 'Wood', '28', '2023-01-13', '2023-04-03', '28');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (29, '1GYS4FEJ9DR439369', 'Rubber', '29', '2022-11-23', '2022-05-03', '29');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (30, 'YV1672MW1B2602827', 'Brass', '30', '2022-04-26', '2022-08-29', '30');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (31, 'WA1DMAFP6EA605099', 'Wood', '31', '2022-05-13', '2022-11-28', '31');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (32, 'WBA3C3G53FN533993', 'Plastic', '32', '2022-04-30', '2022-11-16', '32');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (33, '1G6DA5EY9B0504126', 'Vinyl', '33', '2022-07-26', '2022-10-20', '33');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (34, '5N1AA0NE9FN550603', 'Granite', '34', '2022-09-05', '2023-01-14', '34');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (35, '2C3CDXBG2CH240417', 'Brass', '35', '2022-07-01', '2023-01-03', '35');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (36, '1GTC5MF93C8958972', 'Stone', '36', '2023-02-02', '2022-06-22', '36');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (37, 'WAUDF78E28A434500', 'Aluminum', '37', '2022-12-18', '2022-07-02', '37');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (38, 'WAUMFBFL4BN915451', 'Wood', '38', '2022-06-23', '2022-12-14', '38');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (39, 'KMHFC4DF7AA275928', 'Glass', '39', '2023-03-12', '2022-10-11', '39');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (40, 'WBAPH5C51BA080981', 'Aluminum', '40', '2023-03-22', '2022-11-12', '40');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (41, '1GKS1AKC7FR762088', 'Granite', '41', '2022-09-06', '2022-08-14', '41');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (42, 'SALGS2DF2DA621588', 'Wood', '42', '2022-06-01', '2023-02-11', '42');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (43, '5GAKVBKD0DJ501476', 'Granite', '43', '2022-11-26', '2023-03-18', '43');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (44, '1HGCP2E35AA223624', 'Glass', '44', '2022-05-06', '2022-09-07', '44');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (45, 'JTDKDTB38C1820234', 'Brass', '45', '2022-11-07', '2022-11-09', '45');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (46, 'WAULT64B94N018084', 'Stone', '46', '2022-11-04', '2023-02-04', '46');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (47, '5N1AA0NC6CN354189', 'Steel', '47', '2022-05-21', '2022-12-14', '47');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (48, 'WP0AA2A86CU672644', 'Steel', '48', '2022-12-02', '2022-08-02', '48');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (49, '1FAHP2DW2BG365174', 'Aluminum', '49', '2022-10-24', '2022-09-07', '49');
insert into Purchases (order_id, shipment_type, storage, product_id, order_date, arrival_date, user_id) values (50, '3N1CE2CP1EL147265', 'Vinyl', '50', '2022-12-31', '2023-03-17', '50');
