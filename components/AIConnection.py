import google.generativeai as genai

from .dataLoad import Data

def doRequest(promp:str):
    data = Data.get()
    data.read()

    genai.configure(api_key=data['API_KEY'])

    model = genai.GenerativeModel(data['Model'])


    response = model.generate_content(f'Rol: {data["AI_ROL"]}\nuser:'+promp)

    return response