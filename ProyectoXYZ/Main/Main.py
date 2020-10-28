from DataExtractor.Extractor import extractor_SqlServer
from DataLoader.Loader import loader_csv_file_postgre

#system variables
schemas = ['customers', 'sales']
tables = ['cliente', 'direccion', 'telefono', 'email', 'tarjeta_credito', 'factura', 'producto', 'producto_factura']
procedures = ['listar_clientes', 'listar_direccion', 'listar_telefono', 'listar_email', 'listar_tarjeta',
              'listar_factura', 'listar_producto', 'listar_producto_factura']

def menu():

    while True:
        print("Ingrese una de las siguientes opciones a migrar")
        print(
            "1.Clientes \n2.Direccion \n3.Telefonos \n4.Email \n5.Tarjetas de Credito \n6.Facturas \n7.Productos \n8.Ordenes \n9.Salir")
        option = int(input("Seleccione una opción: "))
        if option > 0 and option < 9:
            s = 1 if (option > 5) else 0
            fecha_inicio = input("Fecha inicio -> 'aaaa-mm-dd': ")
            fecha_final = input("Fecha final -> 'aaaa-mm-dd': ")
            loader_csv_file_postgre(
                extractor_SqlServer(schemas[s],
                                    procedures[option - 1] + " '" + fecha_inicio + "','" + fecha_final + "'",
                                    tables[option - 1]),
                schemas[s],
                tables[option - 1]
            )
        else:
            print("Seleccionó salir, Gracia!")
            break
        print("\n")

menu()