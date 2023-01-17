
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
    jsonMsg["object"]["date"] = datetime.now().strftime("%D %H:%M:%S")

    # test si on a déjà reçu une donnée et enregistre l'indice de la donnée si oui
    indice = 0
    exist = False
    for dic in data:
        if(dic['dev'] == jsonMsg["deviceName"]):
            exist = True
            break
        indice+=1
            
    # Si la donné n'existe pas, on ajout une entré dans le liste des dictionnaire {dev, val} et on ajoute à la partie val l'object du jsonMsg. 
    # Sinon, on ajoute uniquement à la partie val l'object du jsonMsg
    if(not exist) :
        data.append({'dev':jsonMsg["deviceName"], 'val': []})
        data[len(data)-1]['val'].append(jsonMsg["object"])
    else :
        data[indice]['val'].append(jsonMsg["object"])


    # Gestion des alarmes
    alarm = False
    if(not os.path.exists(sys.path[0]+'\\alarmes.txt')):
        os.open(sys.path[0]+'\\alarmes.txt', os.O_CREAT)
    else :
        with open(sys.path[0]+'\\alarmes.txt', "r") as f:  
            fichier = f.read()
    
    if "co2" in jsonMsg["object"] :
        if jsonMsg["object"]["co2"] > s_co2:
            fichier += "\nAttention le seuil de co2 a été dépassé le " + str (jsonMsg["object"]["date"]) + " (" + str (jsonMsg["object"]["co2"]) + "/" + config['seuils']['co2'] + " ppm)"
            alarm = True
    if "humidity" in jsonMsg["object"] :
        if  jsonMsg["object"]["humidity"] > s_humidity_max or jsonMsg["object"]["humidity"] < s_humidity_min :
            fichier += "\nAttention le seuil d'humidité à été dépassé le " + str (jsonMsg["object"]["date"]) + " (" + str (jsonMsg["object"]["humidity"]) + "%)"
            alarm = True
    if "temperature" in jsonMsg["object"] :
        if jsonMsg["object"]["temperature"] > s_temperature_max or jsonMsg["object"]["temperature"] < s_temperature_min :
            fichier += "\nAttention le seuil de température à été dépassé le " + str (jsonMsg["object"]["date"]) + " (" + str (jsonMsg["object"]["temperature"]) + "°C)"
            alarm = True
    if "activity" in jsonMsg["object"] :
        if  jsonMsg["object"]["activity"] > s_activity :
            fichier += "\nAttention le seuil d'activité à été dépassé le " + str (jsonMsg["object"]["date"]) + "(" + str (jsonMsg["object"]["activity"]) + "/" + config['seuils']['activity'] + ")"
            alarm = True 
    
    if alarm == True :
        with open(sys.path[0]+'\\alarmes.txt', "w") as f:  
            f.write (""+ fichier)



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
    
