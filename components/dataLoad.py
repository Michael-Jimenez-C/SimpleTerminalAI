import json
import os

PATH= f'{os.environ.get("HOME")}/.config/ai-assistant'

if not os.path.exists(PATH):
    os.system(f"mkdir -p {PATH}")

FILE = PATH+'/preferences.json'

class Data:
    dataInst = None

    def __init__(self):
        self.data = None

    @staticmethod
    def get():
        if not Data.dataInst:
            Data.dataInst = Data()
        return Data.dataInst

    def read(self):
        with open(FILE,'r') as file:
            self.data = json.load(file)
    
    def write(self, json_):
        with open(FILE,'w') as file:
            json.dump(json_,file)
    
    def save(self):
        self.write(self.data)
    
    def __getitem__(self,index):
        if index in self.data:
            return self.data[index]
        return None