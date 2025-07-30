import 'package:flutter/material.dart';
import 'package:islami_app/core/routes/page_route_name.dart';
import 'package:islami_app/models/SuraData.dart';
import 'package:islami_app/modules/layout/quran/quran_details_view.dart';
import 'package:islami_app/modules/layout/quran/widgets/RecentlySuraCardItem.dart';

class RecentlySuraWidget extends StatelessWidget {
  const RecentlySuraWidget({super.key, required this.suraDataList});
final List<SuraData> suraDataList;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Padding(padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text("Most Recently", style: theme.textTheme.bodyLarge,)
        ),
        SizedBox(height: 155,
        child:ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, PageRouteName.quranDetailsView, arguments: suraDataList[index]);
            },
            child: RecentlySuraCardItem(
              suraData: suraDataList[index],
            ),
          );
        },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width:  10,);
            },
            itemCount: suraDataList.length)
        )
      ],
    );
  }
}
