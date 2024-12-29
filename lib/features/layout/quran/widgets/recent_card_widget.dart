import 'package:c13_sat_islami/core/constants/app_assets.dart';
import 'package:c13_sat_islami/core/theme/app_colors.dart';
import 'package:c13_sat_islami/models/recent_sura_data.dart';
import 'package:flutter/material.dart';

class RecentCardWidget extends StatelessWidget {
  final RecentSuraData suraData;

  const RecentCardWidget({
    super.key,
    required this.suraData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                suraData.suraNameEN,
                style: TextStyle(
                  fontFamily: "Janna",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                suraData.suraNameAR,
                style: TextStyle(
                  fontFamily: "Janna",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${suraData.suraVersesNumber} Verses",
                style: TextStyle(
                  fontFamily: "Janna",
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Image.asset(AppAssets.recentImg),
        ],
      ),
    );
  }
}
