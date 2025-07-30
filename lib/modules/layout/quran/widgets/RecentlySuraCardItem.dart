import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/assets.dart';

import '../../../../models/SuraData.dart';

class RecentlySuraCardItem extends StatelessWidget {
  const RecentlySuraCardItem({super.key, required this.suraData});
  final SuraData suraData;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      width: 285,
      height: 150,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(suraData.suraNameEN, style: theme.textTheme.headlineSmall,),
              Text(suraData.suraNameAR, style: theme.textTheme.headlineSmall,),
              Text(suraData.ayatNumber.toString(), style: theme.textTheme.bodyMedium!.copyWith(
                color: Colors.black
              ),)
            ],
          ),
          Expanded(child: Image.asset(Assets.suraImg)
          )
        ],
      ),
    );
  }
}
