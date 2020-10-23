import sys
import csv
import time

from Configuration.Configuration import mssql_connection, get_data_from_sql
from Binnacle.SaveLogSQLite import save_log_SQLite

# Students extractor
def extractor_SqlServer (schema,procedure,table):

    try:
        query = schema+'.'+procedure
        con_sql = mssql_connection()
        data = get_data_from_sql(query)

        if len(data) <= 0:
            print('No data')
            sys.exit(0)
        else:
            currentTime = time.strftime('%Y%m%d%M%S')
            csvsalida = open(currentTime+"_out.csv", 'w', newline='')

            for row in data:
                salida = csv.writer(csvsalida)
                #print(row)
                salida.writerow(row)
                del salida
        print(save_log_SQLite('extraer', 'Se extrajeron los datos desde Sqlserver: tabla -> '+table))
        return csvsalida.name
    except IOError as e:
        print('Error (0) in the students_extractor function').format(e.errno, e.strerror)
    finally:
        con_sql.close()


#print(students_extractor('','listar_clientes','clientes'))