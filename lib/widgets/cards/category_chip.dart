import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String label;

  const CategoryChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: InkWell(
            radius: 100,
            onTap: () =>
                {Navigator.pushNamed(context, '/cateegory', arguments: label)},
            child: Chip(
              label: Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            )));
  }
}
