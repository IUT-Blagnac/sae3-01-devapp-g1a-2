import paho.mqtt.client as mqtt
import json
import configparser
from datetime import datetime

config = configparser.ConfigParser()
config.read('config.ini')


mqttServer = config['server']['server-1']
mqttDev = config['devices']['all_device']
app= config['application']['appID-1']

'''
data = {}
'''

def get_data(mqtt, obj, msg):
    jsonMsg = json.loads(msg.payload)
    '''
    data[jsonMsg["deviceName"]] = jsonMsg["object"]
    data[jsonMsg["deviceName"]]["time"] = datetime.now().strftime("%H:%M:%S")
    print(jsonMsg["deviceName"])'''
    donnee = jsonMsg["object"]
    donnee["deviceName"] = jsonMsg["deviceName"]
    donnee["time"] = datetime.now().strftime("%H:%M:%S")
    print("data : ",jsonMsg["object"])
    with open("data.json", "w") as outfile:
        json.dump(donnee, outfile)


mqttc = mqtt.Client()
mqttc.connect(mqttServer, port=1883, keepalive=600)

mqttc.subscribe("application/1/device/"+mqttDev+"/event/up")
mqttc.on_message = get_data


mqttc.loop_forever()
