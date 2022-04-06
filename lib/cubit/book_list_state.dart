part of 'book_list_cubit.dart';

@immutable
abstract class BookListState {}

@immutable
class BookListInitial extends BookListState {}

@immutable
class BookListLoaded extends BookListState {
  BookListLoaded({
    required this.books,
  });

  final List<Book> books;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookListLoaded && listEquals(other.books, books);
  }

  @override
  int get hashCode => books.hashCode;

  BookListLoaded copyWith({
    List<Book>? books,
  }) {
    return BookListLoaded(
      books: books ?? this.books,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'books': books.map((x) => x.toMap()).toList(),
    };
  }

  factory BookListLoaded.fromMap(Map<String, dynamic> map) {
    return BookListLoaded(
      books: List<Book>.from(map['books']?.map((x) => Book.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory BookListLoaded.fromJson(String source) =>
      BookListLoaded.fromMap(json.decode(source));

  @override
  String toString() => 'BookListLoaded(books: $books)';
}
