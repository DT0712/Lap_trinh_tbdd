import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/library_provider.dart';
import '../models/book.dart';

class ManageScreen extends StatelessWidget {
  const ManageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final library = Provider.of<LibraryProvider>(context);
    final selectedStudent = library.selectedStudent;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        title: const Text('Quản lý Mượn Sách'),
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
                onChanged: (value) => library.selectStudent(value!),
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
                          "Vui lòng chọn sinh viên để hiển thị danh sách sách.",
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    : ListView(
                        children: library.books.map((book) {
                          return CheckboxListTile(
                            title: Text(
                              book.title,
                              style: const TextStyle(fontSize: 16),
                            ),
                            value: library.isSelected(book),
                            onChanged: (_) => library.toggleBookSelection(book),
                            activeColor: Colors.pinkAccent,
                          );
                        }).toList(),
                      ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (selectedStudent == null) return;
                    library.addBorrowedBooks();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Đã thêm sách cho ${selectedStudent!.name}",
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Thêm"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent.shade100,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
