import 'package:domasna_1/providers/app_provider.dart';
import 'package:domasna_1/widgets/grids/meal_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool inProgress = true;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var storage = context.read<ApplicationProvider>();
      storage.favoriteMeals.clear();
      storage.fetchFavoriteMelas().then((_) => {inProgress = false});
    });
  }

  @override
  Widget build(BuildContext context) {
    final storage = Provider.of<ApplicationProvider>(context);
    return Container(
        child: inProgress
            ? const Center(child: CircularProgressIndicator())
            : MealGrid(title: "FavoriteMeals", meals: storage.favoriteMeals));
  }
}
