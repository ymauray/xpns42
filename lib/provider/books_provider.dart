import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xpns42/model/book.dart';

part 'books_provider.g.dart';

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

@Riverpod(keepAlive: true)
class Books extends _$Books {
  @override
  List<Book> build() {
    return [];
  }

  FutureOr<void> loadBooks() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final instance = FirebaseDatabase.instance;
    final data = await instance.ref('/user_books/$uid').get();
    final books = data.mapList<Book>(mapper: Book.fromJson);
    state = books;
  }

  FutureOr<void> add(Book book) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final myBooks = FirebaseDatabase.instance.ref('/user_books/$uid');
    final newBookRef = myBooks.push();
    final newBook = book.copyWith(id: newBookRef.key);
    await newBookRef.set(newBook.toJson());
    state = [...state, newBook];
  }

  FutureOr<void> remove(Book book) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final bookRef = FirebaseDatabase.instance.ref('/user_books/$uid/${book.id}');
    await bookRef.remove();
    state = state.where((b) => b.id != book.id).toList();
  }
}
