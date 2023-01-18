
#import des bibliothèque 
import time
import paho.mqtt.client as mqtt
import json
import configparser
from configparser import ExtendedInterpolation
from datetime import datetime
import os
import sys #sys.path[0]+'\\fichier.extension';
import signal

#On créer un objet 
config = configparser.ConfigParser(interpolation=ExtendedInterpolation())
config.read(sys.path[0]+'\\config.ini')

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

if(not os.path.exists(sys.path[0]+'\\data.json')):
    os.open(sys.path[0]+'\\data.json', os.O_CREAT)
    data = []
elif(os.stat(sys.path[0]+'\\data.json').st_size == 0) :
    data = []
else: 
    with open(sys.path[0]+'\\data.json', "r") as f:  
        data = json.load(f) 




def get_data(mqtt, obj, msg):
    # On récupère les données json du message recu du bus
    jsonMsg = json.loads(msg.payload)
    # Suppression des couples clés/valeur que l'utilisateur aura décidé de ne pas sélectionner
    for donnee in dataChoisi:
        donnee = donnee.split(":")
        if donnee[1] == 'False' : 
            jsonMsg["object"].pop(donnee[0])
    # On rajoute une clé date au dictionnaire des donnés récuperé qui à pour valeur la date/heure/min/seconde à laquelle la fonction à été appellé
    jsonMsg["object"]["date"] = datetime.now().strftime("%d-%m-%Y %H:%M:%S")

    # Ajoute la donnée reçu à la liste data
    data.append({'dev':jsonMsg["deviceName"],'val':jsonMsg["object"]})


    # Gestion des alarmes
    alarm = False

    f = os.open(sys.path[0]+'\\alarmes.txt', os.O_CREAT | os.O_WRONLY)
    fichier = ""
    if "co2" in jsonMsg["object"] :
        if jsonMsg["object"]["co2"] > s_co2:
            fichier += "Attention le seuil de co2 a été dépassé le " + str (jsonMsg["object"]["date"]) + " (" + str (jsonMsg["object"]["co2"]) + "/" + config['seuils']['co2'] + " ppm)\n"
            alarm = True
    if "humidity" in jsonMsg["object"] :
        if  jsonMsg["object"]["humidity"] > s_humidity_max or jsonMsg["object"]["humidity"] < s_humidity_min :
            fichier += "Attention le seuil d'humidité à été dépassé le " + str (jsonMsg["object"]["date"]) + " (" + str (jsonMsg["object"]["humidity"]) + "%)\n"
            alarm = True
    if "temperature" in jsonMsg["object"] :
        if jsonMsg["object"]["temperature"] > s_temperature_max or jsonMsg["object"]["temperature"] < s_temperature_min :
            fichier += "Attention le seuil de température à été dépassé le " + str (jsonMsg["object"]["date"]) + " (" + str (jsonMsg["object"]["temperature"]) + "°C)\n"
            alarm = True
    if "activity" in jsonMsg["object"] :
        if  jsonMsg["object"]["activity"] > s_activity :
            fichier += "Attention le seuil d'activité à été dépassé le " + str (jsonMsg["object"]["date"]) + "(" + str (jsonMsg["object"]["activity"]) + "/" + config['seuils']['activity'] + ")\n"
            alarm = True 
    
    if alarm == True :
        os.write(f, bytes(fichier, "utf-8"))



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


def sendData():
    #On écrit dans le fichier json les données lu entre l'intervale de temps (la fréquence)
    with open(sys.path[0]+'\\data.json', "w") as outfile:
        json.dump(data, outfile)
    print("donnée reçu envoyé")


while True:
    #On envoie un signal d'alarme toute les n(=frequence) secondes
    sendData()
    #On attend n+1(=frequence+1) secondes
    time.sleep(frequence+0.1)
    
