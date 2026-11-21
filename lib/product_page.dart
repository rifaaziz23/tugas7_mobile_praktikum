import 'package:flutter/material.dart';
import 'package:tugas7_provider/cart_model.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final List<Product> products = [
    Product("Laptop", "Ini Deskripsi Laptop"),
    Product("PS5", "Ini Deskripsi PS5"),
    Product("Alat Pijak", "Ini Deskripsi Alat Pijak"),
    Product("AC", "Ini Deskripsi AC"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        title: Text("TokoPaedi", style: TextStyle(fontWeight: .bold)),
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.only(right: 20),
            child: Consumer<CartModel>(
              builder: (context, cart, child) {
                return Badge(
                  label: Text('${cart.totalItems}'),
                  isLabelVisible: cart.totalItems > 0,
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartPage()),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            tileColor: Colors.amber,
            title: Text(product.nama),
            subtitle: Text(product.deskripsi),
            trailing: IconButton(
              onPressed: () {
                Provider.of<CartModel>(context, listen: false).add(product);
              },
              icon: Icon(Icons.shopping_cart_checkout),
            ),
          );
        },
      ),
    );
  }
}
