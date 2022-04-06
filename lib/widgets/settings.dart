import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gettext_i18n/gettext_i18n.dart';
import 'package:sqflite/sqflite.dart';

import '../constants.dart';
import '../cubit/book_list_cubit.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          if (kDebugMode)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    deleteDatabase(Constants.databasePath);
                    context.read<BookListCubit>().getBooks();
                  },
                  child: Text(
                    context.t("Delete database"),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
