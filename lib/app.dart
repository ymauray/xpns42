import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xpns42/pages/home_page/home_page.dart';
import 'package:xpns42/pages/login_page/login_page.dart';
import 'package:xpns42/pocketbase_util.dart';

class App extends StatelessWidget {
  const App({
    required this.showOnboardingSeen,
    super.key,
  });

  final bool showOnboardingSeen;

  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      useMaterial3: false,
      scaffoldBackgroundColor: Colors.grey.shade200,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Duo Budget',
      theme: baseTheme.copyWith(
        textTheme: GoogleFonts.notoSansTextTheme(baseTheme.textTheme),
      ),
      home: !pocketBaseInstance.authStore.isValid
          ? const LoginPage()
          : const HomePage(),
    );
  }
}
