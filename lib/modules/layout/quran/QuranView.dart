import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/constants.dart';
import 'package:islami_app/core/services/local_storage_keys.dart';
import 'package:islami_app/core/services/local_storage_service.dart';
import 'package:islami_app/core/theme/color_pallette.dart';
import 'package:islami_app/models/SuraData.dart';
import 'package:islami_app/modules/layout/quran/widgets/RecentlySuraWidget.dart';
import 'package:islami_app/modules/layout/quran/widgets/SuraListofWidgets.dart';

import '../../../core/constants/assets.dart';
import '../../../core/routes/page_route_name.dart';

class QuranView extends StatefulWidget {
   QuranView({super.key});

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  @override
  void initState() {
    super.initState();
    loadRecentData();
  }
  String searchQuery = '';
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(Assets.quranBackgroundImg),
        fit: BoxFit.cover)
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Image.asset(Assets.islamiLogo),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                    onChanged: (value){
                      searchQuery = value;
                      search();
                      setState(() {});
                    },
                    decoration: InputDecoration(
                    hintText: "Sura Name",
                    hintStyle: theme.textTheme.bodyLarge,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                            color: theme.primaryColor
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                            color: theme.primaryColor
                        )
                    ),
                    prefixIcon: Padding(padding: EdgeInsets.all(8),
                        child: ImageIcon(AssetImage(Assets.quranIcn),
                            color: theme.primaryColor)
                    )
                ))
            ),
           Visibility(
             visible: searchQuery.isEmpty,
             replacement: SuraListOfWidgets(
               onSuraTap: onSuraTap,
               suraData: searchSuraList,
             ),
             child: Column(
               children: [
                 recentSuraList.isNotEmpty?
                 RecentlySuraWidget(
                   suraDataList: recentSuraList,
                 ) :
                 Center(
                     child: Text("No Recent Sura",
                   style: theme.textTheme.titleLarge!.copyWith( color: ColorPallette.primaryColor),))
                 ,
                 SuraListOfWidgets(
                   onSuraTap: onSuraTap,
                    suraData: Constants.allSuras
                 ),
               ],
             ),
           )

          ],
        ),
      )
    );
  }

  List<String> recentSuraIndexList = [];

  List<SuraData> recentSuraList = [];

  onSuraTap(int index){
    _cacheSuraIndex(index);
 Navigator.pushNamed(context,PageRouteName.quranDetailsView,
     arguments: Constants.allSuras[index]);
  }

  _cacheSuraIndex(int index){
    if(recentSuraIndexList.length == 5){
      recentSuraList.removeLast();
    }
    var indexString = index.toString();
    if(recentSuraIndexList.contains(indexString)){
      return;
    }
    recentSuraIndexList.insert(0, indexString);
    LocalStorageServices.setStringList(LocalStorageKeys.recentSuras, recentSuraIndexList);

  }
  loadRecentData(){
    recentSuraIndexList = LocalStorageServices.getStringList(LocalStorageKeys.recentSuras) ?? [];
    for( var index in recentSuraIndexList){
      int indexInt = int.parse(index);
      recentSuraList.add(Constants.allSuras[indexInt]);
    }
  }

  List<SuraData> searchSuraList = [];

  void search() {
    searchSuraList = [];
    for(var sura in Constants.allSuras){
      if(sura.suraNameEN.toLowerCase().contains(searchQuery.toLowerCase()) || sura.suraNameAR.toLowerCase().contains(searchQuery.toLowerCase()) ){
        searchSuraList.add(sura);
      }
    }
  }
}
