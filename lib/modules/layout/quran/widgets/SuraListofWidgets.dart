import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/constants.dart';
import 'package:islami_app/models/SuraData.dart';
import 'package:islami_app/modules/layout/quran/widgets/SuraItem.dart';

class SuraListOfWidgets extends StatelessWidget {
  SuraListOfWidgets({super.key, required this.onSuraTap, required this.suraData});
  final void Function(int) onSuraTap;
final List<SuraData> suraData;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(padding: EdgeInsets.symmetric(horizontal: 20),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Suras List", style: theme.textTheme.bodyLarge),
             ListView.separated(
               shrinkWrap: true,
              padding: EdgeInsets.only(top: 10),
                itemBuilder: (BuildContext context, int index) {
                    return SuraItem(
                      onSuraTap: () => onSuraTap(int.parse(suraData[index].suraNumber)-1),
                      suraData: suraData[index]
                    );
            },
                separatorBuilder: (BuildContext context, int Index) {
                  return Divider(
                    indent: 20,
                    endIndent: 20,
                    thickness: 2,
                    height: 30,
                  );
                },
                itemCount: suraData.length)

          ],
        )
    );


  }
}
