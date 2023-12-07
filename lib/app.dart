import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xpns42/l10n/l10n_extension.dart';
import 'package:xpns42/pages/forgot_password_page.dart';
import 'package:xpns42/pages/front_page.dart';
import 'package:xpns42/pages/ledger_page.dart';
import 'package:xpns42/pages/ledgers_list_page.dart';
import 'package:xpns42/pages/register_account_page.dart';
import 'package:xpns42/pages/sign_in_page.dart';
import 'package:xpns42/wrapper.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => context.t.appTitle,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.nunitoTextTheme(),
      ),
      routes: {
        '/': (context) => const Wrapper(),
        '/front_page': (context) =>
            const FrontPage(), // Buttons to sign in or register
        '/sign_in': (context) => const SignInPage(),
        '/forgot_password': (context) => const ForgotPasswordPage(),
        '/register': (context) => const RegisterAccountPage(),
        '/ledgers': (context) => const LedgersListPage(),
        '/ledger': (context) => const LedgerPage(),
      },
    );
  }
}
