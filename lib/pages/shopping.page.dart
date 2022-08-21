import 'package:flutter/material.dart';
import 'package:navigator2_flutter/model/item_shop.dart';
import 'package:navigator2_flutter/shop_controller.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  State<ShoppingPage> createState() => ShoppingPageState();
}

class ShoppingPageState extends State<ShoppingPage> {
  late ShopController controller;

  @override
  void initState() {
    controller = ShopController();
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping List"),
      ),
      body: ListView.builder(
        itemCount: examplesOfListItemShop.length,
        itemBuilder: (context, index) {
          return itemCard(examplesOfListItemShop[index]);
        },
      ),
    );
  }

  Widget itemCard(ItemShop itemShop) => Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.blue[200],
        ),
        child: ListTile(
          leading: const Icon(
            Icons.shop,
            color: Colors.black,
          ),
          title: Text(itemShop.name),
          subtitle: Text(itemShop.price.toString()),
          onTap: () => controller.selectItem(itemShop),
        ),
      );
}

final examplesOfListItemShop = <ItemShop>[
  ItemShop(1, "Bone", 10.0),
  ItemShop(2, "Blusa", 15.5),
  ItemShop(3, "Bermuda", 20.99),
  ItemShop(4, "Tenis", 30.50)
];
