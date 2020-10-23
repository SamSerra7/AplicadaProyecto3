import pymssql
import psycopg2

# conecction to PosgreSQL Server
_postgre_server = "163.178.107.7"
_postgre_database = "XYZ"
_postgre_server_port = 5432
_postgre_user = "laboratorios"
_postgre_password = "saucr.120"

# conecction to SQL Server
_sql_server = '163.178.107.10'
_sql_database = 'XYZ'
_sql_server_port = 1433
_sql_user = "laboratorios"
_sql_password = "KmZpo.2796"


# SQL SERVER CONNECTION FUNCTION
def mssql_connection():
    try:
        cnx = pymssql.connect(server=_sql_server,
                              port=_sql_server_port,
                              user=_sql_user,
                              password=_sql_password,
                              database=_sql_database)
        return cnx
    except:
        print('ERROR: MSSQL CONNECTION')


# CALL STORE PROCEDURE FROM SQL SERVER
def get_data_from_sql(sp):
    try:
        con = mssql_connection()
        cur = con.cursor()
        cur.execute("EXECUTE" + sp)
        data_return = cur.fetchall()
        con.commit()
        return data_return
    except IOError as e:
        print("Error:(0) Getting data from MSSQL:(1)".format(
            e.errno, e.strerror
        ))


# POSTGRESQL CONNECTION FUNCTION
def postgresql_connection():
    try:
        cnx = psycopg2.connect(
            "host=" + _postgre_server + " dbname=" + _postgre_database
            + " user=" + _postgre_user + " password=" + _postgre_password)
        return cnx
    except:
        print('Error:PostgreSQL Connection Failed')
