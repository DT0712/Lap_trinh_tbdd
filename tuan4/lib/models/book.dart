class Book {
  String id;
  String title;
  bool isBorrowed;

  Book({required this.id, required this.title, this.isBorrowed = false});
}
