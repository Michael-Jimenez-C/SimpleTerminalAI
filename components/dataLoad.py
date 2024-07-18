import json

FILE = 'preferences.json'

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
        self.read()
    
    def __getitem__(self,index):
        if index in self.data:
            return self.data[index]
        return None