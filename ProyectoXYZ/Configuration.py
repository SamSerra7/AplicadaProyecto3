import pymssql

# conecction to SQL Server

_sql_server = '163.178.107.10'
_sql_database = 'IF6201_A95777_2020'
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
