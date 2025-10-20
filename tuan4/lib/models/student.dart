import 'book.dart';

class Student {
  String id;
  String name;
  List<Book> borrowedBooks;

  Student({required this.id, required this.name, List<Book>? borrowedBooks})
    : borrowedBooks = borrowedBooks ?? [];
}
