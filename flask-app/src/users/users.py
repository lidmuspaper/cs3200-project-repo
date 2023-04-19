from flask import Blueprint, request, jsonify, make_response, current_app
import json, random
from src import db

users = Blueprint('users', __name__)

# Get all users' names and their ids
@users.route('/get_all_names', methods=['GET'])
def get_all_names():
    cursor = db.get_db().cursor()
    cursor.execute('select full_name, user_id from User')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Add a new user
@users.route('/add_new_user', methods=['POST'])
def add_user():
    data = request.json
    current_app.logger.info(data)

    full_name = data['full_name']
    email = data['email']
    experience_level = data['experience_level']
    city = data['city']
    state = data['state']
    zip_code = data['zip_code']

    query = 'INSERT INTO User (full_name, email, Experience_level, city, state, zip_code) VALUES ('
    query += '"' + full_name + '","'
    query += email + '",'
    query += str(experience_level) + ', "'
    query += city + '","'
    query += state + '",'
    query += str(zip_code) + ')'

    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return query

# Gets latest added user's id
@users.route('/get_latest', methods=['GET'])
def get_latest():
    cursor = db.get_db().cursor()
    cursor.execute('select user_id from User ORDER BY user_id DESC LIMIT 1')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Update weather for given user
@users.route('/add_weather', methods=['POST'])
def add_weather():
    data = request.json
    current_app.logger.info(data)

    user_id = data['user_id']

    query = 'INSERT INTO Weather (Chance_of_rain, Temperature, Sunlight, Humidity, user_id) VALUES ('
    query += str(random.randint(0, 100)) + ','
    query += str(random.randint(0, 100)) + ','
    query += str(random.randint(0, 100)) + ','
    query += str(random.randint(0, 100)) + ','
    query += str(user_id) + ')'

    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return query