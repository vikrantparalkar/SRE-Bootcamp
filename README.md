# 🎓 Student CRUD REST API

## 📌 Project Overview

This project is a **Student CRUD REST API** built using Python and Flask.
It allows users to perform basic operations on student data such as creating, reading, updating, and deleting records.

The project follows REST API best practices and basic principles of the Twelve-Factor App methodology.

---

## 🚀 Tech Stack

* Python
* Flask
* SQLite (Database)
* SQLAlchemy (ORM)

---

## ⚙️ Features

* Add a new student
* Get all students
* Get a student by ID
* Update student details
* Delete a student
* Healthcheck endpoint
* Logging support
* Unit testing
* Environment-based configuration

---

## 📁 Project Structure

```
student-api/
│
├── app.py                # Main application
├── models.py             # Database model
├── config.py             # Config using environment variables
├── requirements.txt      # Dependencies
├── Makefile              # Run & test commands
├── .env                  # Environment variables
├── test_app.py           # Unit tests
├── README.md             # Documentation
└── postman_collection.json
```

---

## 🔐 Environment Configuration

Configuration is not hardcoded. It uses `.env` file:

```
DATABASE_URL=sqlite:///students.db
PORT=5000
```

---

## 🗄️ Database

* SQLite database is used.
* File: `students.db`
* Table: `Student`

Database is automatically created using:

```python
db.create_all()
```

---

## ▶️ How to Run the Project

### 1. Install dependencies

```
pip install -r requirements.txt
```

### 2. Run the server

```
python app.py
```

Server runs on:

```
http://127.0.0.1:5000
```

---

## 🔍 API Endpoints

### ➕ Create Student

```
POST /api/v1/students
```

### 📄 Get All Students

```
GET /api/v1/students
```

### 🔍 Get Student by ID

```
GET /api/v1/students/<id>
```

### ✏️ Update Student

```
PUT /api/v1/students/<id>
```

### ❌ Delete Student

```
DELETE /api/v1/students/<id>
```

---

## ❤️ Health Check

```
GET /healthcheck
```

Response:

```
{"status": "OK"}
```

---

## 🔄 API Versioning

All endpoints are versioned using:

```
/api/v1/
```

---

## 🌐 HTTP Methods Used

| Operation | Method |
| --------- | ------ |
| Create    | POST   |
| Read      | GET    |
| Update    | PUT    |
| Delete    | DELETE |

---

## 📜 Logging

* Logging is implemented using Python logging module.
* Log levels used:

  * INFO → normal operations
  * ERROR → failures

---

## 🧪 Unit Testing

Run tests using:

```
pytest
```

Tests included:

* Healthcheck endpoint
* Create student API

---

## 🛠️ Makefile Commands

```
make run     # Run server
make test    # Run tests
```

---

## 📬 Postman Collection

A Postman collection file is included:

```
postman_collection.json
```

It can be imported into Postman to test APIs.

---

## 🧠 How It Works

1. User sends request (POST/GET/PUT/DELETE)
2. Flask receives request
3. Route handles the request
4. SQLAlchemy interacts with database
5. Response is returned in JSON format

---

## 🎯 Conclusion

This project demonstrates:

* REST API design
* CRUD operations
* API versioning
* Logging
* Testing
* Environment-based configuration

---

## 📌 Author

Student CRUD API Project
