import sqlite3

def save_log_SQLite(table,message):
    try:
        conn = sqlite3.connect('../XYZ.db')
        query = "insert into " + table +" (fecha, detalle) values ( datetime('now','localtime'),'" + message + "');"
        conn.execute(query)
        conn.commit()
        return "Records created successfully"
    except IOError as e:
        print('Error (0) in the students_extractor function').format(e.errno, e.strerror)
    finally:
        conn.close()


