class Book {
  final int id;
  final String title;
  final bool isBorrowed;

  Book({required this.id, required this.title, required this.isBorrowed});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      isBorrowed: json['isBorrowed'],
    );
  }
}
