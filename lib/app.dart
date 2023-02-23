import 'package:flutter/material.dart';
import 'package:xpns42/page/login/login_page.dart';
import 'package:xpns42/util/color_utils.dart';
import 'package:xpns42/util/colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xpns42',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: ColorUtils.createMaterialColor(AppColors.base),
      ),
      home: LoginPage(),
    );
  }
}
