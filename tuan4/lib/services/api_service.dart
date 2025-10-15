import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/book.dart';

class ApiService {
  // ⚠️ Nếu chạy bằng Android Emulator, dùng 10.0.2.2
  final String baseUrl = "http://10.0.2.2:5000";

  Future<List<Book>> fetchBooksByStudent(String studentName) async {
    final url = Uri.parse('$baseUrl/api/books?student=$studentName');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((item) => Book.fromJson(item)).toList();
    } else {
      throw Exception('Lỗi tải dữ liệu');
    }
  }

  Future<void> addBook(String student, String title) async {
    final url = Uri.parse('$baseUrl/api/books');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"student": student, "title": title}),
    );

    if (response.statusCode != 201) {
      throw Exception('Thêm sách thất bại');
    }
  }
}
