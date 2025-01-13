import 'package:c13_sat_islami/core/constants/app_assets.dart';
import 'package:c13_sat_islami/core/constants/local_storage_keys.dart';
import 'package:c13_sat_islami/core/services/local_storage_service.dart';
import 'package:c13_sat_islami/core/theme/app_colors.dart';
import 'package:c13_sat_islami/features/layout/layout_page.dart';
import 'package:c13_sat_islami/features/onboarding/models/on_boarding_model.dart';
import 'package:c13_sat_islami/features/onboarding/widgets/onboarding_item.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  static String routeName = '/onboarding';

  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var activeIndex = 0;
  var controller = PageController();

  @override
  void initState() {
    super.initState();
    LocalStorageService.setBool(LocalStorageKeys.isFirstTimeRun, false);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16),
              Image.asset(
                AppAssets.islamiLogo,
                height: size.height * 0.15,
              ),
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: (index) {
                    activeIndex = index;
                    setState(() {});
                  },
                  itemCount: OnboardingModel.onboardingList.length,
                  itemBuilder: (context, index) {
                    var onboardingModel = OnboardingModel.onboardingList[index];
                    return OnboardingItem(onboardingModel: onboardingModel);
                  },
                ),
              ),
              Row(
                children: [
                  Visibility(
                    visible: activeIndex != 0,
                    replacement: Spacer(),
                    child: TextButton(
                      onPressed: () {
                        controller.previousPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                        if (activeIndex > 0) {
                          activeIndex--;
                        }
                      },
                      child: Text(
                        "Back",
                        style: TextStyle(
                          fontFamily: "Janna",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  AnimatedSmoothIndicator(
                    activeIndex: activeIndex,
                    count: OnboardingModel.onboardingList.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: AppColors.primaryColor,
                      dotColor: AppColors.darkGrey,
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      if (activeIndex ==
                          OnboardingModel.onboardingList.length - 1) {
                        Navigator.pushReplacementNamed(
                            context, LayoutPage.routeName);
                        return;
                      }
                      controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                      if (activeIndex < OnboardingModel.onboardingList.length) {
                        activeIndex++;
                      }
                    },
                    child: Text(
                      activeIndex == OnboardingModel.onboardingList.length - 1
                          ? "Finish"
                          : "Next",
                      style: TextStyle(
                        fontFamily: "Janna",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
