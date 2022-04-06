import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../data/books_repository.dart';
import '../data/model/book.dart';

part 'book_list_state.dart';

class BookListCubit extends Cubit<BookListState> {
  BookListCubit(this._booksRepository) : super(BookListInitial());

  final BooksRepository _booksRepository;

  Future<void> getBooks() async {
    var books = await _booksRepository.readAll(orderBy: "sortOrder ASC");
    emit(BookListLoaded(books: books));
  }

  Future<void> reorder(int oldIndex, int newIndex) async {
    var books = (state as BookListLoaded).books;
    var book = books.removeAt(oldIndex);
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    books.insert(newIndex, book);
    for (var i = 0; i < books.length; i++) {
      var book = books[i];
      await _booksRepository.update(book.copyWith(sortOrder: i));
    }
  }
}
