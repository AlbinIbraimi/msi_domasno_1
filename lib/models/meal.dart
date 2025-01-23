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

  Meal(
      {this.id = "",
      this.name = "Pizza Italiana",
      this.category = "Pizza",
      this.image = "",
      this.calories = 100,
      this.rating = 10,
      this.time = 15,
      this.favorite = false,
      this.steps = const []});

  @override
  String toString() {
    return 'Meal(id:$id, name: $name, category: $category, image: $image, calories: $calories, rating: $rating, time: $time, favorite: $favorite, steps: $steps)';
  }

  Meal.fromJson(Map<String, dynamic> data, String id)
      : id = id,
        name = data['name'],
        category = data['category'],
        image = data['image'],
        calories = data['calories'],
        rating = data['rating'],
        time = data['time'],
        favorite = data['favorite'],
        steps = List<String>.from(data['steps'] ?? []);
}
