import logging
import azure.functions as func
import pyodbc

def main(req: func.HttpRequest) -> func.HttpResponse:
    server = 'smarthealthdb.database.windows.net'
    database = 'SmarthHealth_DB'
    username = 'SmarthHealthDB'
    password = '5rUBXEMSREBsRzZ'   
    driver= '{ODBC Driver 17 for SQL Server}'

    voxigeno = req.params.get('oxigeno')
    vpasos = req.params.get('pasos')
    vfcardiaca = req.params.get('fcardiaca')
    vpaciente = req.params.get('paciente')

    if not vpaciente:
        try:
            req_body = req.get_json()
        except ValueError:
            pass
        else:
            voxigeno = req_body.get('oxigeno')
            vpasos = req_body.get('pasos')
            vfcardiaca = req_body.get('fcardiaca')
            vpaciente = req_body.get('paciente')
   

    if vpaciente and voxigeno and vpasos and vfcardiaca:
         with pyodbc.connect('DRIVER='+driver+';SERVER=tcp:'+server+';PORT=1433;DATABASE='+database+';UID='+username+';PWD='+ password) as conn:
            with conn.cursor() as cursor:
                cursor.execute("INSERT INTO Stats (id_paciente, oxigeno, pasos, fcardiaca) VALUES ({}, {}, {}, {})".format(vpaciente, voxigeno, vpasos, vfcardiaca))
                return func.HttpResponse(
                    "Done!",
                    status_code=200
        )
    else:
        return func.HttpResponse(
             "This HTTP triggered function executed successfully. Pass a name in the query string or in the request body for a personalized response.",
             status_code=200
        )
