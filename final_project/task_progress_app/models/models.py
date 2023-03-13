from app import db
from datetime import datetime




class Operation(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    amount = db.Column(db.String(64))
    currency = db.Column(db.String(3))
    description = db.Column(db.String(128))
    timestamp = db.Column(db.DateTime, index=True, default=datetime.utcnow)
