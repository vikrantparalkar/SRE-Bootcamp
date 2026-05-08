from app import app

def test_healthcheck():
    client = app.test_client()
    res = client.get('/healthcheck')
    assert res.status_code == 200

def test_create_student():
    client = app.test_client()
    res = client.post('/api/v1/students', json={
        "name": "Test",
        "age": 20
    })
    assert res.status_code == 201

    # sdsddsdsdsdd