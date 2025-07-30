import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/routes/page_route_name.dart';
import 'package:islami_app/core/theme/color_pallette.dart';
import 'package:islami_app/models/SuraData.dart';

import '../../../core/constants/assets.dart';

class QuranDetailsView extends StatefulWidget {
   QuranDetailsView({super.key});

  @override
  State<QuranDetailsView> createState() => _QuranDetailsViewState();
}

class _QuranDetailsViewState extends State<QuranDetailsView> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final SuraData data = ModalRoute.of(context)!.settings.arguments as SuraData;


    if(verses.isEmpty)loadSuraDataFromAssets(data.suraNumber.toString());
    return Scaffold(
        backgroundColor: Color(0xFF202020),
       // appBar: AppBar(toolbarHeight: 50, title: Text("Al Quran"),),
        body: Container(
          width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
    image: DecorationImage(image: AssetImage(Assets.suraBackground),
    fit: BoxFit.fill)
    ),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 20)
              ,child: Row(
                  children: [
                    IconButton(onPressed: () => Navigator.pushNamed(context, PageRouteName.layoutView),
                        icon: Icon(Icons.arrow_back,color: ColorPallette.primaryColor)
                    ),
                    SizedBox(width: 10),
                    Text(data.suraNameEN, style: theme.textTheme.titleLarge!.copyWith(
                      color: ColorPallette.primaryColor
                    ),)
                  ],
                ),
              ),
              Text(data.suraNameAR, style: theme.textTheme.titleLarge!.copyWith(
                color: ColorPallette.primaryColor
              )),
              SizedBox(height: 35),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: ListView.separated(
                      itemBuilder: (BuildContext context, int index){
                        return Text("(${index + 1})${verses[index]}",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: ColorPallette.primaryColor
                        ));
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 10);
                      },
                      itemCount: verses.length),
                ),
              )
            ],
          ),
      ),
    );
  }

  List<String> verses = [];

  Future<void> loadSuraDataFromAssets(String index) async{
    String content =await rootBundle.loadString("assets/files/$index.txt");
    verses = content.split("\n");
    setState(() {});
  }
}
