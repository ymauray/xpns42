import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gettext_i18n/gettext_i18n.dart';
import 'package:go_router/go_router.dart';

import '../cubit/main_view_cubit.dart';
import '../widgets/book_list.dart';
import '../widgets/settings.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainViewCubit, MainViewState>(
      builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: state.showBookList
                ? Text(context.t('My books'))
                : Text(context.t('Settings')),
            centerTitle: true,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.showBookList ? 0 : 1,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.menu_book),
                label: context.t('My books'),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: context.t('Settings'),
              ),
            ],
            onTap: (index) =>
                context.read<MainViewCubit>().showBookList(index == 0),
          ),
          floatingActionButton: state.showBookList
              ? FloatingActionButton(
                  onPressed: () async {
                    // await Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (_) => const BookFormView()));
                    context.pushNamed('book_form');
                    //context.read<BookListCubit>().getBooks();
                  },
                  child: const Icon(Icons.add),
                )
              : null,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: state.showBookList ? const BookList() : const Settings()),
    );
  }
}
