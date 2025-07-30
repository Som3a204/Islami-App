import 'package:flutter/widgets.dart';
import 'package:islami_app/modules/layout/quran/quran_details_view.dart';
import 'package:islami_app/modules/onBoarding/on_boarding_screen.dart';

import '../../modules/layout/layout_view.dart';
import '../../modules/splash/Splash_view.dart';
import 'page_route_name.dart';

abstract class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
PageRouteName.splashView: (context)=> SplashView(),
      PageRouteName.layoutView: (context)=> LayoutView(),
    PageRouteName.quranDetailsView: (context) => QuranDetailsView(),
   PageRouteName.onBoardingScreen: (context) => OnBoardingScreen(),
  };
}