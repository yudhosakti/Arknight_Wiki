import 'package:arknight_wiki/provider/riverpod_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 29, 43, 1),
      appBar: null,
      body: ref.watch(bottomNavChange).menu[ref.watch(bottomNavChange).index],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(31, 29, 43, 1),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Color.fromRGBO(18, 205, 217, 1),
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Color.fromRGBO(37, 40, 54, 1),
              color: Colors.grey,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.category,
                  text: 'Operator',
                ),
                GButton(
                  icon: Icons.event,
                  text: 'Event',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ],
              selectedIndex: ref.watch(bottomNavChange).index,
              onTabChange: (value) =>
                  ref.read(bottomNavChange).changeIndex(value),
            ),
          ),
        ),
      ),
    );
  }
}
