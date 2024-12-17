import 'package:c13_sat_islami/core/constants/app_assets.dart';
import 'package:c13_sat_islami/core/theme/app_colors.dart';
import 'package:c13_sat_islami/features/layout/pages/hadith_tab.dart';
import 'package:c13_sat_islami/features/layout/pages/quran_tab.dart';
import 'package:c13_sat_islami/features/layout/pages/radio_tab.dart';
import 'package:c13_sat_islami/features/layout/pages/sbha_tab.dart';
import 'package:c13_sat_islami/features/layout/pages/times_tab.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_nav_bar_item.dart';

class LayoutPage extends StatefulWidget {
  static String routeName = "/layout";

  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    SbhaTab(),
    RadioTab(),
    TimesTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.primaryColor,
        fixedColor: AppColors.white,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: CustomNavBarItem(
              selectedIndex: selectedIndex,
              navBarItemIndex: 0,
              iconPath: AppAssets.quranIcn,
            ),
            label: "Quran",
          ),
          BottomNavigationBarItem(
            icon: CustomNavBarItem(
              selectedIndex: selectedIndex,
              navBarItemIndex: 1,
              iconPath: AppAssets.hadithIcn,
            ),
            label: "Hadith",
          ),
          BottomNavigationBarItem(
            icon: CustomNavBarItem(
              selectedIndex: selectedIndex,
              navBarItemIndex: 2,
              iconPath: AppAssets.sbhaIcn,
            ),
            label: "Sbha",
          ),
          BottomNavigationBarItem(
            icon: CustomNavBarItem(
              selectedIndex: selectedIndex,
              navBarItemIndex: 3,
              iconPath: AppAssets.radioIcn,
            ),
            label: "Radio",
          ),
          BottomNavigationBarItem(
            icon: CustomNavBarItem(
              selectedIndex: selectedIndex,
              navBarItemIndex: 4,
              iconPath: AppAssets.timesIcn,
            ),
            label: "Times",
          ),
        ],
      ),
      body: tabs[selectedIndex],
    );
  }
}
