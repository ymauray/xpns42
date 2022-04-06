import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gettext_i18n/gettext_i18n.dart';
import 'package:go_router/go_router.dart';

import '../cubit/book_form_cubit.dart';
import '../cubit/book_list_cubit.dart';
import '../data/model/book.dart';
import '../forms/book_form.dart';

class BookFormView extends StatelessWidget {
  const BookFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.t('New book'),
        ),
        actions: [
          TextButton(
            child: Text(
              context.t('Save'),
              style: TextStyle(
                inherit: true,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            onPressed: () async {
              _formKey.currentState?.save();
              if (_formKey.currentState?.validate() ?? false) {
                var map =
                    Map<String, dynamic>.from(_formKey.currentState!.value);
                await context.read<BookFormCubit>().create(Book.fromMap(map));
                await context.read<BookListCubit>().getBooks();
                //Navigator.of(context).pop();
                context.pop();
              }
            },
          ),
        ],
      ),
      body: BookForm(_formKey),
    );
  }
}
