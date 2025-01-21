import 'package:domasna_1/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ApplicationProvider extends ChangeNotifier {
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  final List<Meal> _meals = [];
  final List<String> _cateogries = [];

  List<Meal> get meals => _meals;
  List<String> get cateogries => _cateogries;

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

  toggleFavorite(Meal item) {
    final index = _meals.indexWhere((meal) => meal.id == item.id);
    if (index != -1) {
      _meals[index].favorite = !item.favorite;
    }
    try {
      _store.collection('Meals').doc(item.id).update({
        'favorite': item.favorite,
      });
    } catch (e) {}
    notifyListeners();
  }
}
