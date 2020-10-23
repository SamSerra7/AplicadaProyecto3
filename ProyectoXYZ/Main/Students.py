import sys
import csv
import time

from Configuration.Configuration import mssql_connection, get_data_from_sql, postgresql_connection

#system variables
schema='aplicada'
table='estudiantes_curso'

# Students extractor
def students_extractor():

    try:
        query = '[APLICADA].[sp_OBTENER_ESTUDIANTES]'
        con_sql = mssql_connection()
        data = get_data_from_sql(query)

        if len(data) <= 0:
            print('No data')
            sys.exit(0)
        else:
            currentTime = time.strftime('%Y%m%d%M%S')
            csvsalida = open(currentTime+"_salida.csv", 'w', newline='')
            salida = csv.writer(csvsalida)
            colNames = ['CARNE', 'NOMBRE', 'APELLIDOS', 'CARRERA', 'DIRECCION', 'PROMEDIO']
            salida.writerow(colNames)

            for row in data:
                salida = csv.writer(csvsalida)
                print(row)
                salida.writerow(row)
                del salida
        return csvsalida.name
    except IOError as e:
        print('Error (0) in the students_extractor function').format(
            e.errno, e.strerror)
    finally:
        con_sql.close()

def loader_csv_file_postgre(origin,schema,table):
    try:

        con_postgre = postgresql_connection()
        cur = con_postgre.cursor()

        with open(origin, 'r') as f:
            #SALTO DE LINEA
            next(f)
            cur.copy_from(f,schema+'.'+table,sep=',')
            con_postgre.commit()

    except IOError as e:
        print("Error,(0) Uploading data to PostgreSQL:(1)"+ e.errno+e.strerror)
    finally:
        con_postgre.close()

loader_csv_file_postgre(students_extractor(),schema,table)