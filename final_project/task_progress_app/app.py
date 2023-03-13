import sys
sys.path.append(sys.path[0])

from flask import Flask, redirect
from config import Config
from extensions import mysql

def create_app(config_class=Config):
    app = Flask(__name__)
    app.config.from_object(config_class)

    # Initialize Flask extensions here
    mysql.init_app(app)

    # Register blueprints here
    from views.tasks import bp as task_bp
    app.register_blueprint(task_bp, url_prefix='/tasks')

    from views.actions import bp as action_bp
    app.register_blueprint(action_bp, url_prefix='/actions')

    from views.teams import bp as team_bp
    app.register_blueprint(team_bp, url_prefix='/teams')

    @app.route('/')
    def index():
        return redirect('/tasks')

    return app


if __name__ == "__main__":
    create_app().run(debug=True)