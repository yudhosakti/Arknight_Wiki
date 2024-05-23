import 'package:arknight_wiki/view/widget/operator/operator_icon_widget.dart';
import 'package:flutter/material.dart';


class SimilarOperatorWidget extends StatelessWidget {
  const SimilarOperatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.012),
            child: OperatorIconWidget(
                image:
                    "https://static.wikia.nocookie.net/mrfz/images/f/f8/Phantom_icon.png/revision/latest?cb=20200426100549",
                name: "Phantom",
                isCircle: true,
                colorText: Colors.white),
          );
        },
      ),
    );
  }
}