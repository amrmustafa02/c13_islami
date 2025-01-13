import 'package:c13_sat_islami/core/theme/app_colors.dart';
import 'package:c13_sat_islami/features/onboarding/models/on_boarding_model.dart';
import 'package:flutter/material.dart';

class OnboardingItem extends StatelessWidget {
  final OnboardingModel onboardingModel;

  const OnboardingItem({super.key, required this.onboardingModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          onboardingModel.imagePath,
          height: size.height * 0.35,
        ),
        Text(
          onboardingModel.title,
          style: TextStyle(
            fontFamily: "Janna",
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
        Text(
          onboardingModel.desc ?? "",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Janna",
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
