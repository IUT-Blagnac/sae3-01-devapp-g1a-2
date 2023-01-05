
#import des bibliothèque 

import json
from datetime import datetime
import random



def sendData(data):
    #On écrit dans le fichier json les données lu entre l'intervale de temps (la fréquence)
    with open("data.json", "w") as outfile:
        json.dump(data, outfile)

    
def generateAllData():
    generateddata = {}
    for i in range(100):
        key = "AM107-"+str(random.randint(1,11))
        if key not in generateddata:
            generateddata[key] = []
        generateddata[key].append(generatePayload())
    return generateddata
    

def generatePayload():
    rdata = {}
    keys= ["activity","co2","humidity","illumination","infrared","infrared_and_visible","pressure","temperature","tvoc","date"]
    for key in keys:
        if key != "date":
            rdata[key] = random.randint(1,100)
        else :
            rdata[key] = datetime.now().strftime("%D %H:%M:%S.%f'")
    return rdata
    
def test(generateddata):
    with open("data.json", "r") as f:
        writtendata = json.load(f) 

    assert generateddata == writtendata,"Les données générées et celle écrite dans le fichier ne sont pas les mêmes ! \n expected: "+ str(generateddata) +" \n was : "+ str(writtendata)

def main():
    generateddata = generateAllData()
    sendData(generateddata)
    test(generateddata)
    print("Test réussi")

if __name__ == "__main__":
    main()


