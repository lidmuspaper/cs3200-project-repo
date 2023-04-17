from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

users = Blueprint('users', __name__)

# Get all users' names and their ids
@users.route('/get_all_names', methods=['GET'])
def get_types():
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