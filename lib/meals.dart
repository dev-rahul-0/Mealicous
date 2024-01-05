

import 'package:flutter/material.dart';
import 'package:mealapk/meals_details.dart';
import 'package:mealapk/meals_item.dart';
import 'meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals, required this.onToggleFavorite});

  final String title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;
  void selectMeal(BuildContext context,Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MealDetailsScreen(meal: meal, onToggleFavorite: onToggleFavorite,)));
  }
  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemBuilder: (context, index) => Text(
              meals[index].title,
            ));
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Uh oh .... nothing here!'),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Try selecting a different category',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            )
          ],
        ),
      );
    }
    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) => MealItem(meal: meals[index], onSelectMeal: (meal){
            selectMeal(context, meal);
          },));
    }
    if(title == null){
      return content;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: content);
  }
}
