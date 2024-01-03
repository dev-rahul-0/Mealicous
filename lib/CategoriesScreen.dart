import 'package:flutter/material.dart';
import 'package:mealapk/CategoriesGridItem.dart';
import 'package:mealapk/meals.dart';

import 'dummy.dart';
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});


  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) =>
            const MealsScreen(
              title: 'Some title',
              meals: [],
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(category: category,onSelectCategory: (){
              _selectCategory(context);
            },)
        ],
      ),
    );
  }
}
