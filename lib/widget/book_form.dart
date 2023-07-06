import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/model/book.dart';

class BookForm extends ConsumerWidget {
  const BookForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as Book?;
    final titleController = TextEditingController();
    final firstPersonController = TextEditingController();
    final secondPersonController = TextEditingController();

    if (args != null) {
      titleController.text = args.title;
      firstPersonController.text = args.firstPerson ?? '';
      secondPersonController.text = args.secondPerson ?? '';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Book'),
        actions: [
          IconButton(
            onPressed: () async {
              if (args != null) {
                final book = Book(
                  id: args.id,
                  title: titleController.text,
                  firstPerson: firstPersonController.text,
                  secondPerson: secondPersonController.text,
                  balance: args.balance,
                );
                //await ref.read(booksProvider.notifier).updateBook(book);
              } else {
                final book = Book(
                  title: titleController.text,
                  firstPerson: firstPersonController.text,
                  secondPerson: secondPersonController.text,
                  balance: 0,
                );
                //await ref.read(booksProvider.notifier).addBook(book);
              }
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        controller: titleController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          labelText: 'Title',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        controller: firstPersonController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          labelText: 'First Person',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        controller: secondPersonController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          labelText: 'Second Person',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
