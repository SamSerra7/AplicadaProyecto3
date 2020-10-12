import sqlite3
conn = sqlite3.connect('XYZ.db')
print("Opened database successfully");
#conn.execute("insert into migrar (fecha, detalle) values ( datetime('now','localtime'), 'Se migraron los datos a PoSTGRES');");
conn.execute("insert into extraer (fecha, detalle) values ( datetime('now','localtime'), 'Se extrajeron los datos de Sqlserver');");
conn.commit()
print("Records created successfully");
conn.close()