import 'package:c13_sat_islami/core/constants/app_assets.dart';
import 'package:c13_sat_islami/core/theme/app_colors.dart';
import 'package:c13_sat_islami/models/sura_data_model.dart';
import 'package:flutter/material.dart';

class SuraCardWidget extends StatelessWidget {
  final SuraDataModel suraDataModel;

  const SuraCardWidget({
    super.key,
    required this.suraDataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppAssets.numberIcn,
                ),
              ),
            ),
            child: Text(
              suraDataModel.id.toString(),
              style: TextStyle(
                  fontSize: 15,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 35),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                suraDataModel.nameEN,
                style: TextStyle(
                    fontFamily: "Janna",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white),
              ),
              Text(
                "${suraDataModel.verses} Verses",
                style: TextStyle(
                    fontFamily: "Janna",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white),
              ),
            ],
          ),
          Spacer(),
          Text(
            suraDataModel.nameAR,
            style: TextStyle(
                fontFamily: "Janna",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
