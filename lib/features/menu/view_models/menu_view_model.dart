import 'package:flutter/material.dart';
import 'package:st_genetics/features/menu/models/menu_item_model.dart';
import 'package:st_genetics/features/menu/view_models/services/menu_service.dart';

class MenuItemViewModel with ChangeNotifier {
  List<MenuItem> _menuItems = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  MenuItemViewModel();

  List<MenuItem> get menuItems {
    if (_menuItems.isEmpty) {
      getMenuItems();
    }
    return _menuItems;
  }

  Future<void> getMenuItems() async {
    _isLoading = true;
    notifyListeners();
    _menuItems = await fetchMenuData();
    _isLoading = false;
    notifyListeners();
  }
}
