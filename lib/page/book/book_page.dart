import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:xpns42/model/book.dart';
import 'package:xpns42/provider/books_provider.dart';
import 'package:xpns42/utils/currencies.dart';

class BookPage extends ConsumerWidget {
  BookPage({super.key});

  final formKey = GlobalKey<FormState>();
  final TextEditingController person1Controller = TextEditingController();
  final TextEditingController person2Controller = TextEditingController();
  final TextEditingController initialBalanceController =
      TextEditingController();
  final TextEditingController currencyController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currency = NumberFormat.simpleCurrency(
      locale: Platform.localeName,
    ).currencyName;
    currencyController.text = currency ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                final book = Book(
                  id: 0,
                  title: 'Demo',
                  initialBalance: double.parse(initialBalanceController.text),
                  currentBalance: double.parse(initialBalanceController.text),
                  operations: [],
                );
                ref.read(bookControllerProvider.notifier).add(book);
                context.pop();
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: person1Controller,
                        decoration: const InputDecoration(
                          icon: Icon(FontAwesomeIcons.one),
                          labelText: "First person's name",
                        ),
                        validator: (value) => (value ?? '').isEmpty
                            ? "Please enter the first person's name"
                            : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: person2Controller,
                        decoration: const InputDecoration(
                          icon: Icon(FontAwesomeIcons.two),
                          labelText: "Second person's name",
                        ),
                        validator: (value) => (value ?? '').isEmpty
                            ? "Please enter the second person's name"
                            : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        controller: initialBalanceController,
                        decoration: const InputDecoration(
                          icon: Icon(FontAwesomeIcons.coins),
                          labelText: 'Initial balance',
                        ),
                        validator: (value) => (value ?? '').isEmpty ||
                                double.tryParse(value ?? '') == null
                            ? 'Please enter an initial balance'
                            : null,
                      ),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: currency,
                        items: currencies,
                        onChanged: (value) {
                          currencyController.text = value ?? '';
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
