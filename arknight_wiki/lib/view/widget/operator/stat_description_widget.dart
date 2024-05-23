import 'package:arknight_wiki/view/widget/others/stats_text_wiget.dart';
import 'package:flutter/material.dart';


class StatDescriptionWidget extends StatelessWidget {
  const StatDescriptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StatTextWidget(title: "Hp", value: "1974"),
                StatTextWidget(title: "Def", value: "884"),
                StatTextWidget(title: "Attack", value: "774"),
                StatTextWidget(title: "Res", value: "20"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StatTextWidget(title: "Dp", value: "18"),
                StatTextWidget(title: "Block", value: "1"),
                StatTextWidget(title: "Redeploy", value: "Fast"),
              ],
            )
          ],
        ),
      ),
    );
  }
}