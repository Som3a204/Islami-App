import 'package:flutter/material.dart';
import 'package:islami_app/core/theme/color_pallette.dart';
import 'quran/QuranView.dart';
import 'radio/RadioView.dart';
import 'sebha/SebhaView.dart';
import 'time/TimeView.dart';
import '../../core/constants/assets.dart';
import 'hadith/HadithView.dart';

class LayoutView extends StatefulWidget {
   LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
int selectedIndex = 0;
List<Widget> screens = [
  QuranView(),
HadithView(),
SebhaView(),
RadioView(),
TimeView()
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
          onTap: (index) {
          selectedIndex = index;
          setState(() {});
          },
          items: [
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(Assets.quranIcn)),
        label: "Quran",
        activeIcon: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
        color: Colors.black38,
          borderRadius: BorderRadius.circular(30)
        ),
    child: ImageIcon(AssetImage(Assets.quranIcn)),
    )
        ),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage(Assets.hadithIcn)),
                label: "Hadith",
    activeIcon: Container(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    decoration: BoxDecoration(
    color: Colors.black38,
    borderRadius: BorderRadius.circular(30)
    ),
    child: ImageIcon(AssetImage(Assets.hadithIcn)),
    )
              ),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage(Assets.sebhaIcn)),
                label: "Sebha",
    activeIcon: Container(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    decoration: BoxDecoration(
    color: Colors.black38,
    borderRadius: BorderRadius.circular(30)
    ),
    child: ImageIcon(AssetImage(Assets.sebhaIcn)),
    )
            ),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage(Assets.radioIcn)),
                label: "Radio",
                activeIcon: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: ImageIcon(AssetImage(Assets.radioIcn)),
                )
            ),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage(Assets.timeIcn)),
                label: "Time",
                activeIcon: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: ImageIcon(AssetImage(Assets.timeIcn)),
                )
            )
      ]),
    );
  }
}