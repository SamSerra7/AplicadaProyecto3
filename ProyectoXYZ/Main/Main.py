from DataExtractor.Extractor import extractor_SqlServer
from DataLoader.Loader import loader_csv_file_postgre

#system variables
schemas=['customers','sales']
tables=['cliente','direccion','telefono','email','tarjeta_credito','factura','producto','producto_factura']
procedures = ['listar_clientes','listar_direccion','listar_email','listar_tarjeta','listar_telefono','listar_factura','listar_producto','listar_producto_factura']

def menu():

    fecha_inicio = input("Fecha inicio -> 'aaaa-mm-dd': ")
    fecha_final = input("Fecha final -> 'aaaa-mm-dd': ")
    loader_csv_file_postgre(
        extractor_SqlServer(schemas[0], procedures[0]+" '"+fecha_inicio+"','"+fecha_final+"'",tables[0]),
        schemas[0],
        tables[0]
    )
    
menu()