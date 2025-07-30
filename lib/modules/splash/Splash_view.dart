import 'package:flutter/material.dart';
import 'package:islami_app/core/routes/page_route_name.dart';

import '../../core/constants/assets.dart';

class SplashView extends StatefulWidget {

  const SplashView({super.key});
  @override
  State<SplashView> createState() => _SplashViewState(); 
  }

  class _SplashViewState extends State<SplashView> {
  @override
  void initState(){
    Future.delayed(const Duration(seconds: 3),() {
      Navigator.pushNamed(context, PageRouteName.layoutView);
    } );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.splashBackgroundImg),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  }


