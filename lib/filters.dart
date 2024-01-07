import 'package:flutter/material.dart';
import 'package:mealapk/main_drawer.dart';
import 'package:mealapk/tabs.dart';
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
      body: Column(
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
          )
        ],
      ),
    );
  }
}
