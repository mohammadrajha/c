import 'package:flutter/foundation.dart';

class ItemProvider with ChangeNotifier {
  List<Item> _items = [];

  List<Item> get items => _items;

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(Item item) {
    _items.remove(item);
    notifyListeners();
  }
}

class Item with ChangeNotifier {
  final String name;
  final String price;
  final String image;

  Item({required this.name, required this.price, required this.image});
}
