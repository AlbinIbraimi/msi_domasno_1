import 'package:domasna_1/providers/app_provider.dart';
import 'package:domasna_1/widgets/grids/meal_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryMeals extends StatefulWidget {
  const CategoryMeals({super.key});

  @override
  State<CategoryMeals> createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String category = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (category.isNotEmpty) {
        context.read<ApplicationProvider>().fetchCategoryMeals(category);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final label = ModalRoute.of(context)?.settings.arguments as String;
    setState(() {
      category = label;
    });
    final storage = Provider.of<ApplicationProvider>(context);

    return Scaffold(
        body: MealGrid(title: category, meals: storage.mealsforCateogry));
  }
}
