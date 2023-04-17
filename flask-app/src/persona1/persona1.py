from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

persona1 = Blueprint('persona1', __name__)

# Get all plants from the DB
@persona1.route('/get_all_plants', methods=['GET'])
def get_plants():
    cursor = db.get_db().cursor()
    cursor.execute('select * from Plant')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

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
