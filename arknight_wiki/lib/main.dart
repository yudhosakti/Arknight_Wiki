import 'package:arknight_wiki/view/page/intro/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          dividerTheme: DividerThemeData(color: Colors.transparent),
          bottomSheetTheme:
              BottomSheetThemeData(backgroundColor: Colors.black)),
      debugShowCheckedModeBanner: false,
      home: OnBoardingPage(),
    );
  }
}
