import 'package:cloud_firestore/cloud_firestore.dart';

class Meal {
  final String id;
  final String name;
  final String category;
  final String image;
  final int calories;
  final int rating;
  final int time;
  final List<String> steps;
  bool favorite;
  bool isInCalendar;
  DateTime date;

  Meal({
    this.id = "",
    this.name = "Pizza Italiana",
    this.category = "Pizza",
    this.image = "",
    this.calories = 100,
    this.rating = 10,
    this.time = 15,
    this.favorite = false,
    this.steps = const [],
    this.isInCalendar = false,
    DateTime? date,
  }) : date = date ?? DateTime.now();

  @override
  String toString() {
    return 'Meal(id:$id, name: $name, category: $category, image: $image, calories: $calories, rating: $rating, time: $time, favorite: $favorite, steps: $steps)';
  }

  Meal.fromJson(Map<String, dynamic> data, String id)
      : id = id,
        name = data['name'] ?? '',
        category = data['category'] ?? '',
        image = data['image'] ?? '',
        calories = data['calories'] ?? 0,
        rating = data['rating'] ?? 0,
        time = data['time'] ?? 0,
        favorite = data['favorite'] ?? false,
        steps = List<String>.from(data['steps'] ?? []),
        isInCalendar = data['isInCalendar'] ?? false,
        date = (data['date'] != null && data['date'] is Timestamp)
            ? (data['date'] as Timestamp).toDate()
            : DateTime.now();
}
