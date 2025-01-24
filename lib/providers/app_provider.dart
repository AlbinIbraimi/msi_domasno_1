import 'package:domasna_1/models/ingredient.dart';
import 'package:domasna_1/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ApplicationProvider extends ChangeNotifier {
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  final List<Meal> _meals = [];
  final List<String> _cateogries = [];
  final List<Meal> _mealsForCateogry = [];
  final List<Meal> _favoriteMeals = [];
  final List<Ingredient> _ingredients = [];
  final Map<DateTime, List<Meal>> _mealPlan = {};

  List<Meal> get meals => _meals;
  List<Meal> get mealsforCateogry => _mealsForCateogry;
  List<Meal> get favoriteMeals => _favoriteMeals;
  List<Ingredient> get ingredients => _ingredients;
  Map<DateTime, List<Meal>> get mealPlan => _mealPlan;

  List<String> get cateogries => _cateogries;

  toggleFavorite(Meal item) {
    final index = _meals.indexWhere((meal) => meal.id == item.id);
    if (index == -1) {
      return;
    }
    final newValue = !item.favorite;
    item.favorite = newValue;
    _meals[index].favorite = newValue;
    try {
      _store.collection('Meals').doc(item.id).update({
        'favorite': newValue,
      });
      _favoriteMeals.remove(item);
    } catch (e) {
      debugPrint('Error fetching data: $e');
    }

    notifyListeners();
  }

  Future<void> fetchData() async {
    try {
      final querySnapshot = await _store.collection('Meals').get();
      _meals.clear();
      for (var doc in querySnapshot.docs) {
        _meals.add(Meal.fromJson(doc.data(), doc.id));
      }

      final categorySnapshot = await _store.collection('Categories').get();
      _cateogries.clear();
      for (var doc in categorySnapshot.docs) {
        _cateogries.add(doc['name']);
      }

      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching data: $e');
    }
  }

  Future<void> fetchCategoryMeals(String category) async {
    try {
      _mealsForCateogry.clear();
      final querySnapshot = await _store
          .collection('Meals')
          .where('category', isEqualTo: category)
          .get();

      for (var doc in querySnapshot.docs) {
        _mealsForCateogry.add(Meal.fromJson(doc.data(), doc.id));
      }
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching data: $e');
    }
  }

  Future<void> fetchFavoriteMelas() async {
    try {
      _favoriteMeals.clear();
      final querySnapshot = await _store
          .collection('Meals')
          .where('favorite', isEqualTo: true)
          .get();

      for (var doc in querySnapshot.docs) {
        _favoriteMeals.add(Meal.fromJson(doc.data(), doc.id));
      }
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching data: $e');
    }
  }

  Future<void> fetchIngredientsForMeal(String id) async {
    try {
      _ingredients.clear();
      final querySnapshot = await _store
          .collection('Meals')
          .doc(id)
          .collection('ingredients')
          .get();

      for (var doc in querySnapshot.docs) {
        _ingredients.add(Ingredient.fromJson(doc.data(), doc.id));
      }

      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching data: $e');
    }
  }

  Future<void> fetchMealPlan() async {
    _mealPlan.clear();
    try {
      final querySnapshot = await _store
          .collection('Meals')
          .where('isInCalendar', isEqualTo: true)
          .get();

      for (var doc in querySnapshot.docs) {
        var meal = Meal.fromJson(doc.data(), doc.id);
        var normalizedDate =
            DateTime(meal.date.year, meal.date.month, meal.date.day);

        if (_mealPlan.containsKey(normalizedDate)) {
          _mealPlan[normalizedDate]!.add(meal);
        } else {
          _mealPlan[normalizedDate] = [meal];
        }
      }

      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching data: $e');
    }
  }
}
