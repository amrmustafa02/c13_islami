import 'package:c13_sat_islami/features/splash/pages/splash_page.dart';
import 'package:flutter/material.dart';

import 'features/layout/layout_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (_) {
          return SplashPage();
        },
        LayoutPage.routeName: (_) {
          return LayoutPage();
        },
      },
    );
  }
}
