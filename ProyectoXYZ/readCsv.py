#importaciones necesarias
import csv
import operator

#se lee el archivo deseado
with open('MOCK_DATA.csv') as csvarchivo:
    entrada = csv.reader(csvarchivo)
    for reg in entrada:
        #Se imprime todo el registro cada línea se muestra como una lista de campos
        #print(reg)

        #se extraen las columnas
        id,first_name,last_name,email,gender,ip_address = next(entrada)  # Leer campos
        #se imprimen campos deseados
        print(id,first_name)  # Mostrar campos

#referencia
#https://python-para-impacientes.blogspot.com/2015/05/operaciones-con-archivos-csv.html