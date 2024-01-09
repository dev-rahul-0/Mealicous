import 'package:flutter/material.dart';
import 'package:mealapk/CategoriesScreen.dart';
import 'package:mealapk/dummy.dart';
import 'package:mealapk/filters.dart';
import 'package:mealapk/main_drawer.dart';
import 'package:mealapk/meals.dart';

import 'meal.dart';

const kIntiatialFilters = {
  Filter.vegetarian: false,
  Filter.lactosefree:false,
  Filter.vegan:false,
  Filter.glutenfree:false
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectPageIndex = 0;
  final List<Meal> _favoriteMeals = [];
  Map<Filter,bool> _selectFilters = ;
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
        MaterialPageRoute(builder: (context)=> FilterScreen(currentFilters: _selectFilters,))
      );
      setState(() {
        _selectFilters = result ?? kIntiatialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectFilters[Filter.glutenfree]! && !meal.isGlutenFree){
        return false;
      }
      if (_selectFilters[Filter.vegan]! && !meal.isVegan){
        return false;
      }
      if (_selectFilters[Filter.lactosefree]! && !meal.isLactoseFree){
        return false;
      }
      if (_selectFilters[Filter.vegetarian]! && !meal.isVegetarian){
        return false;
      }
      return true;
    }).toList();
    Widget activePage =  CategoriesScreen(
      onToggleFavorite: _toggleMealFavoriteStatus,
      availableMeals: availableMeals,

    );
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
