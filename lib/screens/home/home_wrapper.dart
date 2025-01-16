import 'package:domasna_1/screens/favorite/favorite_screen.dart';
import 'package:domasna_1/screens/home/home_screen.dart';
import 'package:domasna_1/screens/mealPlan/mealPlan_screen.dart';
import 'package:domasna_1/screens/settings/settings_screen.dart';
import 'package:domasna_1/widgets/app_bottom_navigation.dart';
import 'package:flutter/material.dart';

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({super.key});

  @override
  State<HomeWrapper> createState() => _HomeState();
}

class _HomeState extends State<HomeWrapper> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: AppBottomNavigation(
            currentIndex: _selectedIndex, onTap: _onItemTapped),
        body: [Home(), Favorite(), MealPlan(), Settings()][_selectedIndex]);
  }
}
