import 'package:domasna_1/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

class MealRecip extends StatefulWidget {
  const MealRecip({super.key});

  @override
  State<MealRecip> createState() => _MealReciptState();
}

class _MealReciptState extends State<MealRecip> {
  List<String> steps = [];

  @override
  Widget build(BuildContext context) {
    setState(() {
      steps = ModalRoute.of(context)?.settings.arguments as List<String>;
    });
    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: steps.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                ),
                title: Text(steps[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
