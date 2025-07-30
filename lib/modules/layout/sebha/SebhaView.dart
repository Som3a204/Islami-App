import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/constants/assets.dart';
import '../../../core/constants/strings.dart';

class SebhaView extends StatefulWidget {
  const SebhaView({super.key});

  @override
  State<SebhaView> createState() => _SebhaViewState();
}

class _SebhaViewState extends State<SebhaView> {
  List<String> tasbeehList = [
    "ألله أكبر",
    "لا إله إلا ألله",
    "الحمد لله",
    "سبحان الله",
  ];
  late String tasbeehTitle = tasbeehList[0];
  int counter = 0;
  double turns = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.sebhaBackgroundImg),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Image.asset(Assets.islamiLogo, height: size.height * 0.25),
          Text(
            Strings.zekrHeader,
            style: theme.textTheme.titleLarge!.copyWith(fontSize: 36),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Row(),
                Image.asset(Assets.sebhaHead, height: size.height * 0.10),
                Positioned.fill(
                  top: size.height * 0.07,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Stack(
                      children: [
                        AnimatedRotation(
                          turns: turns,
                          duration: Duration(milliseconds: 500),
                          child: InkWell(
                            onTap: () {
                              _updateTasbeeh();
                            },
                            child: Image.asset(
                              Assets.sebhaBody,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(),
                            Text(
                              tasbeehTitle,
                              style: theme.textTheme.titleLarge!.copyWith(
                                fontSize: 36,
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              counter.toString(),
                              style: theme.textTheme.titleLarge!.copyWith(
                                fontSize: 36,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _updateTasbeeh() {
    turns = turns + (pi / 33);
    counter++;
    if (counter == 34) {
      tasbeehTitle = tasbeehList[(tasbeehTitle.indexOf(tasbeehTitle) + 1) % 3];
      counter = 0;
    }
    setState(() {});
  }
}
