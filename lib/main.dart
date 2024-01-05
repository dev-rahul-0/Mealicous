import 'package:flutter/material.dart';
import 'package:mealapk/tabs.dart';

import 'CategoriesScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabsScreen(),
    );
  }
}
