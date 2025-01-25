import 'package:domasna_1/providers/app_provider.dart';
import 'package:domasna_1/widgets/grids/meal_grid.dart';
import 'package:domasna_1/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlanedMeals extends StatefulWidget {
  const PlanedMeals({super.key});

  @override
  State<PlanedMeals> createState() => _PlanedMealsState();
}

class _PlanedMealsState extends State<PlanedMeals> {
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final storage = Provider.of<ApplicationProvider>(context);
    setState(() {
      date = ModalRoute.of(context)?.settings.arguments as DateTime;
    });

    return Scaffold(
        appBar: MyAppBar(),
        body: MealGrid(
          title: "Planeed meals for date",
          meals: storage.mealPlan[date] ?? [],
          isForPlanedMeals: true,
        ));
  }
}
