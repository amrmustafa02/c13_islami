import 'package:c13_sat_islami/core/constants/app_assets.dart';
import 'package:c13_sat_islami/core/theme/app_colors.dart';
import 'package:c13_sat_islami/models/recent_sura_data.dart';
import 'package:c13_sat_islami/models/sura_data_model.dart';
import 'package:flutter/material.dart';

class RecentCardWidget extends StatelessWidget {
  final SuraDataModel suraData;

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
                suraData.nameEN,
                style: TextStyle(
                  fontFamily: "Janna",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                suraData.nameAR,
                style: TextStyle(
                  fontFamily: "Janna",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${suraData.verses} Verses",
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
