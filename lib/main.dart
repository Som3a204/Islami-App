import 'package:flutter/material.dart';
import 'package:islami_app/core/routes/routes.dart';
import 'package:islami_app/core/services/local_storage_service.dart';
import 'package:islami_app/core/theme/theme_manager.dart';
import 'package:islami_app/modules/layout/layout_view.dart';
import 'package:islami_app/modules/splash/Splash_view.dart';

import 'core/routes/page_route_name.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageServices.init();
  var isFirstTime = await LocalStorageServices.getBool("firstTime") ?? true;
  runApp( MyApp(isFirstTime: isFirstTime,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isFirstTime});
final bool isFirstTime;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeManager.theme,
        debugShowCheckedModeBanner: false,
    initialRoute:isFirstTime ?  PageRouteName.onBoardingScreen : PageRouteName.layoutView,
    routes: Routes.routes
    );
  }
}
