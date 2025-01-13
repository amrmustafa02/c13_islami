class OnboardingModel {
  String imagePath;
  String title;
  String? desc;

  OnboardingModel({
    required this.imagePath,
    required this.title,
    this.desc,
  });

  static List<OnboardingModel> onboardingList = [
    OnboardingModel(
      imagePath: "assets/images/onboarding_1.png",
      title: "Welcome To Islmi App",
    ),
    OnboardingModel(
      imagePath: "assets/images/onboarding_2.png",
      title: "Welcome To Islmi App",
      desc: "We Are Very Excited To Have You In Our Community",
    ),
    OnboardingModel(
      imagePath: "assets/images/onboarding_2.png",
      title: "Welcome To Islmi App",
      desc: "We Are Very Excited To Have You In Our Community",
    ),
    OnboardingModel(
      imagePath: "assets/images/onboarding_3.png",
      title: "Reading the Quran",
      desc: "Read, and your Lord is the Most Generous",
    ),
    OnboardingModel(
      imagePath: "assets/images/onboarding_4.png",
      title: "Bearish",
      desc: "Praise the name of your Lord, the Most High",
    ),
    OnboardingModel(
      imagePath: "assets/images/onboarding_5.png",
      title: "Holy Quran Radio",
      desc:
          "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];
}
