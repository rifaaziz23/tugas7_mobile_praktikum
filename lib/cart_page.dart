import 'package:flutter/material.dart';
import 'package:tugas7_provider/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Keranjang"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          if (cart.totalItems == 0) {
            return Text("Gada Produknya beh");
          }

          return ListView.builder(
            itemCount: cart.totalItems,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(cart.items[index].nama),
                trailing: IconButton(
                  onPressed: () {
                    cart.removeAt(index);
                  },
                  icon: Icon(Icons.delete),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
