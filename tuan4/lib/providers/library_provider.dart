import 'package:flutter/material.dart';

class Book {
  final int id;
  final String title;

  Book({required this.id, required this.title});
}

class Student {
  final int id;
  final String name;

  Student({required this.id, required this.name});
}

class LibraryProvider extends ChangeNotifier {
  final List<Book> _books = [
    Book(id: 1, title: "Lập trình Flutter"),
    Book(id: 2, title: "Cấu trúc dữ liệu & Giải thuật"),
    Book(id: 3, title: "Trí tuệ nhân tạo cơ bản"),
  ];

  final List<Student> _students = [
    Student(id: 1, name: "Nguyễn Văn A"),
    Student(id: 2, name: "Trần Thị B"),
    Student(id: 3, name: "Lê Văn C"),
  ];

  Student? _selectedStudent;
  final Set<Book> _selectedBooks = {};
  final Map<Student, List<Book>> _borrowedBooks = {};

  List<Book> get books => _books;
  List<Student> get students => _students;
  Student? get selectedStudent => _selectedStudent;
  Map<Student, List<Book>> get borrowedBooks => _borrowedBooks;

  // Chọn sinh viên
  void selectStudent(Student student) {
    _selectedStudent = student;
    notifyListeners();
  }

  // Kiểm tra sách có được chọn không
  bool isSelected(Book book) => _selectedBooks.contains(book);

  // Bật/tắt chọn sách
  void toggleBookSelection(Book book) {
    if (_selectedBooks.contains(book)) {
      _selectedBooks.remove(book);
    } else {
      _selectedBooks.add(book);
    }
    notifyListeners();
  }

  // Thêm sách mượn cho sinh viên đã chọn
  void addBorrowedBooks() {
    if (_selectedStudent == null || _selectedBooks.isEmpty) return;

    _borrowedBooks.putIfAbsent(_selectedStudent!, () => []);
    _borrowedBooks[_selectedStudent!]!.addAll(_selectedBooks);
    _selectedBooks.clear();
    notifyListeners();
  }

  // Thêm sách mới
  void addBook(String title) {
    final newBook = Book(
      id: _books.isEmpty ? 1 : _books.last.id + 1,
      title: title,
    );
    _books.add(newBook);
    notifyListeners();
  }

  // Thêm sinh viên mới
  void addStudent(String name) {
    final newStudent = Student(
      id: _students.isEmpty ? 1 : _students.last.id + 1,
      name: name,
    );
    _students.add(newStudent);
    notifyListeners();
  }
}
