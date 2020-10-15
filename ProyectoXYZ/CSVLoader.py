import sys
import psycopg2

param_dic = {
    "host": "localhost",
    "database": "XYZ",
    "user": "postgres",
    "password": "Monkey1099"
}


def connect(params_dic):
    conn = None
    try:
        # connect to the PostgreSQL server
        print('Connecting to the PostgreSQL database...')
        conn = psycopg2.connect(**params_dic)
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
        sys.exit(1)
    print("Connection successful")
    return conn

def copy_from_file(conn,file,schema,table):
    cur = conn.cursor()
    with open(file, 'r') as f:
        next(f)
        cur.copy_from(f, schema+'.'+table, sep=',')
    conn.commit()

conn = connect(param_dic)
copy_from_file(conn, "MOCK_DATA.csv", "customers", "cliente")