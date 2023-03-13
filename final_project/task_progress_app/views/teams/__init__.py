from flask import Blueprint

bp = Blueprint('teams', __name__)

from . import routes
