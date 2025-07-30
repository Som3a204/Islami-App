import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/assets.dart';
import 'package:islami_app/core/theme/color_pallette.dart';
import 'package:islami_app/models/hadith_data_model.dart';

class HadithItemWidget extends StatelessWidget {
  const HadithItemWidget({super.key, required this.hadithDataModel});
  final HadithDataModel hadithDataModel;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: ColorPallette.primaryColor,
        borderRadius: BorderRadius.circular(16),
        //image: DecorationImage(image: AssetImage(Assets.hadithCardBackground))
      ),
      child: Stack(
        children: [
          Positioned(
            left: 30,
            top: 20,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Opacity(
              opacity: 0.25,
              child: Image.asset(
                Assets.hadithCardBackground,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      Assets.hadithCardLeftCorner,
                      height: 90,
                      width: 90,
                    ),
                    Image.asset(
                      Assets.hadithCardRightCorner,
                      height: 90,
                      width: 90,
                    ),
                  ],
                ),
              ),
              Image.asset(Assets.mosqueImg),
            ],
          ),
          ListView(
            children: [
              SizedBox(height: 20),
              Text(hadithDataModel.hadithTitle, textAlign: TextAlign.center,style: theme.textTheme.headlineSmall),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(hadithDataModel.hadithContent,textAlign: TextAlign.center, style: theme.textTheme.bodyLarge!.copyWith( color: Colors.black),),
              )
            ],
          )
        ],
      ),
    );
  }
}
