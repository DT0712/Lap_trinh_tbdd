import 'package:flutter/material.dart';
import '../models/book.dart';
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService apiService = ApiService();
  String currentStudent = "Nguyen Van A";
  List<Book> books = [];

  @override
  void initState() {
    super.initState();
    loadBooks();
  }

  Future<void> loadBooks() async {
    List<Book> result = await apiService.fetchBooksByStudent(currentStudent);
    setState(() {
      books = result;
    });
  }

  void changeStudent() async {
    setState(() {
      if (currentStudent == "Nguyen Van A") {
        currentStudent = "Nguyen Thi B";
      } else if (currentStudent == "Nguyen Thi B") {
        currentStudent = "Nguyen Van C";
      } else {
        currentStudent = "Nguyen Van A";
      }
    });
    await loadBooks();
  }

  Future<void> addBook() async {
    TextEditingController titleController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Thêm sách mới"),
        content: TextField(
          controller: titleController,
          decoration: const InputDecoration(hintText: "Nhập tên sách"),
        ),
        actions: [
          TextButton(
            child: const Text("Hủy"),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text("Thêm"),
            onPressed: () async {
              String title = titleController.text.trim();
              if (title.isNotEmpty) {
                await apiService.addBook(currentStudent, title);
                await loadBooks();
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quản lý - $currentStudent"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: changeStudent,
            icon: const Icon(Icons.swap_horiz),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: books.isEmpty
            ? const Center(child: Text("Chưa có sách nào"))
            : ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return Card(
                    child: ListTile(
                      leading: Checkbox(
                        value: book.isBorrowed,
                        onChanged: (v) {},
                      ),
                      title: Text(book.title),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addBook,
        child: const Icon(Icons.add),
      ),
    );
  }
}
