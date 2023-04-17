from flask import Blueprint, request, jsonify, make_response
import json
from src import db

persona2 = Blueprint('persona2', __name__)

@persona2.route('/persona1', methods=['GET'])
def get_plants():
	pass