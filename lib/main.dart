import 'package:flutter/material.dart';
import 'package:navigator2_flutter/pages/cart.page.dart';
import 'package:navigator2_flutter/pages/details.page.dart';
import 'package:navigator2_flutter/shop_controller.dart';

import 'pages/shopping.page.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ShopController _shopController;
  final pages = <MaterialPage>[];

  @override
  void initState() {
    _shopController = ShopController();
    _shopController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  var pageIndex = 0;
  late var currentPages = [pages[0]];

  @override
  Widget build(BuildContext context) {
    var controller = ShopController();
    return Navigator(
      pages: [
        const MaterialPage(
          child: ShoppingPage(),
        ),
        if (controller.hasItemSelected)
          MaterialPage(
            child: DetailsPage(
              itemShop: controller.selectedItem!,
            ),
          ),
        if (controller.isFinishing)
          MaterialPage(
              child: CartPage(
            itemShop: controller.itensShopCard,
          ))
      ],
      onPopPage: (route, result) {
        return route.didPop(result);
      },
    );
  }
}
