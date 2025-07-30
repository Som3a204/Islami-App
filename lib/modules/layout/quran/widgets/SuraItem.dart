import 'package:flutter/material.dart';
import 'package:islami_app/core/routes/page_route_name.dart';
import 'package:islami_app/models/SuraData.dart';

import '../../../../core/constants/assets.dart';

class SuraItem extends StatelessWidget {
  final SuraData suraData;
  const SuraItem({super.key, required this.suraData, required this.onSuraTap});
  final VoidCallback onSuraTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        onSuraTap();
      },
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(Assets.suraFrame))
            ),
            child: Text(suraData.suraNumber.toString(),
                style: theme.textTheme.titleLarge!.copyWith(
                    color: Colors.white
                )),
          ),
          SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(suraData.suraNameEN, style: theme.textTheme.titleLarge,),
              Text("${suraData.ayatNumber} verses".toString(), style: theme.textTheme.bodyMedium,)
            ],
          ),
          Spacer(),
          Text(suraData.suraNameAR, style: theme.textTheme.titleLarge,)
        ],
      ),
    );
  }
}
