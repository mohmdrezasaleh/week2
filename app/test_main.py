from app.main import app
from unittest.mock import MagicMock
from fastapi.testclient import TestClient

client = TestClient(app)



def test_status():
    respone = client.get("/status")

def test_visits():
    respone = client.post("/visit")