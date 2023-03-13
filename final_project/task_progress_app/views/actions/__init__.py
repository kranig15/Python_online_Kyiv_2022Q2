from flask import Blueprint

bp = Blueprint('actions', __name__)

from . import routes
