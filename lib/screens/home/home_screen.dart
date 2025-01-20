import 'package:domasna_1/models/meal.dart';
import 'package:domasna_1/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> meals = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ApplicationProvider>().fetchMeals();
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ApplicationProvider>(context);
    meals = provider.meals;

    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 180,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF4C9482),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cook the best recipes\nat home',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                          ),
                          child: Text('Explore'),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/chef.png',
                      height: 150,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Categories Section
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryChip(label: 'Vegetarian'),
                    SizedBox(width: 8),
                    CategoryChip(label: 'Dinner'),
                    SizedBox(width: 8),
                    CategoryChip(label: 'Lunch'),
                    SizedBox(width: 8),
                    CategoryChip(label: 'Breakfast'),
                    SizedBox(width: 8),
                    CategoryChip(label: 'Snacks'),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Quick & Easy Section
              const Text(
                'Quick & Easy',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              meals.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: meals
                            .map((elemt) => MealCard(item: elemt))
                            .toList(),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;

  const CategoryChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}

class MealCard extends StatelessWidget {
  final Meal item;

  const MealCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () => {},
            child: SizedBox(
              width: 180,
              height: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.network(
                      item.image,
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.flash_on, color: Colors.grey, size: 16),
                            const SizedBox(width: 4),
                            Text('${item.calories} Cal'),
                            const SizedBox(width: 16),
                            Icon(Icons.access_time,
                                color: Colors.grey, size: 16),
                            const SizedBox(width: 4),
                            Text('${item.time} Min'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: const Color.fromARGB(255, 220, 198, 4),
                              size: 16,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text('${item.rating} / 5')
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
