//import 'package:flutter/material.dart';
import 'package:shopping_list/models/category.dart';

class GroceryItem {
  const GroceryItem(
      {required this.id,
      required this.name,
      required this.quantity,
      required this.category});

  /// These lines are defining the properties of the `GroceryItem` class in Dart. Each `GroceryItem`
  /// object will have a unique `id` of type `String`, a `name` of type `String`, a `quantity` of type
  /// `int`, and a `category` of type `Category`. The `final` keyword indicates that these properties
  /// are immutable once they are set within the constructor of the `GroceryItem` class.
  final String id;
  final String name;
  final int quantity;
  final Category category;
}
