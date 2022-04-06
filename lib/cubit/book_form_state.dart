part of 'book_form_cubit.dart';

@immutable
class BookFormState {
  const BookFormState(this.book);

  final Book? book;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookFormState && other.book == book;
  }

  @override
  int get hashCode => book.hashCode;

  BookFormState copyWith({
    Book? book,
  }) {
    return BookFormState(
      book ?? this.book,
    );
  }
}
