import 'package:domasna_1/models/meal.dart';
import 'package:flutter/material.dart';

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
