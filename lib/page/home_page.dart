import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/model/book.dart';
import 'package:xpns42/page/account_page.dart';
import 'package:xpns42/provider/tab_index_provider.dart';
import 'package:xpns42/repository/book_repository.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final books = ref.watch(booksProvider);

    final tabIndex = ref.watch(tabIndexProvider);

    return Scaffold(
      //appBar: AppBar(
      //  title: const Text('Xpns42'),
      //  actions: [
      //    IconButton(
      //      onPressed: () async {
      //        await Navigator.of(context).pushNamed('/add');
      //      },
      //      icon: const Icon(Icons.add),
      //    ),
      //  ],
      //),
      //body: books.maybeWhen(
      //  data: BookList.new,
      //  orElse: () => const Center(
      //    child: CircularProgressIndicator(),
      //  ),
      //),
      body: Builder(
        builder: (container) {
          return tabIndex == 0 ? const BooksPage() : AccountPage();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndex,
        onTap: (value) => ref.read(tabIndexProvider.notifier).update(value),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

class BooksPage extends ConsumerWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final books = ref.watch(booksProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Books',
        ),
      ),
    );
  }
}

class BookList extends ConsumerWidget {
  const BookList(this.books, {super.key});

  final List<Book> books;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(books[index].title),
          subtitle: Text(
            '${books[index].firstPerson} & ${books[index].secondPerson}',
          ),
          trailing: Text(books[index].balance.toString()),
          onTap: () => Navigator.of(context).pushNamed(
            '/expenses',
            arguments: books[index],
          ),
        );
      },
    );
  }
}
