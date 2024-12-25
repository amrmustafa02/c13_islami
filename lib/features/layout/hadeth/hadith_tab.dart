import 'package:c13_sat_islami/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

class HadithTab extends StatelessWidget {
  const HadithTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            AppAssets.hadithBG,
          ),
        ),
      ),
    );
  }
}
