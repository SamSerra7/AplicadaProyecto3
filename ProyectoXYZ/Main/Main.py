from DataExtractor.Extractor import extractor_SqlServer
from DataLoader.Loader import loader_csv_file_postgre

#system variables
schemas=['customers','sales']
tables=['cliente','direccion','telefono','email','tarjeta_credito','factura','producto','producto_factura']
procedures = ['listar_clientes']

def menu():
    loader_csv_file_postgre(
        extractor_SqlServer('', procedures[0],tables[0]),
        schemas[0],
        tables[0]
    )

menu()