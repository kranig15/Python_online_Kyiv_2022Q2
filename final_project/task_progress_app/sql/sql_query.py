from app import mysql

def get_header_value(table_name):
    cursor = mysql.connection.cursor()
    cursor.execute(f"SELECT column_name FROM information_schema.columns WHERE table_name = '{table_name}' ")
    header = cursor.fetchall()
    cursor.execute(f'SELECT * FROM {table_name} ')
    values = cursor.fetchall()
    mysql.connection.commit()
    cursor.close()
    header = [h[0] for h in header]
    return header, values