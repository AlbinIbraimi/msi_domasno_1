import 'package:domasna_1/models/meal.dart';
import 'package:flutter/material.dart';

class ApplicationProvider extends ChangeNotifier {
  final List<Meal> _meals = [];
  final List<String> _cateogries = [];

  List<Meal> get meals => _meals;
  List<String> get cateogries => _cateogries;

  Future<void> fetchData() async {
    _meals.add(Meal(
        image:
            "https://www.skinnytaste.com/wp-content/uploads/2022/03/Air-Fryer-Steak-6.jpg"));

    _cateogries.addAll(["Pizza", "Passta", "Meet", "Vege", "Cackes"]);

    notifyListeners();
  }
}
