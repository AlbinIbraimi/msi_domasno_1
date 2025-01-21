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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ApplicationProvider>().fetchFavoriteMelas();
    });
  }

  @override
  Widget build(BuildContext context) {
    final storage = Provider.of<ApplicationProvider>(context);
    return MealGrid(title: "FavoriteMeals", meals: storage.favoriteMeals);
  }
}
