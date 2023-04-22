import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xpns42/model/book.dart';
import 'package:xpns42/provider/database_provider.dart';

part 'books_provider.g.dart';

@riverpod
class BookController extends _$BookController {
  @override
  Future<List<Book>> build() async {
    final database = await ref.watch(databaseProvider.future);
    final rows = await database.query('books');

    return rows.map(Book.fromMap).toList();
  }

  Future<void> add(Book book) async {
    state = AsyncValue.data([...state.value!, book]);
  }
}
