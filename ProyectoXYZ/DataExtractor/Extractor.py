import sys
import csv
import time

from Configuration.Configuration import procedure_from_sql_delete,procedure_from_sql, mssql_connection_odbc
from Binnacle.SaveLogSQLite import save_log_SQLite



#Extractor
def extractor_SqlServer (schema,procedure,table):

    try:
        query = schema+'.'+procedure
        data = procedure_from_sql(query)
        print(query)

        if len(data) <= 0:
            print('No data')
            sys.exit(0)
        else:
            currentTime = time.strftime('%Y%m%d%M%S')
            csvsalida = open(currentTime+"_out.csv", 'w', newline='')

            for row in data:
                salida = csv.writer(csvsalida)
                salida.writerow(row)
                del salida

        procedure_from_sql_delete()
        print(save_log_SQLite('extraer', 'Se extrajeron los datos desde Sqlserver: tabla -> '+table ))
        return csvsalida.name
    except IOError as e:
        print('Error (0) in the students_extractor function').format(e.errno, e.strerror)



