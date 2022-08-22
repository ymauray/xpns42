import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gettext_i18n/gettext_i18n.dart';

import 'app_theme.dart';
import 'pages/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xpns42',
      theme: AppTheme.data,
      debugShowCheckedModeBanner: false,
      supportedLocales: const [Locale('en'), Locale('fr')],
      localizationsDelegates: [
        GettextLocalizationsDelegate(defaultLanguage: 'fr'),
        ...GlobalMaterialLocalizations.delegates,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeListResolutionCallback: (locales, supportedLocales) {
        if (locales != null) {
          for (var locale in locales) {
            var supportedLocale = supportedLocales.where((element) =>
                element.languageCode == locale.languageCode &&
                element.countryCode == locale.countryCode);
            if (supportedLocale.isNotEmpty) {
              return supportedLocale.first;
            }
            supportedLocale = supportedLocales.where(
              (element) => element.languageCode == locale.languageCode,
            );
            if (supportedLocale.isNotEmpty) {
              return supportedLocale.first;
            }
          }
        }

        return null;
      },
      home: const HomePage(),
    );
  }
}
