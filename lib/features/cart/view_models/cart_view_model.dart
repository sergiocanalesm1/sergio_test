import 'package:flutter/material.dart';
import 'package:st_genetics/features/menu/models/menu_item_model.dart';

class CartViewModel with ChangeNotifier {
  List<MenuItem> _cart = [];
  int _countSandwich = 0;
  int _countFries = 0;
  int _countSoftDrink = 0;
  double _total = 0;
  double _discount = 0;

  CartViewModel();

  List<MenuItem> get cart => _cart;
  double get discount => _discount;
  double get total => _total;
  int get countSandwich => _countSandwich;
  int get countFries => _countFries;
  int get countSoftDrink => _countSoftDrink;

  void cleanBasket() {
    _cart = [];
    _countSandwich = 0;
    _countFries = 0;
    _countSoftDrink = 0;
    _total = 0;
    _discount = 0;
    notifyListeners();
  }

  void addItem(MenuItem menuItem) {
    if (menuItem.type == "Sandwich") {
      _countSandwich++;
    } else if (menuItem.name == "Fries") {
      _countFries++;
    } else if (menuItem.name == "Soft Drink") {
      _countSoftDrink++;
    }
    _total += menuItem.price;
    _cart.add(menuItem);
    _calculateDiscount();
    notifyListeners();
  }

  void _calculateDiscount() {
    if (_cart.length == 3 &&
        _countFries == 1 &&
        _countSandwich == 1 &&
        _countSoftDrink == 1) {
      _discount = 0.2;
    }
    if (_cart.length == 2) {
      if (_countSandwich == 1 && _countFries == 1) {
        _discount = 0.1;
      }
      if (_countSandwich == 1 && _countSoftDrink == 1) {
        _discount = 0.15;
      }
    }
  }

  double getTotalWithDiscount() {
    return _total * (1 - _discount);
  }
}
