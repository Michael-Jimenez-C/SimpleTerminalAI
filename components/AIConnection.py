import google.generativeai as genai

from .dataLoad import Data

class AI:
    def __init__(self):
        self.data = Data.get()
        self.data.read()
        genai.configure(api_key=self.data['API_KEY'])
        self.model = genai.GenerativeModel(self.data['Model'])
    
    def doRequest(self,request:list|str):
        response = self.model.generate_content(request)
        return response
