from flask import render_template
from . import bp
from sql import sql_query



@bp.route('/')
def index():
    header, team_value = sql_query.get_header_value("teams")
    # print(header, team_value)
    return render_template('table_team.html', header=header, value=team_value)



