import 'package:flutter/material.dart';

class AnimatedProvider extends ChangeNotifier {
  bool isExpanded = false;
  

  void changeExpandedValue() {
    isExpanded = !isExpanded;
    notifyListeners();
  }
}
