import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:st_genetics/features/menu/models/menu_item_model.dart';

Future<List<MenuItem>> fetchMenuData() {
  return rootBundle.loadString('assets/menu.json').then((response) {
    final data = json.decode(response)["menu"] as List;
    return data.map((json) => MenuItem.fromJson(json)).toList();
  });
}
