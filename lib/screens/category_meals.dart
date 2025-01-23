import 'package:domasna_1/providers/app_provider.dart';
import 'package:domasna_1/widgets/grids/meal_grid.dart';
import 'package:domasna_1/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryMeals extends StatefulWidget {
  const CategoryMeals({super.key});

  @override
  State<CategoryMeals> createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String category = "";
  bool inProgress = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (category.isNotEmpty) {
        var storage = context.read<ApplicationProvider>();
        storage.mealsforCateogry.clear();
        storage.fetchCategoryMeals(category).then((_) => {inProgress = false});
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
        appBar: MyAppBar(),
        body: inProgress
            ? const Center(child: CircularProgressIndicator())
            : MealGrid(title: category, meals: storage.mealsforCateogry));
  }
}
