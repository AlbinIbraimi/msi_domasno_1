import 'package:domasna_1/models/meal.dart';
import 'package:domasna_1/widgets/grids/meal_grid.dart';
import 'package:domasna_1/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

class PlanedMeals extends StatefulWidget {
  const PlanedMeals({super.key});

  @override
  State<PlanedMeals> createState() => _PlanedMealsState();
}

class _PlanedMealsState extends State<PlanedMeals> {
  List<Meal> meals = [];

  @override
  Widget build(BuildContext context) {
    setState(() {
      meals = ModalRoute.of(context)?.settings.arguments as List<Meal>;
    });

    return Scaffold(
        appBar: MyAppBar(),
        body: MealGrid(title: "Planeed meals for date", meals: meals));
  }
}
