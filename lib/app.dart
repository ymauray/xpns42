import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gettext_i18n/gettext_i18n.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'cubit/book_form_cubit.dart';
import 'cubit/book_list_cubit.dart';
import 'cubit/main_view_cubit.dart';
import 'data/books_repository.dart';
import 'views/book_form_view.dart';
import 'views/book_view.dart';
import 'views/main_view.dart';

class Xpns42App extends StatelessWidget {
  Xpns42App({Key? key}) : super(key: key);

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MainView(),
      ),
      GoRoute(
        path: '/book/:id',
        name: 'book',
        builder: (context, state) => BookView(int.parse(state.params['id']!)),
      ),
      GoRoute(
        path: '/book_form',
        name: 'book_form',
        builder: (context, state) => const BookFormView(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        RepositoryProvider<BooksRepository>(
          create: (_) => BooksRepository.create(),
        ),
        BlocProvider<BookListCubit>(
          create: (context) =>
              BookListCubit(RepositoryProvider.of<BooksRepository>(context)),
        ),
        BlocProvider<MainViewCubit>(create: (_) => MainViewCubit()),
        BlocProvider<BookFormCubit>(
          create: (context) =>
              BookFormCubit(RepositoryProvider.of<BooksRepository>(context)),
        ),
      ],
      child: MaterialApp.router(
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        supportedLocales: const [Locale('en'), Locale('fr')],
        localizationsDelegates: [
          GettextLocalizationsDelegate(),
          ...GlobalMaterialLocalizations.delegates,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        title: Constants.title,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
}
