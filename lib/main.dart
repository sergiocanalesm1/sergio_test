import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:st_genetics/features/cart/view_models/cart_view_model.dart';
import 'package:st_genetics/features/menu/view_models/menu_view_model.dart';
import 'package:st_genetics/features/menu/views/menu_view.dart';
import 'package:st_genetics/features/payment/view_models/payment_view_models.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MenuItemViewModel()),
      ChangeNotifierProvider(create: (_) => CartViewModel()),
      ChangeNotifierProvider(create: (_) => PaymentViewModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bom Hamburgers',
        home: MenuListView());
  }
}
