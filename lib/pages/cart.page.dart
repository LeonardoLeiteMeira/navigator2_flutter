import 'package:flutter/material.dart';

import '../model/item_shop.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key, required this.itemShop}) : super(key: key);
  final List<ItemShop> itemShop;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Container(
          decoration: const BoxDecoration(color: Colors.yellow),
          child: Container(
            alignment: Alignment.center,
            child: ListView.builder(
                itemCount: widget.itemShop.length,
                itemBuilder: (context, index) {
                  return CardItem(itemShop: widget.itemShop[index]);
                }),
          )),
    );
  }
}

class CardItem extends StatelessWidget {
  final ItemShop itemShop;
  const CardItem({Key? key, required this.itemShop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text(itemShop.name),
    ));
  }
}
