import 'package:domasna_1/models/meal.dart';
import 'package:domasna_1/providers/app_provider.dart';
import 'package:domasna_1/widgets/buttons/default_buttons.dart';
import 'package:domasna_1/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealDetails extends StatefulWidget {
  const MealDetails({super.key});

  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  Meal item = Meal();
  bool inProgress = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (item.id != "") {
        var storage = context.read<ApplicationProvider>();
        storage.ingredients.clear();
        storage
            .fetchIngredientsForMeal(item.id)
            .then((_) => {inProgress = false});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final storage = Provider.of<ApplicationProvider>(context);
    setState(() {
      item = ModalRoute.of(context)?.settings.arguments as Meal;
    });
    return Scaffold(
      appBar: MyAppBar(),
      body: inProgress
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Image.network(
                  item.image,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(Icons.flash_on,
                                      color: Colors.grey, size: 16),
                                  const SizedBox(width: 4),
                                  Text('${item.calories} Cal'),
                                  const SizedBox(width: 5),
                                  const Icon(Icons.access_time,
                                      color: Colors.grey, size: 16),
                                  const SizedBox(width: 2),
                                  Text('${item.time} Min'),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(Icons.star, color: Colors.amber),
                                  const SizedBox(width: 4),
                                  Text(
                                      '${item.rating}/5 (${item.rating.ceil()} Reviews)'),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  DefaultButton(
                                    onPressed: () {},
                                    text: "Start Cooking",
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Icon(Icons.calendar_month),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        "Ingredients",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView.builder(
                    itemCount: storage.ingredients.length,
                    itemBuilder: (context, index) {
                      final ingredient = storage.ingredients[index];
                      return ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            ingredient.image,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(ingredient.name),
                        trailing: Text("${ingredient.amount} gm"),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
