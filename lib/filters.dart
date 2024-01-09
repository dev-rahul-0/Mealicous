import 'package:flutter/material.dart';
import 'package:mealapk/main_drawer.dart';
import 'package:mealapk/tabs.dart';

enum Filter{
  glutenfree,
  lactosefree,
  vegetarian,
  vegan
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier){
      //   Navigator.of(context).pop();
      //   if (identifier == 'meals'){
      //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const TabsScreen()));
      //   }
      // },),
      body: WillPopScope(
        onWillPop: () async{
          Navigator.of(context).pop(
            {
              Filter.vegan : _veganFilterSet,
              Filter.glutenfree : _glutenFreeFilterSet,
              Filter.lactosefree:_lactoseFreeFilterSet,
              Filter.vegetarian:_vegetarianFilterSet
            }
          );
          return false;
    },
        child: Column(
          children: [
            SwitchListTile(value: _lactoseFreeFilterSet,
                onChanged: (isChecked){
              setState(() {
                  _lactoseFreeFilterSet = isChecked;
              });
                },
            title: Text('Lactose-free',style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            )),
              subtitle: Text('Only include Lactose-free meals.',style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
              ),),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34,right: 22),
            ),
            SwitchListTile(value: _vegetarianFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _vegetarianFilterSet = isChecked;
                });
              },
              title: Text('Vegetarian-free',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              )),
              subtitle: Text('Only include Vegetarian-free meals.',style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground
              ),),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34,right: 22),
            ),
            SwitchListTile(value: _glutenFreeFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              },
              title: Text('Gluten-free',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              )),
              subtitle: Text('Only include Gluten-free meals.',style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground
              ),),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34,right: 22),
            ),
            SwitchListTile(value: _veganFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _veganFilterSet = isChecked;
                });
              },
              title: Text('Vegan-free',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              )),
              subtitle: Text('Only include Vegan-free meals.',style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground
              ),),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34,right: 22),
            )
          ],
        ),
      ),
    );
  }
}
