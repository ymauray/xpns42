import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:xpns42/model/book.dart';
import 'package:xpns42/provider/auth_provider.dart';
import 'package:xpns42/provider/books_provider.dart';
import 'package:xpns42/provider/long_operation_status_provider.dart';
import 'package:xpns42/utils/currencies.dart';
import 'package:xpns42/utils/localization_extension.dart';
import 'package:xpns42/widget/long_operation_indicator.dart';
import 'package:xpns42/widget/padded_form.dart';

class BooksPage extends ConsumerWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final books = ref.watch(booksProvider);
    final longOperationStatus = ref.read(longOperationStatusProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.books),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final newBook = await showDialog<Book>(
                context: context,
                builder: (context) => _AddBookDialog(),
              );

              if (newBook != null) {
                longOperationStatus.start();
                await ref.read(booksProvider.notifier).add(newBook);
                longOperationStatus.stop();
              }
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          if (books.isEmpty)
            Center(
              child: Text(context.t.noBooks),
            )
          else
            RefreshIndicator(
              onRefresh: () async {
                await ref.read(booksProvider.notifier).loadBooks();
              },
              child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final book = books[index];

                  return Dismissible(
                    key: ValueKey(book.id),
                    direction: DismissDirection.endToStart,
                    dismissThresholds: const {
                      DismissDirection.endToStart: 0.6,
                    },
                    background: ColoredBox(
                      color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 24),
                            child: Text(
                              context.t.deleteBook,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    confirmDismiss: (direction) {
                      return showDialog<bool>(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(context.t.deleteBook),
                            content: Text(context.t.deleteBookConfirmation),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: Text(context.t.cancel),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: Text(context.t.delete),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    onDismissed: (direction) async {
                      longOperationStatus.start();
                      await ref.read(booksProvider.notifier).remove(book);
                      longOperationStatus.stop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 8,
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.book_outlined, size: 48),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    book.title,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(
                                    '${book.firstPerson} & ${book.secondPerson}',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            (book.balance ?? 0).toStringAsFixed(2),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Divider(),
                ),
                itemCount: books.length,
              ),
            ),
          const LongOperationIndicator(),
        ],
      ),
    );
  }
}

class _AddBookDialog extends ConsumerWidget {
  _AddBookDialog();

  final titleController = TextEditingController();
  final otherPersonController = TextEditingController();
  final balanceController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = PlatformDispatcher.instance.locale;
    final format = NumberFormat.simpleCurrency(locale: locale.toString());
    final formKey = GlobalKey<FormState>();
    final auth = ref.read(authProvider);

    var selectedCurrency = format.currencyName;

    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.t.newBook),
        ),
        body: PaddedForm(
          formKey: formKey,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: context.t.title,
              ),
              controller: titleController,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '';
                }

                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: context.t.otherPerson,
              ),
              controller: otherPersonController,
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.sentences,
              validator: (value) =>
                  (value == null || value.isEmpty) ? '' : null,
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: context.t.currency,
                contentPadding: const EdgeInsets.all(22),
              ),
              items: currencies,
              menuMaxHeight: 5 * kMinInteractiveDimension,
              hint: Text(context.t.currency),
              value: selectedCurrency,
              onChanged: (value) {
                selectedCurrency = value;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (!formKey.currentState!.validate()) {
                  return;
                }
                Navigator.of(context).pop(
                  Book(
                    title: titleController.text,
                    firstPerson: auth.currentUserDisplayName,
                    secondPerson: otherPersonController.text,
                    balance: 0,
                    currency: selectedCurrency!,
                  ),
                );
              },
              child: Text(context.t.save),
            ),
          ],
        ),
      ),
    );
  }
}
