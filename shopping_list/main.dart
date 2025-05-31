import 'package:flutter/material.dart';
import 'package:shopping_list/wigets/grocery_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Groceries',
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 147, 229, 250),
          brightness: Brightness.dark,
          surface: const Color.fromARGB(255, 42, 51, 59),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60),
      ),
      home:

          /// `const GroceryList(),` is creating an instance of the `GroceryList` widget with const
          /// constructor. This means that the `GroceryList` widget is being created with compile-time
          /// constant values, which can help with performance optimization.
          const GroceryList(),
    );
  }
}
