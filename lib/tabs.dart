import 'package:flutter/material.dart';
import 'package:mealapk/CategoriesScreen.dart';
import 'package:mealapk/meals.dart';

import 'meal.dart';
class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectPageIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);
    if(isExisting) {
      _favoriteMeals.remove(meal);
    }else {
      _favoriteMeals.add(meal);
    }
  }

  void _selectPage(int index){
    setState(() {
    _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const CategoriesScreen();
    var activePageTitle = 'Categories';
    if(_selectPageIndex == 1) {
      activePage = MealsScreen(title: 'Favorites', meals: [], onToggleFavorite: _toggleMealFavoriteStatus,);
      activePageTitle = 'Your Favorites';
    }
    return Scaffold(appBar: AppBar(
      title: Text(activePageTitle),
    ),
    body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectPageIndex,
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.set_meal),label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star),label: 'Favorites'),
        ]

      ),
    );
  }
}