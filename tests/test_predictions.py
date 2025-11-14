from Flask_UI.predictions import app
import pytest

@pytest.fixture
def client():
    return app.test_client()

def test_pinger(client):
    response = client.get('/ping')
    assert response.status_code == 200
    assert response.get_json() == {"MESSAGE": "Hi I am pinging V2...."} 

def test_predictictions(client):
    test_data = {
    "Gender": "Male",
    "Married": "Yes",
    "ApplicantIncome": 5000000,
    "LoanAmount": 5000,
    "Credit_History": 1.0 }  
    response = client.post('/predict', json=test_data)
    assert response.status_code == 200
    assert response.get_json() == {"loan_approval_status": "Accepted"}                        
