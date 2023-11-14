"""
Module for send comands to host
"""
from typing import Annotated

router = APIRouter(
    prefix="/command",
    tags=["Send Command"]
)


@router.get("/send_command")
async def send_command():
    """
    Method for send command
    """
    return {'ok': 'ok'}
