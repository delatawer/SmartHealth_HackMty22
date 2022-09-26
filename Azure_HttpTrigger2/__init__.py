import logging
import smtplib 
from email.message import EmailMessage
import azure.functions as func
#a01366990@tec.mx

# Configure email headers 
email_subject = "Alerta!" 
sender_email_address = "email@outlook.com" 
email_password = "password"
receiver_email_address = "receiver_email@any.com" 
email_smtp = "smtp-mail.outlook.com" 


message = EmailMessage()

def main(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')

    alerta = req.params.get('alerta')
    if not alerta:
        try:
            req_body = req.get_json()
        except ValueError:
            pass
        else:
            alerta = req_body.get('alerta')

    try:
        del message['To'] 
        del message['From'] 
        del message['Subject']
    except:
        pass
    message['Subject'] = email_subject 
    message['From'] = sender_email_address 
    message['To'] = receiver_email_address

    if alerta:
        if int(alerta) == 1:
            message.set_content("Alerta con el pulso!")
        elif int(alerta) == 2:
            message.set_content("Alerta con la oxigenación!")
        else:
            message.set_content("Alerta con el pulso y la oxigenación!")
        server = smtplib.SMTP(email_smtp, '587') 
        server.ehlo()
        server.starttls() 
        server.login(sender_email_address, email_password)
        server.send_message(message)
        server.quit()
        del message['To'] 
        del message['From'] 
        del message['Subject'] 
        return func.HttpResponse(
                    "Done!",
                    status_code=200)
    else:
        return func.HttpResponse(
             "This HTTP triggered function executed successfully. Pass a name in the query string or in the request body for a personalized response.",
             status_code=200
        )
