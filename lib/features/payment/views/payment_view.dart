import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:st_genetics/commons/widgets/appbar_widget.dart';
import 'package:st_genetics/commons/widgets/cart_summary_widgets.dart';
import 'package:st_genetics/features/cart/view_models/cart_view_model.dart';
import 'package:st_genetics/features/payment/view_models/payment_view_models.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _showMyDialog(BuildContext context, String customerName,
      bool approved, Function callback) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              Text(approved ? "Thanks $customerName !" : "Sorry $customerName"),
          content: Text(approved
              ? "your order was successful"
              : "You can choose at max one sandwich, one fries and one soft drink"),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                callback();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartState = context.watch<CartViewModel>();
    final summary = cartSummary(context, cartState.cart, cartState.total,
        cartState.discount, cartState.getTotalWithDiscount());

    final state = context.watch<PaymentViewModel>();

    return Scaffold(
        appBar: appBar(context),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const Text(
                "Payment",
                style: TextStyle(fontSize: 30, color: Colors.blue),
              ),
              const SizedBox(height: 50),
              ...summary,
              const SizedBox(height: 50),
              const Text("Please enter your name"),
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
                onSubmitted: (String value) {
                  context.read<PaymentViewModel>().makePayment(
                      cartState.cart,
                      value,
                      cartState.countSandwich,
                      cartState.countFries,
                      cartState.countSoftDrink);
                  _showMyDialog(context, state.customerName, state.approved,
                      () {
                    context.read<PaymentViewModel>().clearPayment();
                  });
                },
              ),
            ],
          ),
        ));
  }
}
