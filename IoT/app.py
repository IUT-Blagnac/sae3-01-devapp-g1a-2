#doc instalation à faire 

import time
import paho.mqtt.client as mqtt
import json
import configparser
from configparser import ConfigParser, ExtendedInterpolation
from datetime import datetime
import os

config = configparser.ConfigParser(interpolation=ExtendedInterpolation())
config.read('config.ini')


mqttServer = config['server']['server-1']
device = config['devices']['all_device']
app = config['application']['appID-1']
frequence = int(config["frequences"]["freq-1"])

if(not os.path.exists("./data.json")):
    os.open("./data.json", os.O_CREAT)
    data = {}
elif(os.stat("data.json").st_size == 0) :
    data = {}
else: 
    with open("data.json", "rw") as f:  
        data = json.load(f) 


def get_data(mqtt, obj, msg):
    jsonMsg = json.loads(msg.payload)
    jsonMsg["object"]["date"] = datetime.now().strftime("%D %H:%M:%S")
    if jsonMsg["deviceName"] not in data :
        data[jsonMsg["deviceName"]] = []
    data[jsonMsg["deviceName"]].append(jsonMsg["object"])

    
    with open("data.json", "w") as outfile:
        json.dump(data, outfile)
    time.sleep(frequence)
    print("C'est repartie !")



mqttc = mqtt.Client()
mqttc.connect(mqttServer, port=1883, keepalive=600)

mqttc.subscribe("application/"+app+"/device/"+device+"/event/up")

mqttc.on_message = get_data




mqttc.loop_forever()
