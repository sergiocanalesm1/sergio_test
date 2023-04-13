import 'package:flutter/material.dart';
import 'package:st_genetics/features/menu/models/menu_item_model.dart';

List<Widget> cartSummary(BuildContext context, List<MenuItem> cart,
    double total, double discount, double totalWithDiscount) {
  return [
    ...cart.map((item) {
      return Row(
        children: [
          Expanded(child: Center(child: Text(item.name))),
          Expanded(child: Center(child: Text("${item.price.toString()} \$"))),
        ],
      );
    }).toList(),
    const SizedBox(height: 50),
    const Text(
      "Total",
      style: TextStyle(fontSize: 20),
    ),
    const SizedBox(height: 20),
    Text(
      "Total  $total \$",
      style: const TextStyle(color: Colors.green),
    ),
    Text(
      "Discount  ${discount * 100}%",
      style: const TextStyle(color: Colors.red),
    ),
    const SizedBox(height: 10),
    Text("Amount due ${totalWithDiscount.toStringAsFixed(1)} \$"),
  ];
}
