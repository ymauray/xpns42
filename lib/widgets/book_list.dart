import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gettext_i18n/gettext_i18n.dart';
import 'package:go_router/go_router.dart';

import '../cubit/book_list_cubit.dart';

class BookList extends StatelessWidget {
  const BookList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<BookListCubit>().getBooks();

    return BlocBuilder<BookListCubit, BookListState>(
      builder: (context, state) {
        if (state is BookListLoaded) {
          if (state.books.isEmpty) {
            return Center(
              child: Text(
                context.t('No books found'),
              ),
            );
          } else {
            return ReorderableListView.builder(
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                final book = state.books[index];
                return ListTile(
                  key: Key("$index"),
                  title: Text(book.title),
                  subtitle: Text(context.t('{0} operations', args: [0])),
                  trailing: const Icon(Icons.chevron_right),
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.reorder,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  onTap: () {
                    //Navigator.of(context).pushNamed('/book/${book.id}');
                    context.pushNamed(
                      'book',
                      params: {'id': book.id!.toString()},
                    );
                  },
                );
              },
              onReorder: (oldIndex, newIndex) async {
                await context.read<BookListCubit>().reorder(oldIndex, newIndex);
                context.read<BookListCubit>().getBooks();
              },
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  void reorder(int oldIndex, int newIndex) {}
}
