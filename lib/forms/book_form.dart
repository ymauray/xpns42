import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gettext_i18n/gettext_i18n.dart';

import '../cubit/book_form_cubit.dart';

class BookForm extends StatelessWidget {
  const BookForm(this._formKey, {Key? key}) : super(key: key);

  final Key _formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookFormCubit, BookFormState>(
      builder: (context, state) {
        return FormBuilder(
          key: _formKey,
          initialValue: {
            'title': state.book?.title,
            'person1': state.book?.person1,
            'person2': state.book?.person2,
          },
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: FormBuilderTextField(
                  name: 'title',
                  decoration: InputDecoration(
                    label: Text(context.t('Title')),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  validator: (value) => (value?.isEmpty ?? true)
                      ? context.t('Title is required')
                      : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: FormBuilderTextField(
                  name: 'person1',
                  decoration: InputDecoration(
                    label: Text(context.t('Person {0}', args: [1])),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  validator: (value) => (value?.isEmpty ?? true)
                      ? context.t('Person {0} is required', args: [1])
                      : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: FormBuilderTextField(
                  name: 'person2',
                  decoration: InputDecoration(
                    label: Text(context.t('Person {0}', args: [2])),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  validator: (value) => (value?.isEmpty ?? true)
                      ? context.t('Person {0} is required', args: [2])
                      : null,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
