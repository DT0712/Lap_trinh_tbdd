from flask import Flask, jsonify, request
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

# ===== DỮ LIỆU GIẢ =====
students_data = {
    "Nguyen Van A": [
        {"id": 1, "title": "Sách 01", "isBorrowed": True},
        {"id": 2, "title": "Sách 02", "isBorrowed": True},
    ],
    "Nguyen Thi B": [
        {"id": 3, "title": "Sách 03", "isBorrowed": False},
    ],
    "Nguyen Van C": [],
}

books_data = [
    {"id": 1, "title": "Sách 01"},
    {"id": 2, "title": "Sách 02"},
    {"id": 3, "title": "Sách 03"},
    {"id": 4, "title": "Sách 04"},
]

# ===== ROUTES =====

@app.route("/")
def index():
    return jsonify({"message": "API Quản lý Thư viện đang chạy!"})

# Lấy danh sách sách
@app.route("/api/books", methods=["GET"])
def get_books():
    return jsonify(books_data)

# Lấy sách theo sinh viên
@app.route("/api/student_books/<student_name>", methods=["GET"])
def get_student_books(student_name):
    data = students_data.get(student_name, [])
    return jsonify(data)

# Thêm sách mới
@app.route("/api/books", methods=["POST"])
def add_book():
    data = request.get_json()
    if not data or "title" not in data:
        return jsonify({"error": "Thiếu dữ liệu 'title'"}), 400

    new_book = {"id": len(books_data) + 1, "title": data["title"]}
    books_data.append(new_book)
    return jsonify({"message": "Đã thêm sách mới!", "book": new_book}), 201


if __name__ == "__main__":
    app.run(debug=True)
