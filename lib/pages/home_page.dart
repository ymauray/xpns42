import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gettext_i18n/gettext_i18n.dart';

import '../providers/providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final books = ref.watch(booksProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.t('HomePage.title')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/second');
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: books.when(
          data: (data) => Text(context.t('Home')),
          error: (_, __) => const Text("Error !"),
          loading: () => const Text("Loading"),
        ),
      ),
    );
  }
}
