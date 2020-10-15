import sys
import csv

from Configuration import mssql_connection, get_data_from_sql


# Test Hello World
def hola_mundo():
    print('Hola mundo')


# Students extractor
def students_extractor():

    try:
        query = '[APLICADA].[sp_OBTENER_ESTUDIANTES]'
        con_sql = mssql_connection()
        data = get_data_from_sql(query)
        csvsalida = open('salida.csv', 'w', newline='')
        salida = csv.writer(csvsalida)
        colNames =['CARNE','NOMBRE','APELLIDOS','CARRERA','DIRECCION','PROMEDIO']
        print(colNames)
        salida.writerow(colNames)

        if len(data) <= 0:
            print('No data')
            sys.exit(0)
        else:
            for row in data:
                salida = csv.writer(csvsalida)
                print(row)
                salida.writerow(row)
                del salida

    except IOError as e:
        print('Error (0) in the students_extractor function').format(
            e.errno, e.strerror)
    finally:
        con_sql.close()


students_extractor()