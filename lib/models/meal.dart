class Meal {
  final String id;
  final String name;
  final String category;
  final String image;
  final int calories;
  final int rating;
  final int time;
  bool favorite;

  Meal({
    this.id = "",
    this.name = "Pizza Italiana",
    this.category = "Pizza",
    this.image = "",
    this.calories = 100,
    this.rating = 10,
    this.time = 15,
    this.favorite = false,
  });

  @override
  String toString() {
    return 'Meal(id:$id, name: $name, category: $category, image: $image, calories: $calories, rating: $rating, time: $time, favorite: $favorite)';
  }

  Meal.fromJson(Map<String, dynamic> data, String id)
      : id = id,
        name = data['name'],
        category = data['category'],
        image = data['image'],
        calories = data['calories'],
        rating = data['rating'],
        time = data['time'],
        favorite = data['favorite'];
}
