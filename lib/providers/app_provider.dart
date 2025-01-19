import 'package:domasna_1/models/meal.dart';
import 'package:flutter/material.dart';

class ApplicationProvider extends ChangeNotifier {
  final List<Meal> _meals = [];
  List<Meal> get meals => _meals;

  Future<void> fetchMeals() async {
    _meals.add(Meal(
        image:
            "https://www.skinnytaste.com/wp-content/uploads/2022/03/Air-Fryer-Steak-6.jpg"));

    notifyListeners();
  }
}
