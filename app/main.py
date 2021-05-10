import os
import utility
import carbon
from datetime import datetime
from fastapi import FastAPI
from fastapi.requests import Request
from fastapi.responses import FileResponse

app = FastAPI()


@app.get("/")
async def get(
    request: Request
):
    data = request.query_params
    try:
        code = data['code']
        data["code"] = code.replace("\n", "%0d%0a")
    except KeyError:
        return {"error": "Code is required to create a Carbon!"}

    validatedBody = utility.validateBody(data)
    carbonURL = utility.createURLString(validatedBody)
    path = f'/tmp/{datetime.now().microsecond}.png'
    await carbon.get_response(carbonURL, path)
    return FileResponse(path)


@app.post("/")
async def post(
    request: Request
):
    data = await request.json()
    try:
        code = data['code']
        data["code"] = code.replace("\n", "%0d%0a")
    except KeyError:
        return {"error": "Code is required to create a Carbon!"}

    validatedBody = utility.validateBody(data)
    carbonURL = utility.createURLString(validatedBody)
    path = f'/tmp/{datetime.now().microsecond}.png'
    await carbon.get_response(carbonURL, path)
    return FileResponse(path)
