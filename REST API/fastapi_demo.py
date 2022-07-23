from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

class Company(BaseModel):
    name: str
    market_cap: float
    peratio: float

companies = {
    1: {
        "name": "ABC",
        "market_cap": 300,
        "peratio": 1.3
    }
}

@app.get("/")
def home():
    return {"message": "Welcome to Tertiary Courses"}

@app.get("/company/{id}")
def get_company(id: int):
    return companies[id]

@app.get("/company-by-name")
def get_company(name: str):
    for id in companies:
        if companies[id]["name"] == name:
            return companies[id]

@app.post("/create-company/{id}")
def create_company(id: int, company: Company):
    companies[id] = company
    return companies[id]

@app.put("/update-company/{id}")
def update_company(id: int, company: Company):
    if id not in companies:
        return {"Error. Item not exist "}
    companies[id] = company
    return companies[id]

@app.delete("/delete-company/{id}")
def delete_company(id: int, company: Company):
    if id not in companies:
        return {"Error. Item not exist "}
    del companies[id]
    return {"Success. Company is deleted "}

