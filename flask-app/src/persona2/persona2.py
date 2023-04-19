from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

persona2 = Blueprint('persona2', __name__)

# Get this user's weather from the DB
@persona2.route('/get_weather', methods=['GET'])
def get_weather():
    data = request.json
    current_app.logger.info(data)

    cursor = db.get_db().cursor()
    cursor.execute('select * from Weather WHERE user_id = ' + str(data['user_id']))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get location of a plant
@persona2.route('/get_plant_location', methods=['GET'])
def get_plant_location():
    data = request.json
    current_app.logger.info(data)

    cursor = db.get_db().cursor()
    cursor.execute('select location_name from PLANT_LOCATION where plant_id = ' + str(data['plant_id']))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get all location data
@persona2.route('/get_location_data', methods=['GET'])
def get_location_data():

    cursor = db.get_db().cursor()
    cursor.execute('select * from Location')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


# Get location details based on location_name
@persona2.route('/get_location', methods=['GET'])
def get_location():
    data = request.json
    current_app.logger.info(data)

    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM Location WHERE location_name = ' + str(data['location_name']))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get watering_timer, fertilizing_timer, repotting_timer of with the plant_id from the DB
@persona2.route('/get_water_fert_repot', methods=['GET'])
def get_water_fert_repot():
    data = request.json
    current_app.logger.info(data)

    cursor = db.get_db().cursor()
    cursor.execute('SELECT watering_timer, fertilizing_timer, repotting_timer FROM Plant_care_routine WHERE plant_id = ' + str(data['plant_id']))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get last_watered, last_repotted, last_fertilized with the plant_id from the DB
@persona2.route('/get_last_water_fert_repot', methods=['GET'])
def get_last_water_fert_repot():
    data = request.json
    current_app.logger.info(data)

    cursor = db.get_db().cursor()
    cursor.execute('SELECT last_fertilized, last_repotted, last_watered FROM Plant_care_routine WHERE plant_id = ' + str(data['plant_id']))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get type_fertilizer, pot_size, soil_type, watering_amount with the plant_id from the DB
@persona2.route('/get_fert_pot_soil', methods=['GET'])
def get_fert_pot_soil():
    data = request.json
    current_app.logger.info(data)

    cursor = db.get_db().cursor()
    cursor.execute('SELECT type_fertilizer, pot_size, soil_type, watering_amount FROM Plant_care_routine WHERE plant_id = ' + str(data['plant_id']))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Adds a location
@persona2.route('/add_new_location', methods=['POST'])
def add_location():
    data = request.json
    current_app.logger.info(data)

    location_name = data['location_name']
    temp = data['temp'] 
    humidity = data['humidity']
    sunlight = data['sunlight']

    query = 'INSERT INTO Location (location_name, temp, humidity, sunlight) VALUES ("'
    query += location_name + '", '
    query += str(temp) + ','
    query += str(humidity) + ','
    query += str(sunlight) + ')'

    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return query

# Deletes a selected location
@persona2.route('/delete_location', methods=['DELETE'])
def delete_plant():
    data = request.json
    current_app.logger.info(data)

    query = 'DELETE from Location where location_name = "' + data['location_name'] + '"'

    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return query

# Get all plants of a user without a schedule
@persona2.route('/get_scheduleless', methods=['GET'])
def get_scheduleless():
    data = request.json
    current_app.logger.info(data)

    cursor = db.get_db().cursor()
    cursor.execute('SELECT shown_name, plant_id from Plant left join Plant_care_routine USING (plant_id) WHERE Plant_care_routine.plant_id is null AND user_id = ' + str(data['user_id']))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Adds a schedule
@persona2.route('/add_schedule', methods=['POST'])
def add_schedule():
    data = request.json
    current_app.logger.info(data)

    plant_id = data['plant_id']
    watering_timer = data['watering_timer'] 
    fertilizing_timer = data['fertilizing_timer']
    repotting_timer = data['repotting_timer']
    type_fertilizer = data['type_fertilizer'] 
    pot_size = data['pot_size']
    soil_type = data['soil_type']
    watering_amount = data['watering_amount']

    query = 'INSERT INTO Plant_care_routine (plant_id, watering_timer, fertilizing_timer, repotting_timer, type_fertilizer, pot_size, soil_type, watering_amount) VALUES ('
    query += str(plant_id) + ','
    query += str(watering_timer) + ','
    query += str(fertilizing_timer) + ','
    query += str(repotting_timer) + ',"'
    query += type_fertilizer + '",'
    query += str(pot_size) + ',"'
    query += soil_type + '",'
    query += str(watering_amount) + ')'

    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return query

# Get all plant schedules belonging to a user
@persona2.route('/get_schedules', methods=['GET'])
def get_schedules():
    data = request.json
    current_app.logger.info(data)

    cursor = db.get_db().cursor()
    cursor.execute('select * from Plant_care_routine left join Plant on Plant_care_routine.plant_id = Plant.plant_id where user_id = ' + str(data['user_id']))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Updates a plant's schedule
@persona2.route('/edit_schedule', methods=['PUT'])
def edit_schedule():
    data = request.json
    current_app.logger.info(data)

    plant_id = data['plant_id']
    watering_timer = data['watering_timer']
    repotting_timer = data['repotting_timer']
    fertilizing_timer = data['fertilizing_timer']
    type_fertilizer = data['type_fertilizer']
    pot_size = data['pot_size']
    soil_type = data['soil_type']
    watering_amount = data['watering_amount']


    query = 'Update Plant_care_routine set watering_timer='
    query += str(watering_timer) + ', repotting_timer='
    query += str(repotting_timer) + ', fertilizing_timer='
    query += str(fertilizing_timer) + ', type_fertilizer="'
    query += type_fertilizer + '",  pot_size='
    query += str(pot_size) + ', soil_type="'
    query += soil_type + '", watering_amount='
    query += str(watering_amount) + ' WHERE plant_id = ' + str(plant_id)

    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return query