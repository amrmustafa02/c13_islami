import 'package:c13_sat_islami/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomNavBarItem extends StatelessWidget {
  final int selectedIndex;
  final int navBarItemIndex;
  final String iconPath;

  const CustomNavBarItem({
    super.key,
    required this.selectedIndex,
    required this.navBarItemIndex,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: selectedIndex == navBarItemIndex
            ? AppColors.secondaryColor.withOpacity(0.5)
            : Colors.transparent,
      ),
      child: ImageIcon(
        AssetImage(
          iconPath,
        ),
      ),
    );
  }
}
