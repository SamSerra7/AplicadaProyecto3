
from Configuration.Configuration import postgresql_connection
from Binnacle.SaveLogSQLite import save_log_SQLite

def loader_csv_file_postgre(origin,schema,table):
    try:
        con_postgre = postgresql_connection()
        cur = con_postgre.cursor()
        with open(origin, 'r') as f:
            cur.copy_from(f,schema+'.'+table,sep=',')
            con_postgre.commit()
        save_log_SQLite('migrar','Se migraron los datos a PostgreSQL: tabla -> '+table)
        return 'La migración se realizo con exito'
    except IOError as e:
        print('Error,' + e.errno + 'Uploading data to PostgreSQL:(' + e.strerror + ')')
    finally:
        con_postgre.close()