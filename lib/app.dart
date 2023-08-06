import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/app_theme.dart';
import 'package:xpns42/l10n/l10n_extension.dart';
import 'package:xpns42/pages/forgot_password_page.dart';
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
      theme: AppTheme.data(context),
      routes: {
        '/': (context) => const Wrapper(),
        '/sign_in': (context) => const SignInPage(),
        '/forgot_password': (context) => const ForgotPasswordPage(),
        '/register': (context) => const RegisterAccountPage(),
      },
    );
  }
}
