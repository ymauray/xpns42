import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/page/book_page.dart';
import 'package:xpns42/page/expense_form.dart';
import 'package:xpns42/page/home_page.dart';
import 'package:xpns42/page/register_page.dart';
import 'package:xpns42/page/sign_in_page.dart';
import 'package:xpns42/widget/book_form.dart';
import 'package:xpns42/widget/wrapper.dart';

class App extends ConsumerWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Xpns42',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
        brightness: Brightness.light,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          errorStyle: TextStyle(height: 0),
        ),
      ),
      home: const Wrapper(),
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const SignInPage(),
        '/register': (context) => const RegisterPage(),
        '/add': (context) => const BookForm(),
        '/edit': (context) => const BookForm(),
        '/expenses': (context) => const BookPage(),
        '/expenses/add': (context) => const ExpenseForm(),
      },
    );
  }
}
