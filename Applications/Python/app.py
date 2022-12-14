
#import des bibliothèque 
import time
import paho.mqtt.client as mqtt
import json
import configparser
from configparser import ExtendedInterpolation
from datetime import datetime
import os
import signal

#On créer un objet 
config = configparser.ConfigParser(interpolation=ExtendedInterpolation())
config.read('./config.ini')

#On récupère les différent paramètre nécessaire au fonctionnement
#Le serveur
mqttServer = config['server']['server-1']
#Les appareils choisi
devicesChoisi = config["devices"]["device_choisi"].split(",")
#Les appareils choisi
dataChoisi = config["data"]["data_choisi"].split(",")
#L'application
app = config['application']['appID-1']
#La fréquence
frequence = int(config["frequences"]["freq-1"])

#les seuils
s_co2 = int (config['seuils']['co2'])
s_humidity_min = int (config['seuils']['humidity-1'])
s_humidity_max = int (config['seuils']['humidity-2'])
s_temperature_min = int (config['seuils']['temp-1'])
s_temperature_max = int (config['seuils']['temp-2'])
s_activity = int (config['seuils']['activity'])

# Si le fichier de donnée n'existe pas, on le crée; s'il existe et que ca taille n'existe pas, on initialise le tableau des données à un tableau vide; 
# et s'il existe et qu'il n'est pas vide, on récupère les données qu'il contient dans la tableau des données
if(not os.path.exists("./data.json")):
    os.open("./data.json", os.O_CREAT)
    data = {}
elif(os.stat("data.json").st_size == 0) :
    data = {}
else: 
    with open("data.json", "r") as f:  
        data = json.load(f) 



def get_data(mqtt, obj, msg):
    #On récupère les données json du message recu du bus
    jsonMsg = json.loads(msg.payload)
    
    with open("alarmes.txt", "r") as f:  
        fichier = f.read()

    alarm = False
    #On rajoute une clé date au dictionnaire des donnés récuperé qui à pour valeur la date/heure/min/seconde à laquelle la fonction à été appellé
    jsonMsg["object"]["date"] = datetime.now().strftime("%D %H:%M:%S")
    #S'il n'existe pas de clé nommé comme l'appareil qu'a émis le message, on créer une clé a son nom qui a pour valeur une liste vide 
    if jsonMsg["deviceName"] not in data :
        data[jsonMsg["deviceName"]] = []
    #On rajoute à la liste l'object du message recu
    data[jsonMsg["deviceName"]].append(jsonMsg["object"])
    ''' ======== TEST ========
    data[datetime.now().strftime("%H:%M:%S")]= jsonMsg["rxInfo"]["time"]
    '''
    if(not os.path.exists("./alarmes.txt")):
        os.open("./alarmes.txt", os.O_CREAT)
    
    if jsonMsg["object"]["co2"] > s_co2:
        fichier += "\nAttention le seuil de co2 a été dépassé le " + str (jsonMsg["object"]["date"]) + " (" + str (jsonMsg["object"]["co2"]) + "/" + config['seuils']['co2'] + " ppm)"
        alarm = True
    if jsonMsg["object"]["humidity"] > s_humidity_max or jsonMsg["object"]["humidity"] < s_humidity_min :
        fichier += "\nAttention le seuil d'humidité à été dépassé le " + str (jsonMsg["object"]["date"]) + " (" + str (jsonMsg["object"]["humidity"]) + "%)"
        alarm = True
    if jsonMsg["object"]["temperature"] > s_temperature_max or jsonMsg["object"]["temperature"] < s_temperature_min :
        fichier += "\nAttention le seuil de température à été dépassé le " + str (jsonMsg["object"]["date"]) + " (" + str (jsonMsg["object"]["temperature"]) + "°C)"
        alarm = True
    if jsonMsg["object"]["activity"] > s_activity :
        fichier += "\nAttention le seuil d'activité à été dépassé le " + str (jsonMsg["object"]["date"]) + "(" + str (jsonMsg["object"]["activity"]) + "/" + config['seuils']['activity'] + ")"
        alarm = True 
    
    if alarm == True :
        with open("alarmes.txt", "w") as f:  
            f.write (""+ fichier)
        
    for donnee in dataChoisi:
        donnee = donnee.split(":")
        if donnee[1] == 'False' : 
            data.pop(donnee[0])   
    
    print(mqtt)
    print(obj)
    print(msg)
    print("===")


#On se connecte au serveur sur le port 1883
mqttc = mqtt.Client()
mqttc.connect(mqttServer, port=1883, keepalive=600)


#On s'abonne au différent capteur des salles choisi
for device in devicesChoisi:
    print("On s'abonne à : ",device)
    mqttc.subscribe("application/"+app+"/device/"+device+"/event/up")

#lorsque l'on recoit un message, 
mqttc.on_message = get_data

mqttc.loop_start()

''' ======== TEST ========
mqttc.subscribe("gateway/3170000000000010/event/up")
'''

def sendData(sig,code):
    #On écrit dans le fichier json les données lu entre l'intervale de temps (la fréquence)
    with open("data.json", "w") as outfile:
        json.dump(data, outfile)

#Lorsque l'on recoit un signal d'alarme, on appel la fonction sendData
# signal.signal(signal.SIGALRM, sendData)

while True:
    #On envoie un signal d'alarme toute les n(=frequence) secondes
    # signal.alarm(frequence)
    sendData(0,0)
    #On attend n+1(=frequence+1) secondes
    time.sleep(frequence+1)
    
