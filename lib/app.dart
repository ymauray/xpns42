import 'package:flutter/material.dart';
import 'package:xpns42/page/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Xpns42',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
