import 'package:islami_app/core/constants/strings.dart';

import '../core/constants/assets.dart';

class OnBoardingData {
  String imgPath;
  String title;
  String? description;
  OnBoardingData({
    required this.imgPath,
    required this.title,
    this.description,
  });
  static List<OnBoardingData> onBoardingList = [
    OnBoardingData(imgPath: Assets.onBoarding1, title: Strings.onBoardingTitle),
  OnBoardingData(
      imgPath: Assets.onBoarding2,
      title: Strings.onBoarding2Title,
      description: Strings.onBoarding2Description,
    ), OnBoardingData(
      imgPath: Assets.onBoarding3,
      title: Strings.onBoarding3Title,
      description: Strings.onBoarding3Description,
    ),
    OnBoardingData(
      imgPath: Assets.onBoarding4,
      title: Strings.onBoarding4Title,
      description: Strings.onBoarding4Description,
    ),
    OnBoardingData(
      imgPath: Assets.onBoarding5,
      title: Strings.onBoarding5Title,
      description: Strings.onBoarding5Description,
    ),
  ];
}
