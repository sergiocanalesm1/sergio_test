import 'package:flutter/material.dart';
import 'package:st_genetics/features/menu/models/menu_item_model.dart';

class PaymentViewModel with ChangeNotifier {
  //final List<MenuItem> _cart = [];
  String _customerName = "";
  bool _approved = false;

  PaymentViewModel();

  //List<MenuItem> get cart => _cart;
  String get customerName => _customerName;
  bool get approved => _approved;

  void makePayment(List<MenuItem> cart, String customerName, int countSandwich,
      int countFries, int countSoftDrink) {
    _customerName = customerName;
    if (countSandwich < 2 && countFries < 2 && countSoftDrink < 2) {
      _approved = true;
      notifyListeners();
    }
  }

  void clearPayment() {
    _approved = false;
    notifyListeners();
  }
}
