#importaciones necesarias
import csv
import operator


#salida.writerow([ 'id', 'first_name', 'last_name', 'email', 'gender', 'ip_address'])
with open('MOCK_DATA.csv') as csvarchivo:

    entrada = csv.reader(csvarchivo)

    csvsalida = open('salida.csv', 'w', newline='')

    for reg in entrada:
        salida = csv.writer(csvsalida)
        print(reg)
        salida.writerow(reg)
        del salida

    csvsalida.close()