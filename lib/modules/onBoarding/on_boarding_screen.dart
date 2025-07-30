import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/strings.dart';
import 'package:islami_app/core/routes/page_route_name.dart';
import 'package:islami_app/core/theme/color_pallette.dart';
import 'package:islami_app/models/on_boarding_model.dart';
import 'package:islami_app/modules/onBoarding/widgets/dot_indicator.dart';
import 'package:islami_app/modules/onBoarding/widgets/on_boarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/assets.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      currentIndex = pageController.page?.toInt() ?? 0;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: ColorPallette.quranDetailsColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(Assets.islamiLogo, height: size.height * 0.25),
          ),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemBuilder:
                  (context, index) => OnBoardingPage(
                    onBoardingData: OnBoardingData.onBoardingList[index],
                  ),
              itemCount: OnBoardingData.onBoardingList.length,
            ),
          ),
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed:
                        currentIndex != 0
                            ? () {
                              pageController.animateToPage(
                                currentIndex - 1,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                              );
                            }
                            : null,
                    style: TextButton.styleFrom(
                      foregroundColor: ColorPallette.primaryColor,
                      backgroundColor: Colors.transparent,
                      textStyle: theme.textTheme.bodyLarge!.copyWith(
                        color: ColorPallette.primaryColor,
                      ),
                    ),
                    child: currentIndex != 0 ? Text(Strings.back) : SizedBox.shrink(),
                  ),
                  TextButton(
                    onPressed: () {
                      if(currentIndex ==4){
                        _seenOnBoarding();
                      }
                      pageController.animateToPage(
                          currentIndex + 1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: ColorPallette.primaryColor,
                      backgroundColor: Colors.transparent,
                      textStyle: theme.textTheme.bodyLarge!.copyWith(
                        color: ColorPallette.primaryColor,
                      ),
                    ),
                    child: Text(currentIndex != 4
                        ?Strings.next : Strings.finish),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  OnBoardingData.onBoardingList.length,
                  (index) => DotIndicator(isActive: index == currentIndex),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  void _seenOnBoarding() async{
SharedPreferences preferences = await SharedPreferences.getInstance();
preferences.setBool('firstTime', false);
Navigator.pushNamed(context, PageRouteName.layoutView);
  }
}


