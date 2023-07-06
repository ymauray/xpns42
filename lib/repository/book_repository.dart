import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xpns42/model/book.dart';

part 'book_repository.g.dart';

extension Mapper on DataSnapshot {
  List<T> mapList<T>({required T Function(Map<String, dynamic> json) mapper}) {
    if (value == null) return const [];

    final map = value! as Map;

    return map.entries
        .map(
          (e) => mapper(
            Map.castFrom<Object?, Object?, String, dynamic>(
              e.value as Map,
            ),
          ),
        )
        .toList();
  }
}

@riverpod
class Books extends _$Books {
  @override
  FutureOr<List<Book>> build() {
    return _fetchBooks();
  }

  Future<List<Book>> _fetchBooks() async {
    final instance = FirebaseDatabase.instance;
    final data = await instance
        .ref(
          '/user_books/${FirebaseAuth.instance.currentUser!.uid}',
        )
        .get();

    final books = data.mapList<Book>(mapper: Book.fromJson);

    return books;
  }

  Future<void> addBook(Book book) async {
    state = await AsyncValue.guard(() async {
      final myBooks = FirebaseDatabase.instance.ref(
        '/user_books/${FirebaseAuth.instance.currentUser!.uid}',
      );
      final newBook = myBooks.push();
      await newBook.set(book.copyWith(id: newBook.key).toJson());

      return _fetchBooks();
    });
  }

  Future<void> updateBook(Book args) async {
    state = await AsyncValue.guard(() async {
      final book = FirebaseDatabase.instance.ref(
        '/user_books/${FirebaseAuth.instance.currentUser!.uid}/${args.id}',
      );
      await book.update(args.toJson());

      return _fetchBooks();
    });
  }
}
