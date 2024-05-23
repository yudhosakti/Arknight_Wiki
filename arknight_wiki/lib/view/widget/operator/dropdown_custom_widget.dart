import 'package:arknight_wiki/provider/animated_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class DropDownWidgetCustom extends StatelessWidget {
  final String title;
  final Widget customInformation;
  const DropDownWidgetCustom({
    super.key,
    required this.title,
    required this.customInformation,
    required this.animationContainer,
  });

  final AnimatedProvider animationContainer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02),
      child: Container(
          width: MediaQuery.of(context).size.width,
          constraints: BoxConstraints(maxHeight: double.infinity),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.058,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(117, 29, 46, 1),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(12))),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.01),
                          child: Text(
                            "$title",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: IconButton(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.01),
                          onPressed: () {
                            animationContainer.changeExpandedValue();
                          },
                          icon: animationContainer.isExpanded
                              ? Icon(
                                  Icons.arrow_upward,
                                  color: Colors.white,
                                  size: 32,
                                )
                              : Icon(
                                  Icons.arrow_downward,
                                  color: Colors.white,
                                  size: 32,
                                )),
                    ))
                  ],
                ),
              ),
              AnimatedSize(
                duration: Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  constraints: animationContainer.isExpanded
                      ? BoxConstraints()
                      : BoxConstraints(maxHeight: 0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Visibility(
                      visible: animationContainer.isExpanded,
                      replacement: SizedBox.shrink(),
                      child: customInformation),
                ),
              )
            ],
          )),
    );
  }
}
