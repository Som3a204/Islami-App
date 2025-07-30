import 'package:flutter/material.dart';
import 'package:islami_app/modules/layout/radio/widgets/radio_item_widget.dart';

import '../../../core/constants/assets.dart';
import '../../../core/theme/color_pallette.dart';

class RadioView extends StatefulWidget {
  const RadioView({super.key});

  @override
  State<RadioView> createState() => _RadioViewState();
}

class _RadioViewState extends State<RadioView> {
  @override
  Widget build(BuildContext context) {
    final List<String> radioList = [
      "Radio Ibrahim Al-Akdar",
      "Radio Al-Qaria Yassen",
      "Radio Ahmed Al-trabulsi",
      "Radio Addokali Mohammad Alalim",
    ];
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.radioBackgroundImg),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.islamiLogo),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Container(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  decoration: BoxDecoration(
                    color: ColorPallette.primaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    "Radio",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              SizedBox(width: 10),
               Container(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  decoration: BoxDecoration(
                    color:  Colors.black,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    "Reciters",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount:
              radioList.length,
              itemBuilder: (context, index) {
                String name = radioList[index];
                return BuildListItem(name: name);
              },
            ),
          ),
        ],
      ),
    );
  }
}
