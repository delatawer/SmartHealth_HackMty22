import max30102
import hrcalc
import serial
import string
import time
import requests

ser = serial.Serial('/dev/ttyACM0', 9600)
m = max30102.MAX30102()

hr2 = 0
sp2 = 0
pasos = 0
paciente = 4
count = 0

while True:
    rawserial = ser.readline()
    cookedserial = rawserial.decode('utf-8').strip('\r\n')
    datasplit = cookedserial.split(',')
    if len(datasplit) == 2:
        pasos = datasplit[1].strip('>')

    red, ir = m.read_sequential()
    hr,hrb,sp,spb = hrcalc.calc_hr_and_spo2(ir, red)

    if(hrb == True and hr != -0 and hr < 105):
        hr2 = int(hr)
    if(spb == True and sp != -0 and sp < 100):
        sp2 = int(sp)

    if count >12:
        if hr2 > 100 and sp2 >= 90:
            urlA = "http://192.168.43.72:7071/api/HttpTrigger2?alerta=1?"
            a = requests.post(urlA)
        if sp2 < 90 and hr2 <= 100:
            urlA = "http://192.168.43.72:7071/api/HttpTrigger2?alerta=2"
            b = requests.post(urlA)
        if hr2 > 100 and sp2 < 90:
            urlA = "http://192.168.43.72:7071/api/HttpTrigger2?alerta=3"
            c = requests.post(urlA)


        url = "http://192.168.43.72:7071/api/HttpTrigger1?paciente={}&oxigeno={}&pasos={}&fcardiaca={}".format(paciente, sp2, pasos, hr2)
        x = requests.post(url)
        print(url)
    #print(pasos)
    count += 1
    print(datasplit)
    print (count)
    #time.sleep(15)
