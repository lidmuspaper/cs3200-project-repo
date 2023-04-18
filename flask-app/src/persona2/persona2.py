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