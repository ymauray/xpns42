import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/model/book.dart';
import 'package:xpns42/page/books_page.dart';
import 'package:xpns42/page/profile_page.dart';
import 'package:xpns42/provider/tab_index_provider.dart';
import 'package:xpns42/utils/localization_extension.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(tabIndexProvider);

    return Scaffold(
      body: Builder(
        builder: (container) {
          return tabIndex == 0 ? const BooksPage() : ProfilePage();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndex,
        onTap: (value) => ref.read(tabIndexProvider.notifier).update(value),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.book),
            label: context.t.books,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_circle),
            label: context.t.profile,
          ),
        ],
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
