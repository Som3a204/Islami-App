import 'package:flutter/material.dart';
import 'package:islami_app/core/theme/color_pallette.dart';

import '../../../../core/constants/assets.dart';

class BuildListItem extends StatelessWidget {
  const BuildListItem({super.key, required this.name});
final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(Assets.mosqueImg)),
        color: ColorPallette.primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(name, style: Theme.of(context).textTheme.titleLarge!.copyWith( color: Colors.black),),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(AssetImage(Assets.playIcn)),
              SizedBox(width: 15),
              ImageIcon(AssetImage(Assets.volHighIcn)),
            ],
          ),
        ],
      ),
    );
  }
}

