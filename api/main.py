from fastapi import FastAPI, Query
from typing import Literal
import pyjokes

app = FastAPI(title="Random Jokes Generator")

LANGUAGE = Literal["es", "en"]
@app.get("/")
def root(language: LANGUAGE = Query(default="es")):
    return {"random_joke": pyjokes.get_joke(language)}