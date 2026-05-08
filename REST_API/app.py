import logging
from flask import Flask, request, jsonify
from config import Config
from models import db, Student

app = Flask(__name__)
app.config.from_object(Config)

# init DB
db.init_app(app)

# logging
logging.basicConfig(level=logging.INFO)

# create DB
with app.app_context():
    db.create_all()


# -------------------------
# HEALTHCHECK
# -------------------------
@app.route('/healthcheck', methods=['GET'])
def health():
    return jsonify({"status": "OK"}), 200


# -------------------------
# CREATE
# -------------------------
@app.route('/api/v1/students', methods=['POST'])
def create_student():
    data = request.get_json()

    student = Student(
        name=data.get('name'),
        age=data.get('age')
    )

    db.session.add(student)
    db.session.commit()

    logging.info(f"Student created with id {student.id}")

    return jsonify({"id": student.id}), 201


# -------------------------
# READ ALL
# -------------------------
@app.route('/api/v1/students', methods=['GET'])
def get_students():
    logging.info("Fetching all students")

    students = Student.query.all()

    result = []

    for s in students:
        result.append({
            "id": s.id,
            "name": s.name,
            "age": s.age
        })

    return jsonify(result), 200


# -------------------------
# READ ONE
# -------------------------
@app.route('/api/v1/students/<int:id>', methods=['GET'])
def get_student(id):
    student = Student.query.get(id)

    if not student:
        logging.error("Student not found")
        return jsonify({"error": "Not found"}), 404

    return jsonify({
        "id": student.id,
        "name": student.name,
        "age": student.age
    }), 200


# -------------------------
# UPDATE
# -------------------------
@app.route('/api/v1/students/<int:id>', methods=['PUT'])
def update_student(id):
    student = Student.query.get(id)

    if not student:
        return jsonify({"error": "Not found"}), 404

    data = request.get_json()

    student.name = data.get('name')
    student.age = data.get('age')

    db.session.commit()

    logging.info(f"Student {id} updated")

    return jsonify({"message": "updated"}), 200


# -------------------------
# DELETE
# -------------------------
@app.route('/api/v1/students/<int:id>', methods=['DELETE'])
def delete_student(id):
    student = Student.query.get(id)

    if not student:
        return jsonify({"error": "Not found"}), 404

    db.session.delete(student)
    db.session.commit()

    logging.info(f"Student {id} deleted")

    return jsonify({"message": "deleted"}), 200


# -------------------------
# RUN SERVER
# -------------------------
if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000, debug=True)