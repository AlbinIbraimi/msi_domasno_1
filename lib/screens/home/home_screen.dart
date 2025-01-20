import 'package:domasna_1/providers/app_provider.dart';
import 'package:domasna_1/widgets/cards/category_chip.dart';
import 'package:domasna_1/widgets/cards/meal_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ApplicationProvider>().fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ApplicationProvider>(context);
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
                    children: provider.cateogries
                        .map((item) => CategoryChip(label: item))
                        .toList()),
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
              provider.meals.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: provider.meals
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
