from typing import Union

from fastapi import FastAPI
from fastapi.responses import RedirectResponse

from conector import resource as conector

app = FastAPI(
    title="Raiden API",
    version="1.0",
    docs_url="/documentation"
)

#https://fastapi.tiangolo.com/tutorial/cors/?h=+cors#use-corsmiddleware
origins = [
    "http://0.0.0.0:8000",
    "http://localhost:8000",
]
@app.get("/", include_in_schema=False)
async def root():
    """
    Main route API to redirect to documentaion
    """
    return RedirectResponse(url='/documentation')

@app.get("/items/{item_id}")
def read_item(item_id: int, q: Union[str, None] = None):
    return {"item_id": item_id, "q": q}

app.include_router(conector.router)
