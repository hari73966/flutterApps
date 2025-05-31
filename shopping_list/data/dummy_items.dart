import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/data/categories.dart';

final groceryItems = [
  GroceryItem(
      id: 'a',
      name: 'Milk',
      quantity: 1,
      category: categories[Categories.dairy]!),

  /// This code snippet is creating a `GroceryItem` object with the following properties:
  /// - `id` set to 'b'
  /// - `name` set to 'Bananas'
  /// - `quantity` set to 5
  /// - `category` set to the category retrieved from the `categories` map using the key
  /// `Categories.fruit`
  GroceryItem(
      id: 'b',
      name: 'Bananas',
      quantity: 5,
      category: categories[Categories.fruit]!),
  GroceryItem(
      id: 'c',
      name: 'Beef Steak',
      quantity: 1,
      category: categories[Categories.meat]!),
];
