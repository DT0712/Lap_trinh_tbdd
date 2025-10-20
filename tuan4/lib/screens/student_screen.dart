import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/library_provider.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  Student? selectedStudent;

  @override
  Widget build(BuildContext context) {
    final library = Provider.of<LibraryProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        title: const Text(
          'Danh sách Sinh viên',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 8,
                offset: const Offset(2, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Chọn Sinh viên:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<Student>(
                value: selectedStudent,
                hint: const Text("Chọn sinh viên"),
                onChanged: (value) => setState(() => selectedStudent = value),
                items: library.students
                    .map((s) => DropdownMenuItem(value: s, child: Text(s.name)))
                    .toList(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: selectedStudent == null
                    ? const Center(
                        child: Text(
                          "Vui lòng chọn sinh viên để xem danh sách sách mượn.",
                          style: TextStyle(color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : _buildBorrowedBooksList(library, selectedStudent!),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Danh sách sách mượn của sinh viên
  Widget _buildBorrowedBooksList(LibraryProvider library, Student student) {
    final borrowedList = library.borrowedBooks[student] ?? [];

    if (borrowedList.isEmpty) {
      return const Center(
        child: Text(
          "Sinh viên này chưa mượn sách nào.",
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: borrowedList.length,
      itemBuilder: (context, index) {
        final book = borrowedList[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: ListTile(
            leading: const Icon(Icons.menu_book, color: Colors.pinkAccent),
            title: Text(book.title),
          ),
        );
      },
    );
  }
}
