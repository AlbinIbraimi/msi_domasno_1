class Ingredient {
  final String id;
  final int amount;
  final String image;
  final String name;

  Ingredient({
    this.id = "",
    this.name = "Meet",
    this.image = "",
    this.amount = 100,
  });

  @override
  String toString() {
    return 'Meal(id:$id, name: $name, image: $image, amount: $amount)';
  }

  Ingredient.fromJson(Map<String, dynamic> data, String id)
      : id = id,
        name = data['name'],
        image = data['image'],
        amount = data['amount'];
}
