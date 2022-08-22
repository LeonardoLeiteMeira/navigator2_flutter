import 'package:flutter/material.dart';

import '../shop_controller.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late ShopController controller;

  @override
  void initState() {
    controller = ShopController();
    super.initState();
  }

  void _showSnackBar(String message, context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Page"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            controller.unselectItem();
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Details of select item:",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              "Id: ${controller.selectedItem!.id.toString()}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              "Name: ${controller.selectedItem!.name}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              "Price R\$${controller.selectedItem!.price.toString()}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              child: const Text("Add to cart", style: TextStyle(fontSize: 16)),
              onPressed: () {
                controller.addItemInCart(controller.selectedItem!);
                _showSnackBar("Add with success", context);
              },
            ),
            ElevatedButton(
              child: const Text("Finalize Purchase",
                  style: TextStyle(fontSize: 16)),
              onPressed: () {
                controller.isFinishing = true;
              },
            )
          ],
        ),
      ),
    );
  }
}
