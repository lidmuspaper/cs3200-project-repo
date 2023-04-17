from flask import Blueprint, request, jsonify, make_response
import json
from src import db

persona1 = Blueprint('persona1', __name__)

# Get all plants from the DB
@persona1.route('/get_all_plants', methods=['GET'])
def get_plants():
    cursor = db.get_db().cursor()
    cursor.execute('select plant_id from Plant')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response