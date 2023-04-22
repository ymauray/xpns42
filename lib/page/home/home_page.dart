import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:xpns42/provider/books_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booksController = ref.watch(bookControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Xpns42'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        //leading: TextButton(
        //  onPressed: () {},
        //  child: const Text(
        //    'Edit',
        //    style: TextStyle(color: Colors.white),
        //  ),
        //),
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.plus),
            onPressed: () {
              context.push('/book');
            },
          ),
        ],
      ),
      body: booksController.when(
        data: (books) {
          return books.isEmpty
              ? const Center(
                  child: Text('No books'),
                )
              : ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    return null;
                  },
                );
        },
        error: (object, stackTrace) => const Text('Error'),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
