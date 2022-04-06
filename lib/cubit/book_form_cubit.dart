import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/books_repository.dart';
import '../data/model/book.dart';

part 'book_form_state.dart';

class BookFormCubit extends Cubit<BookFormState> {
  BookFormCubit(this._bookRepository) : super(const BookFormState(null));

  final BooksRepository _bookRepository;

  Future<void> create(Book book) async {
    await _bookRepository.create(book.copyWith(sortOrder: 99999));
  }
}
