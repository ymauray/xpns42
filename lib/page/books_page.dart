import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/repository/book_repository.dart';
import 'package:xpns42/utils/localization_extension.dart';

class BooksPage extends ConsumerWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final books = ref.watch(booksProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.books),
      ),
    );
  }
}
