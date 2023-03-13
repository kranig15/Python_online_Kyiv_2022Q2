from flask import render_template
from . import bp
from sql import sql_query


@bp.route('/')
def index():
    header, actions_value = sql_query.get_header_value("actions")
    return render_template('table_action.html', header=header, value=actions_value)



