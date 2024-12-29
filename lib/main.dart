import 'package:c13_sat_islami/features/layout/quran/quran_details_view.dart';
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
        SplashPage.routeName: (_) => SplashPage(),
        LayoutPage.routeName: (_) => LayoutPage(),
        QuranDetailsView.routeName: (_) => QuranDetailsView(),
      },
    );
  }
}
