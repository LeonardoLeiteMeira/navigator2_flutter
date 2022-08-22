import 'package:flutter/material.dart';
import 'package:navigator2_flutter/shop_controller.dart';

import '../model/item_shop.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late ShopController _controller;

  @override
  void initState() {
    _controller = ShopController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => _controller.cancelFinish(),
        ),
      ),
      body: Container(
          decoration: const BoxDecoration(color: Colors.yellow),
          child: Container(
            alignment: Alignment.center,
            child: ListView.builder(
                itemCount: _controller.itensShopCard.length,
                itemBuilder: (context, index) {
                  return CardItem(itemShop: _controller.itensShopCard[index]);
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
