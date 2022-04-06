import '../data/base_repository.dart';
import '../data/sqflite_repository.dart';
import 'model/book.dart';

abstract class BooksRepository extends BaseRepository<Book> {
  factory BooksRepository.create() => _BooksRepositorySQFLite();

  BooksRepository();
}

class _BooksRepositorySQFLite extends BooksRepository
    with SQFLiteRepository<Book> {
  _BooksRepositorySQFLite() : super();

  @override
  String get table => "books";

  @override
  FromMapCallback<Book> get fromMap => Book.fromMap;
}
