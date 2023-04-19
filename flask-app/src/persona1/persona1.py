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

# Get all user's plants and their locations from the DB
@persona1.route('/get_all_plants', methods=['GET'])
def get_plants():
    data = request.json
    current_app.logger.info(data)

    cursor = db.get_db().cursor()
    cursor.execute('select * from Plant LEFT JOIN PLANT_LOCATION on (Plant.plant_id = PLANT_LOCATION.plant_id) WHERE user_id = ' + str(data['user_id']))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get all plants of a user without a location
@persona1.route('/get_locationless', methods=['GET'])
def get_locationless():
    data = request.json
    current_app.logger.info(data)

    cursor = db.get_db().cursor()
    cursor.execute('SELECT shown_name, plant_id from Plant left join PLANT_LOCATION USING (plant_id) WHERE PLANT_LOCATION.location_id is null AND user_id = ' + str(data['user_id']))
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

# Adds a new plant location
@persona1.route('/add_plant_location', methods=['POST'])
def add_location():
    data = request.json
    current_app.logger.info(data)

    plant_id = data['plant_id']
    location_name = data['location_name'] 

    query = 'INSERT INTO PLANT_LOCATION (plant_id, location_name) VALUES ('
    query += str(plant_id) + ',"'
    query += location_name + '")'

    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return query

# Edit an existing plant
@persona1.route('/edit_plant', methods=['PUT'])
def edit_plant():
    data = request.json
    current_app.logger.info(data)

    plant_id = data['p_id']
    shown_name = data['new_name'] 
    size = data['height']
    age = data['new_age']

    query = 'Update Plant set shown_name = "'
    query += shown_name + '",age='
    query += str(age) + ',size='
    query += str(size) + ' where plant_id = '
    query += str(plant_id)

    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return query

# Deletes a selected plant
@persona1.route('/delete_plant', methods=['DELETE'])
def delete_plant():
    data = request.json
    current_app.logger.info(data)

    query = 'DELETE from Plant where plant_id =' + str(data['plant_id'])

    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return query

# Get plant info of a given plant_name
@persona1.route('/get_info', methods=['GET'])
def get_info():
    data = request.json
    current_app.logger.info(data)

    cursor = db.get_db().cursor()
    cursor.execute('select * from Plant_info where name = "' + data['plant_name'] + '"')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get all symptoms
@persona1.route('/get_symptoms', methods=['GET'])
def get_symptoms():
    cursor = db.get_db().cursor()
    cursor.execute('select symptoms from Illness')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get illness info of a given symptom
@persona1.route('/get_illness', methods=['GET'])
def get_illness():
    data = request.json
    current_app.logger.info(data)

    cursor = db.get_db().cursor()
    cursor.execute('select * from Illness where symptoms = "' + data['symptoms'] + '"')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response