import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/models/hadith_data_model.dart';
import 'package:islami_app/modules/layout/hadith/widgets/hadith_item_widget.dart';
import '../../../core/constants/assets.dart';

class HadithView extends StatefulWidget {
   HadithView({super.key});

  @override
  State<HadithView> createState() => _HadithViewState();
}

class _HadithViewState extends State<HadithView> {
  @override
  Widget build(BuildContext context) {
    if(hadithDataList.isEmpty) loadHadithData();
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.hadithBackgroundImg),
              fit: BoxFit.cover)
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(Assets.islamiLogo),
            CarouselSlider(
              items: hadithDataList.map((e) { return HadithItemWidget(
                hadithDataModel: e,
              );}).toList()
              ,
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.6,
                  aspectRatio: 16/9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  autoPlayAnimationDuration: Duration(microseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal
              ),
            ),
          ],
        ),
      )

    );
  }

  List<HadithDataModel> hadithDataList = [];

 Future<void> loadHadithData() async{
  String content = await rootBundle.loadString('assets/files/ahadeth.txt');
  List<String> allHadeth = content.split('#');

  for(var element in allHadeth){
    String singleHadith = element.trim();

    int indexOfTitle = singleHadith.indexOf("\n");
    String hadithTitle = singleHadith.substring(0,indexOfTitle);
    String hadithContent = singleHadith.substring(indexOfTitle+1);

    HadithDataModel hadithDataModel = HadithDataModel(
        hadithTitle: hadithTitle, hadithContent: hadithContent);
setState(() {
  hadithDataList.add(hadithDataModel);
});

  }
  }
}
