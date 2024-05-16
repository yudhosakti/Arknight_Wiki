import 'package:arknight_wiki/view/page/home/event_page.dart';
import 'package:arknight_wiki/view/page/home/home_page.dart';
import 'package:arknight_wiki/view/page/home/operator_page.dart';
import 'package:arknight_wiki/view/page/home/profile_page.dart';
import 'package:flutter/material.dart';

class BottomNavProvider extends ChangeNotifier {
  int index = 0;

  List<Widget> menu = [HomePage(), OperatorPage(), EventPage(), ProfilePage()];

  void changeIndex(int newIndex) {
    index = newIndex;
    notifyListeners();
  }
}
