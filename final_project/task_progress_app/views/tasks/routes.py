from flask import render_template
from . import bp
from sql import sql_query




@bp.route('/')
def index():
    header, task_value = sql_query.get_header_value("tasks")
    return render_template(['table_task.html', 'filter.html'], header=header, value=task_value)



