import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:st_genetics/commons/widgets/cart_summary_widgets.dart';
import 'package:st_genetics/features/cart/view_models/cart_view_model.dart';
import 'package:st_genetics/features/payment/views/payment_view.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CartViewModel>();
    final summary = cartSummary(context, state.cart, state.total,
        state.discount, state.getTotalWithDiscount());
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          const Text(
            "Cart",
            style: TextStyle(fontSize: 30, color: Colors.blue),
          ),
          const SizedBox(height: 50),
          ...summary,
          const Spacer(),
          Row(
            children: [
              Expanded(
                  child: IconButton(
                color: Theme.of(context).primaryColor,
                iconSize: 50,
                icon: const Icon(Icons.clear),
                onPressed: () => context.read<CartViewModel>().cleanBasket(),
              )),
              Expanded(
                  child: IconButton(
                color: Theme.of(context).primaryColor,
                iconSize: 50,
                icon: const Icon(Icons.monetization_on_sharp),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PaymentView(),
                    ),
                  );
                },
              )),
            ],
          )
        ],
      ),
    );
  }
}
