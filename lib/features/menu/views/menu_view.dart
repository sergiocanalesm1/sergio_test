import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:st_genetics/commons/widgets/appbar_widget.dart';
import 'package:st_genetics/features/cart/view_models/cart_view_model.dart';
import 'package:st_genetics/features/cart/views/cart_view.dart';
import 'package:st_genetics/features/menu/view_models/menu_view_model.dart';

class MenuListView extends StatelessWidget {
  const MenuListView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MenuItemViewModel>();

    return state.isLoading
        ? Container()
        : Scaffold(
            appBar: appBar(context),
            body: Padding(
              padding: const EdgeInsets.all(25),
              child: ListView.builder(
                itemCount: state.menuItems.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                          child: Card(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          //leading: Text(items[index]["id"].toString()),
                          title: Text(state.menuItems[index].name),
                          subtitle: Text(state.menuItems[index].type),
                          trailing: Text(
                              "${state.menuItems[index].price.toString()} \$"),
                        ),
                      )),
                      IconButton(
                        color: Theme.of(context).primaryColor,
                        iconSize: 30,
                        icon: const Icon(Icons.add_circle_outline),
                        onPressed: () => context
                            .read<CartViewModel>()
                            .addItem(state.menuItems[index]),
                      ),
                    ],
                  );
                },
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.shopping_cart),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return const CartView();
                  },
                );
              },
            ),
          );
  }
}
