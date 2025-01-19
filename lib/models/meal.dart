class Meal {
  final String id;
  final String name;
  final String category;
  final String image;
  final int calories;
  final double rating;
  final int time;

  Meal({
    this.id = "asd123",
    this.name = "Test name",
    this.category = "Pizza",
    this.image = "",
    this.calories = 100,
    this.rating = 10,
    this.time = 15,
  });

  @override
  String toString() {
    return 'Meal(name: $name, category: $category, image: $image, calories: $calories, rating: $rating, time: $time)';
  }

  Meal.fromJson(Map<String, dynamic> data)
      : id = data['Document_ID'],
        name = data['name'],
        category = data['category'],
        image = data['image'],
        calories = data['calories'],
        rating = data['rating'],
        time = data['time'];
}
