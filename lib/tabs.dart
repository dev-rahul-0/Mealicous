import 'package:flutter/material.dart';
import 'package:mealapk/CategoriesScreen.dart';
import 'package:mealapk/filters.dart';
import 'package:mealapk/main_drawer.dart';
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
  Map<Filter,bool> _selectFilters = {
    Filter.vegetarian: false,
    Filter.lactosefree:false,
    Filter.vegan:false,
    Filter.glutenfree:false
  };
  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }

  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);
    if(isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
      });
      _showInfoMessage('Meal is no longer a favorite');
    }else {
      setState(() {
        _favoriteMeals.add(meal);
      });
      _showInfoMessage('Marked as a favorite');
    }
  }

  void _selectPage(int index){
    setState(() {
    _selectPageIndex = index;
    });
  }

  void _setScreen(String identifier) async{
    Navigator.of(context).pop();
    if(identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter,bool>>(
        MaterialPageRoute(builder: (context)=> FilterScreen())
      );
      setState(() {
        _selectFilters = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage =  CategoriesScreen(onToggleFavorite: _toggleMealFavoriteStatus,);
    var activePageTitle = 'Categories';
    if(_selectPageIndex == 1) {
      activePage = MealsScreen(title: 'Favorites', meals: _favoriteMeals, onToggleFavorite: _toggleMealFavoriteStatus,);
      activePageTitle = 'Your Favorites';
    }
    return Scaffold(appBar: AppBar(
      title: Text(activePageTitle),
    ),
    drawer: MainDrawer(onSelectScreen: _setScreen,),
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
