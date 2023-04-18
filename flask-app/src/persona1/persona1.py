from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

persona1 = Blueprint('persona1', __name__)

# Get all types of plants
@persona1.route('/get_all_types', methods=['GET'])
def get_types():
    cursor = db.get_db().cursor()
    cursor.execute('select name from Plant_info')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get all locations
@persona1.route('/get_locations', methods=['GET'])
def get_locations():
    cursor = db.get_db().cursor()
    cursor.execute('select location_name from Location')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get all user's plants from the DB
@persona1.route('/get_all_plants', methods=['GET'])
def get_plants():
    data = request.json
    current_app.logger.info(data)

    cursor = db.get_db().cursor()
    cursor.execute('select * from Plant WHERE user_id = ' + str(data['user_id']))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Adds a new plant
@persona1.route('/add_new_plant', methods=['POST'])
def add_plant():
    data = request.json
    current_app.logger.info(data)

    size = data['size']
    age = data['age'] 
    plant_name = data['plant_name']
    shown_name = data['shown_name']
    user_id = data['user_id']

    query = 'INSERT INTO Plant (size, age, plant_name, shown_name, user_id) VALUES ('
    query += str(size) + ', '
    query += str(age) + ', "'
    query += plant_name + '", "'
    query += shown_name + '", '
    query += str(user_id) + ')'

    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return query

# Adds a new plant schedule
@persona1.route('/add_plant_schedule', methods=['POST'])
def add_schedule():
    data = request.json
    current_app.logger.info(data)

    size = data['size']
    age = data['age'] 
    plant_name = data['plant_name']
    shown_name = data['shown_name']
    user_id = data['user_id']

    query = 'INSERT INTO Plant (size, age, plant_name, shown_name, user_id) VALUES ('
    query += str(size) + ', '
    query += str(age) + ', "'
    query += plant_name + '", "'
    query += shown_name + '", '
    query += str(user_id) + ')'

    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return query

# Adds a new plant location
@persona1.route('/add_plant_location', methods=['POST'])
def add_location():
    data = request.json
    current_app.logger.info(data)

    size = data['size']
    age = data['age'] 
    plant_name = data['plant_name']
    shown_name = data['shown_name']
    user_id = data['user_id']

    query = 'INSERT INTO Plant (size, age, plant_name, shown_name, user_id) VALUES ('
    query += str(size) + ', '
    query += str(age) + ', "'
    query += plant_name + '", "'
    query += shown_name + '", '
    query += str(user_id) + ')'

    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return query

@persona1.route('/delete_plant', methods=['DELETE'])
def delete_plant():
    data = request.json
    current_app.logger.info(data)

    query = 'INSERT INTO Plant (size, age, plant_name, shown_name, user_id) VALUES ('

    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return query