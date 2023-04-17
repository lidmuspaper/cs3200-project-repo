from flask import Blueprint, request, jsonify, make_response
import json
from src import db

persona1 = Blueprint('persona1', __name__)

# Get all plants from the DB
@persona1.route('/persona1', methods=['GET'])
def get_plants():
	pass