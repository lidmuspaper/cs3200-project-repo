from flask import Blueprint, request, jsonify, make_response
import json
from src import db

persona2 = Blueprint('persona2', __name__)

@persona2.route('/persona1', methods=['GET'])
def get_plants():
	pass

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
@persona2.route('/get_location', methods=['GET'])
def get_location():
    data = request.json
    current_app.logger.info(data)

    cursor = db.get_db().cursor()
    cursor.execute('select * from Locatoin WHERE user_id = ' + str(data['user_id']))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get plants' location from the DB based on the plant_id
@persona2.route('/get_location', methods=['GET'])
def get_location():
    data = request.json
    current_app.logger.info(data)

    cursor = db.get_db().cursor()
    cursor.execute('select location_name from Plant_Location WHERE plant_id = ' + str(data['plant_id']))
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
@persona2.route('/get_last_water_fert_repot', methods=['GET'])
def get_last_water_fert_repot():
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