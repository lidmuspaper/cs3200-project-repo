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

# Get all user's plants' location from the DB
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

# Get location details based on location_name
@persona2.route('/get_location', methods=['GET'])
def get_location():
    data = request.json
    current_app.logger.info(data)

    cursor = db.get_db().cursor()
    cursor.execute('select * from Location where location_name = ' + str(data['location_name']))
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

    query = 'INSERT INTO Location (location_name, temp, humidity, sunlight) VALUES ('
    query += location_name + ', '
    query += str(temp) + ', "'
    query += str(humidity) + '", "'
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

    query = 'DELETE from Location where location_name =' + str(data['location_name'])

    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return query