import 'package:domasna_1/models/meal.dart';
import 'package:domasna_1/widgets/cards/meal_card.dart';
import 'package:flutter/material.dart';

class MealGrid extends StatelessWidget {
  final String title;
  final List<Meal> meals;
  const MealGrid({super.key, required this.title, required this.meals});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(title),
      ),
      body: meals.isEmpty
          ? const Center(child: Text('Empty'))
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.0,
              ),
              itemCount: meals.length,
              itemBuilder: (context, index) {
                final meal = meals[index];
                return MealCard(item: meal);
              },
            ),
    );
  }
}
